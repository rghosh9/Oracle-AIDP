# PPMI Curated Data Cut Public Report

## Source
- File: `PPMI_Curated_Data_Cut_Public_20260319_2.xlsx`
- Last modified: 2026-05-12 12:33:14
- Main sheet: `20260316`
- Shape: 18,821 rows x 181 columns

## Executive Summary
- The curated public data cut contains 18,821 visit-level rows and 181 variables across 4,649 participants and 18 event codes.
- The largest event is BL with 4,649 rows; median visit year ranges from 0.0 to 15.0 across observed events.
- The leading cohort by row count is Prodromal with 8,423 rows and 2,692 participants.
- The embedded data dictionary defines 181 variables across 8 categories; 181 of 181 main-sheet columns are covered by dictionary entries.
- Missingness is concentrated in high-sparsity derived, biologic, and imaging variables: 13 variables are at least 80% blank, with Biologics showing the highest average missingness by category.
- No exact duplicate rows or duplicate PATNO/EVENT_ID visit records were detected.

## Workbook Inventory
| Sheet | Max_rows_including_header | Max_columns |
| --- | --- | --- |
| 20260316 | 18822 | 181 |
| Data dictionary | 416 | 10 |
| Information | 22 | 9 |

## Visit Coverage
- Participants: 4,649
- Event codes: 18
- Cohorts: 4
- Subgroups: 24

| EVENT_ID | Rows | Participants | Year_median | Rows_pct | Mean_row_missing_pct |
| --- | --- | --- | --- | --- | --- |
| BL | 4649 | 4649 | 0.0 | 24.7 | 24.23 |
| ST | 16 | 16 | 1.0 | 0.09 | 25.52 |
| V04 | 3595 | 3595 | 1.0 | 19.1 | 27.95 |
| PW | 5 | 5 | 2.0 | 0.03 | 48.84 |
| V06 | 2715 | 2715 | 2.0 | 14.43 | 28.01 |
| V08 | 1716 | 1716 | 3.0 | 9.12 | 32.02 |
| V10 | 1234 | 1234 | 4.0 | 6.56 | 31.0 |
| V12 | 1002 | 1002 | 5.0 | 5.32 | 33.45 |
| V13 | 748 | 748 | 6.0 | 3.97 | 32.94 |
| V14 | 777 | 777 | 7.0 | 4.13 | 32.3 |
| V15 | 604 | 604 | 8.0 | 3.21 | 32.88 |
| V16 | 425 | 425 | 9.0 | 2.26 | 32.01 |
| V17 | 401 | 401 | 10.0 | 2.13 | 32.72 |
| V18 | 346 | 346 | 11.0 | 1.84 | 31.57 |
| V19 | 261 | 261 | 12.0 | 1.39 | 34.52 |
| V20 | 203 | 203 | 13.0 | 1.08 | 33.42 |
| V21 | 110 | 110 | 14.0 | 0.58 | 42.37 |
| V22 | 14 | 14 | 15.0 | 0.07 | 35.48 |

## Cohort Summary
| COHORT | Decode | Rows | Participants | Events | Rows_pct | Mean_row_missing_pct |
| --- | --- | --- | --- | --- | --- | --- |
| 4 | Prodromal | 8423 | 2692 | 15 | 44.75 | 32.58 |
| 1 | PD Participant | 8037 | 1557 | 18 | 42.7 | 23.59 |
| 2 | Healthy Control | 2161 | 336 | 16 | 11.48 | 35.19 |
| 3 | SWEDD | 200 | 64 | 13 | 1.06 | 23.24 |

## Variable Completeness
- Complete variables: 13
- Variables with at least 80% blank cells: 13
- Total blank cells: 985,931

| Variable | Category | Nonblank | Blank | Missing_pct | Unique_nonblank |
| --- | --- | --- | --- | --- | --- |
| OTHNEURO | Clinical | 306 | 18515 | 98.37 | 220 |
| Stage_G | NSD-ISS | 982 | 17839 | 94.78 | 4 |
| NFL_CSF | Biologics | 1344 | 17477 | 92.86 | 1175 |
| Death_Date | Demographics | 1358 | 17463 | 92.78 | 104 |
| age_death | Demographics | 1358 | 17463 | 92.78 | 223 |
| _2_2__di_22_6_BMP | Biologics | 1712 | 17109 | 90.9 | 1474 |
| total_di_18_1_BMP | Biologics | 1712 | 17109 | 90.9 | 1218 |
| total_di_22_6_BMP | Biologics | 1712 | 17109 | 90.9 | 1534 |
| CSFSAA | Biologics | 2138 | 16683 | 88.64 | 4 |
| CSFSAA_assay | Biologics | 2138 | 16683 | 88.64 | 3 |
| asyn | Biologics | 2360 | 16461 | 87.46 | 2241 |
| hemohi | Biologics | 2363 | 16458 | 87.44 | 2 |
| HIQ_RBD | ID | 3088 | 15733 | 83.59 | 3 |
| nfl_serum | Biologics | 4004 | 14817 | 78.73 | 870 |
| abeta | Biologics | 4171 | 14650 | 77.84 | 2961 |
| MIA_CAUDATE_BILAT | DATSCAN | 4330 | 14491 | 76.99 | 205 |
| MIA_CAUDATE_L | DATSCAN | 4330 | 14491 | 76.99 | 207 |
| MIA_CAUDATE_R | DATSCAN | 4330 | 14491 | 76.99 | 210 |
| MIA_LOWPUT_EXPECTED | DATSCAN | 4330 | 14491 | 76.99 | 4327 |
| MIA_PUTAMEN_BILAT | DATSCAN | 4330 | 14491 | 76.99 | 226 |

