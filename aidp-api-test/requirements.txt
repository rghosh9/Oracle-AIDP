# =============================================================================
# AIDP API Test Configuration
# Fill in these values before running any test.
# =============================================================================

# OCI CLI profile name from ~/.oci/config
OCI_PROFILE = "DEFAULT"

# OCI region (e.g. "us-ashburn-1", "eu-frankfurt-1")
REGION = "us-ashburn-1"

# AIDP instance OCID (from stack-3 terraform output)
AIDP_INSTANCE_ID = "ocid1.aidataplatform.oc1..."

# Compartment OCID (from stack-1 terraform output)
COMPARTMENT_ID = "ocid1.compartment.oc1..."

# =============================================================================
# Workspace
# =============================================================================

# For PATH B (find existing): the auto-created workspace name (e.g. "ChatAPPDemoWS")
EXISTING_WORKSPACE_NAME = "ChatAPPDemoWS"

# For PATH A (create new private workspace): name and network config
NEW_WORKSPACE_NAME = "ChatAPPDemoWSPrivate"
VCN_ID = "ocid1.vcn.oc1..."
SUBNET_ID = "ocid1.subnet.oc1..."
NSG_ID = "ocid1.networksecuritygroup.oc1..."   # leave "" to omit

# Workspace key returned from test_02 / test_03 — fill in for cluster/catalog tests
WORKSPACE_KEY = ""

# =============================================================================
# ADW Catalog
# =============================================================================

CATALOG_NAME = "ChatAPPDemoWS_adw_catalog"

# Path to the wallet zip file (relative or absolute)
ADW_WALLET_ZIP = "./Wallet_aidpdb.zip"
ADW_WALLET_PASSWORD = "WalletPass123"
ADW_USERNAME = "ADMIN"
ADW_PASSWORD = "DBAdminPass123!"
ADW_TNS_ALIAS = "aidpdb_low"         # e.g. aidpdb_low / aidpdb_high

# =============================================================================
# Compute Cluster
# =============================================================================

CLUSTER_NAME = "Cluster1"
DRIVER_OCPUS = 2
DRIVER_MEMORY_GBS = 32
WORKER_OCPUS = 2
WORKER_MEMORY_GBS = 32
MIN_WORKERS = 1
MAX_WORKERS = 2

# Cluster key returned from test_06 — fill in for connection-details test
CLUSTER_KEY = ""
