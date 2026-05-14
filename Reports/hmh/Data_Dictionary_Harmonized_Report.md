# Data Dictionary Harmonized Report

Generated: 2026-05-14 10:45

Source: `C:\Users\Rajib Ghosh\Documents\I-sp-team\Hackensack\HMH_Datasets\HMH_Datasets\Data_Dictionary_Harmonized.csv`

This is a metadata and data-quality report for the harmonized data dictionary.

## Executive Summary

The file contains 7,286 rows, 9 columns, 291 modules, 220 nonblank page names, and 4,349 distinct nonblank item names. After excluding blank/space-only item-name rows, there are 7,020 field-definition rows.

The dictionary includes 266 blank or space-only `ITM_NAME` rows that appear to be module header/title rows. Item types normalize into 6 nonblank categories, led by `NUMBER`, `CHAR`, and `DATE`.

The biggest standardization issues are blank page names (2,711 rows, 37.21%), mixed type/boolean casing, blank required/unique flags on 2,604 non-header rows, and 19 duplicate module-item groups.

## Type Summary

| Type | Rows | Field Rows | Required True | Unique True | Blank Required | Blank Length | Blank Decimal |
| --- | --- | --- | --- | --- | --- | --- | --- |
| NUMBER | 4503 | 4503 | 505 | 49 | 1892 | 402 | 1 |
| CHAR | 1477 | 1477 | 584 | 196 | 563 | 158 | 1407 |
| DATE | 720 | 720 | 546 | 1 | 62 | 705 | 710 |
| (blank) | 267 | 1 | 0 | 0 | 267 | 267 | 267 |
| TEXT | 189 | 189 | 75 | 28 | 65 | 67 | 184 |
| TIME | 88 | 88 | 0 | 0 | 21 | 66 | 73 |
| BOOLEAN | 42 | 42 | 1 | 0 | 0 | 42 | 42 |

## Largest Modules

| Module | Rows | Field Rows | Pages | Blank Type Rows | Required True | Unique True |
| --- | --- | --- | --- | --- | --- | --- |
| RFQ_pesticides_at_work | 474 | 473 | 0 | 1 | 0 | 0 |
| RFQ_caffeine | 245 | 244 | 0 | 1 | 0 | 0 |
| RFQ_toxicant | 165 | 164 | 0 | 1 | 0 | 0 |
| RFQ_calcium_channel_blocker_medication_history | 152 | 151 | 0 | 1 | 0 | 0 |
| GAIT_AXIVITY | 110 | 109 | 0 | 1 | 0 | 0 |
| UPSIT | 99 | 98 | 1 | 1 | 10 | 1 |
| RFQ_residential | 83 | 82 | 0 | 1 | 0 | 0 |
| RFQ_occupation | 80 | 79 | 0 | 1 | 0 | 0 |
| XI_DATSCAN_SBR | 76 | 75 | 0 | 1 | 7 | 3 |
| EARLY_INT_SURVEY | 74 | 73 | 1 | 1 | 6 | 0 |
| FS7_APARC_CTH | 73 | 72 | 1 | 1 | 0 | 0 |
| FS7_APARC_SA | 73 | 72 | 1 | 1 | 0 | 0 |
| NUPDRS3TRT | 70 | 69 | 1 | 1 | 8 | 1 |
| LAB | 68 | 67 | 1 | 1 | 8 | 1 |
| WB_SUBSTUDY | 68 | 67 | 1 | 1 | 10 | 1 |

## Data Quality Notes

| Check | Result | Status |
| --- | --- | --- |
| Rows | 7286 | Info |
| Columns | 9 | Info |
| Module names blank | 0 | OK |
| Header/title rows with blank item name | 266 | Info |
| Field rows with blank item type | 1 | Review |
| Blank descriptions | 7 | Review |
| Exact duplicate rows | 0 | OK |
| Duplicate module + item rows | 38 | Review |
| Duplicate module + item groups | 19 | Review |
| Modules without header/title row | 25 | Review |
| ITM_TYPE values needing normalization | 22 | Review |
| Boolean casing variants present | True/TRUE and False/FALSE | Review |
| Non-header field rows with blank required flag | 2604 | Review |
| Non-header field rows with blank unique flag | 2604 | Review |
| FLD_LEN nonblank parse failures | 0 | OK |
| DECML nonblank parse failures | 0 | OK |
| NUMBER rows with blank DECML | 1 | Review |
| Non-NUMBER rows with nonblank DECML | 100 | Review |

The duplicate module-item groups are largely derived neuropsychological score rows where the same item appears once with a page name and once without. These may be intentional harmonized/derived-field definitions, but they should be explicitly documented so downstream joins do not assume `MOD_NAME + ITM_NAME` is unique.

## Recommended Next Steps

1. Standardize `ITM_TYPE` values (`Number` to `NUMBER`, `CHARACTER` to `CHAR`).
2. Standardize required/unique flag casing and decide whether blank should mean false, unknown, or not applicable.
3. Fill or explicitly mark not-applicable page names for the large blank `PAG_NAME` block.
4. Review the `iu_genetic_consensus / IU_Fingerprint` row and seven blank-description rows.
5. Decide whether `MOD_NAME + ITM_NAME` should be unique; if not, add a stable discriminator for derived/page-specific definitions.