## Category Completeness
| Category | Variables | Complete_variables | High_missing_variables | Mean_missing_pct | Median_missing_pct |
| --- | --- | --- | --- | --- | --- |
| Biologics | 17 | 0 | 8 | 81.46 | 78.73 |
| DATSCAN | 10 | 0 | 0 | 76.99 | 76.99 |
| NSD-ISS | 9 | 0 | 1 | 56.88 | 59.23 |
| Demographics | 17 | 3 | 2 | 22.92 | 1.01 |
| ID | 12 | 9 | 1 | 19.27 | 0.0 |
| Clinical | 107 | 1 | 1 | 17.99 | 5.07 |
| Genetics | 2 | 0 | 0 | 8.13 | 8.13 |
| Milestones | 7 | 0 | 0 | 1.36 | 0.16 |

## Selected Clinical And Biomarker Profiles
| Variable | Category | Valid_n | Missing_pct | Median | Mean | Min | Max |
| --- | --- | --- | --- | --- | --- | --- | --- |
| age | Demographics | 18821 | 0.0 | 64.3918 | 63.4822 | 20.8082 | 91.4137 |
| age_at_visit | Demographics | 18821 | 0.0 | 67.2959 | 66.6051 | 20.726 | 97.7068 |
| EDUCYRS | Demographics | 18803 | 0.1 | 16.0 | 16.1288 | 0.0 | 20.0 |
| BMI | Clinical | 17546 | 6.77 | 26.3985 | 30.3529 | 0.0 | 56200.0 |
| agediag | Clinical | 8243 | 56.2 | 61.6685 | 60.6325 | 25.0 | 84.7863 |
| ageonset | Clinical | 8136 | 56.77 | 60.1068 | 59.0507 | 19.0137 | 83.7479 |
| duration_yrs | Clinical | 8243 | 56.2 | 0.6 | 1.2716 | -0.4959 | 23.389 |
| LEDD | Clinical | 18821 | 0.0 | 0.0 | 226.1804 | 0.0 | 8068.0 |
| upsit | Clinical | 7355 | 60.92 | 23.0 | 23.6411 | 0.0 | 40.0 |
| upsit_pctl | Clinical | 7355 | 60.92 | 10.0 | 20.5763 | 1.0 | 100.0 |
| moca | Clinical | 18120 | 3.72 | 27.0 | 26.7797 | 0.0 | 30.0 |
| bjlot | Clinical | 17860 | 5.11 | 13.0 | 12.5333 | 0.0 | 15.0 |
| clockdraw | Clinical | 11456 | 39.13 | 7.0 | 6.1867 | 0.0 | 7.0 |
| hvlt_immediaterecall | Clinical | 17921 | 4.78 | 24.0 | 24.0891 | 0.0 | 141.0 |
| DVT_TOTAL_RECALL | Clinical | 17920 | 4.79 | 48.0 | 46.9644 | 20.0 | 75.0 |
| DVT_DELAYED_RECALL | Clinical | 17891 | 4.94 | 48.0 | 46.5003 | 20.0 | 65.0 |
| lexical | Clinical | 11406 | 39.4 | 44.0 | 44.2938 | 1.0 | 111.0 |
| lns | Clinical | 17889 | 4.95 | 10.0 | 10.4449 | 0.0 | 21.0 |
| SDMTOTAL | Clinical | 17872 | 5.04 | 44.0 | 43.3291 | 0.0 | 102.0 |
| TMT_A | Clinical | 11378 | 39.55 | 33.0 | 37.7694 | 4.0 | 150.0 |
| TMT_B | Clinical | 11371 | 39.58 | 74.0 | 92.0289 | 0.0 | 300.0 |
| MSEADLG | Clinical | 17517 | 6.93 | 100.0 | 92.8686 | 0.0 | 100.0 |
| ess | Clinical | 18666 | 0.82 | 5.0 | 6.1122 | 0.0 | 24.0 |
| rem | Clinical | 18636 | 0.98 | 3.0 | 4.4439 | 0.0 | 13.0 |
| gds | Clinical | 18625 | 1.04 | 1.0 | 2.2521 | 0.0 | 15.0 |

## Data Quality Notes
| Check | Result | Status |
| --- | --- | --- |
| Rows on main data sheet | 18821 | Info |
| Columns on main data sheet | 181 | Info |
| Unique participants | 4649 | Info |
| Unique events | 18 | Info |
| Exact duplicate rows | 0 | OK |
| Duplicate PATNO/EVENT_ID rows | 0 | OK |
| Rows missing PATNO | 0 | OK |
| Rows missing EVENT_ID | 0 | OK |
| All-blank rows | 0 | OK |
| Blank cells | 985931 | Info |
| Complete variables | 13 | Info |
| Variables with >=80% missing | 13 | Review |
| Numeric-like variables | 170 | Info |
| Main columns missing from data dictionary | 0 | OK |
| Dictionary variables not present in main sheet | 0 | OK |
| Information sheet rows | 21 | Info |

## Data Dictionary Notes
- Dictionary variables: 181
- Dictionary categories: 8
- Main-sheet columns covered by dictionary: 181 of 181
- Latest information-sheet revision date: 2026-03-16 00:00:00

## Workbook Tabs
- `Executive Summary`: KPI overview, findings, and charts.
- `Workbook Inventory`: workbook sheets, information/revision notes, and dictionary category counts.
- `Visit Coverage`: event, cohort, categorical, and participant visit coverage.
- `Completeness`: variable-level and category-level missingness.
- `Clinical Biomarker`: selected clinical, biomarker, and DATSCAN/MIA profiles.
- `Dictionary`: variable definitions and code/decode values.
- `Data Quality`: validation checks and dictionary coverage exceptions.
- `Raw Sample`: first 500 source rows for inspection; the full source sheet is not duplicated.
