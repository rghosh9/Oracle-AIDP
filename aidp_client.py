"""
AIDP dataplane client — OCI API Key auth from ~/.oci/config
Extracted from aidp_setup.py for standalone testing.
"""

import json
import time

import oci
import requests
from oci.signer import Signer


class AIDPAPIError(Exception):
    pass


class AIDPClient:
    API_VERSION = "20240831"

    def __init__(self, region: str, aidp_instance_id: str, profile: str = "DEFAULT"):
        config = oci.config.from_file(profile_name=profile)
        config["region"] = region
        self.base_url = (
            f"https://aidp.{region}.oci.oraclecloud.com"
            f"/{self.API_VERSION}/dataLakes/{aidp_instance_id}"
        )
        self.signer = Signer(
            tenancy=config["tenancy"],
            user=config["user"],
            fingerprint=config["fingerprint"],
            private_key_file_location=config.get("key_file"),
            pass_phrase=config.get("pass_phrase"),
            private_key_content=config.get("key_content"),
        )

    def request(self, method: str, path: str, body=None, timeout: int = 30):
        url = self.base_url + path
        headers = {"Content-Type": "application/json", "Accept": "application/json"}
        resp = requests.request(method, url, json=body, headers=headers,
                                auth=self.signer, timeout=timeout)
        return resp

    def get(self, path: str, timeout: int = 30):
        return self.request("GET", path, timeout=timeout)

    def post(self, path: str, body: dict, timeout: int = 60):
        return self.request("POST", path, body=body, timeout=timeout)

    def put(self, path: str, body: dict, timeout: int = 60):
        return self.request("PUT", path, body=body, timeout=timeout)

    def delete(self, path: str, timeout: int = 30):
        return self.request("DELETE", path, timeout=timeout)


def poll_until_active(client: AIDPClient, path: str, label: str,
                      target_states=("ACTIVE", "RUNNING"),
                      poll_interval: int = 15, max_wait: int = 600):
    """Poll a GET endpoint until lifecycleState is in target_states."""
    print(f"  Polling {label} ", end="", flush=True)
    deadline = time.time() + max_wait
    while time.time() < deadline:
        resp = client.get(path, timeout=30)
        if resp.ok:
            data = resp.json()
            state = data.get("lifecycleState", data.get("state", "?")).upper()
            if state in [s.upper() for s in target_states]:
                print(f" [{state}]")
                return data
            if state in ("FAILED", "DELETED", "INACTIVE"):
                print(f" [{state}]")
                raise AIDPAPIError(f"{label} entered state {state}")
            print(".", end="", flush=True)
        else:
            print(f"(HTTP {resp.status_code})", end="", flush=True)
        time.sleep(poll_interval)
    raise AIDPAPIError(f"{label} did not reach {target_states} within {max_wait}s")


def print_response(resp, label: str = ""):
    """Pretty-print an HTTP response for test output."""
    tag = f" [{label}]" if label else ""
    print(f"  HTTP {resp.status_code}{tag}")
    if resp.content:
        try:
            print(json.dumps(resp.json(), indent=2, default=str))
        except Exception:
            print(resp.text[:800])
    print()
