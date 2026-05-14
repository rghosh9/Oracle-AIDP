# Olink Neurology 384 Plasma NPX Report

## Source
- File: `PPMI_Project_9000_Plasma_NEURO_NPX_24Apr2026_olink_neurology384.csv`
- Last modified: 2026-05-12 12:33:15
- Shape: 375,277 rows x 13 columns
- Panel: Neurology

## Executive Summary
- Neurology panel data contains 375,277 long-format assay rows across 275 participants, 1,031 participant-events, 1,031 sample instances, and 364 assays.
- Coverage is nearly complete: expected 375,284 sample-assay combinations and found 375,277, leaving 7 absent sample-assay rows.
- QC_WARNING is WARN for 16,610 rows (4.43%); two sample instances have WARN on every observed assay row.
- 31,831 rows (8.48%) have NPX below the assay LOD; RASA1, MAPT, NGF, METAP1, RAB6B, KRT14, and CLSPN are the leading below-LOD assays.
- Panel lot B14809 contributes 294,470 rows and B04410 contributes 80,807; lot-specific QC and below-LOD rates should be considered before cross-lot comparisons.
- No blank source fields, NPX parse failures, exact duplicate rows, or duplicate PATNO/EVENT_ID/ASSAY records were detected.

## Coverage And QC
- Participants: 275
- Participant-events: 1,031
- Sample instances (`PATNO` + `EVENT_ID` + `PLATEID`): 1,031
- Assays: 364
- Plates: 20
- Panel lots: 2
- QC_WARNING WARN rows: 16,610 (4.43%)
- Computed NPX below LOD rows: 31,831 (8.48%)

## Data Quality Notes
- There are 7 missing sample-assay combinations out of 375,284 expected combinations.
- Assay rows per sample range from 363 to 364; 7 sample instances have one missing assay row.
- The source has 0 blank fields, 0 numeric parse failures, 0 exact duplicate rows, and 0 duplicate `PATNO`/`EVENT_ID`/`ASSAY` rows.
- `MISSINGFREQ` is not actual blank NPX frequency in this extract; NPX is populated for every row, while `MISSINGFREQ` is assay-level metadata.

## Rows By Event
| Event_ID | Rows | Participants | Sample_instances | Plates | QC_WARN | QC_WARN_pct | Below_LOD | Below_LOD_pct |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| BL | 82627 | 227 | 227 | 20 | 4486 | 5.43 | 7440 | 9.0 |
| V06 | 54235 | 149 | 149 | 20 | 2126 | 3.92 | 4553 | 8.39 |
| V10 | 46226 | 127 | 127 | 20 | 1795 | 3.88 | 4190 | 9.06 |
| V04 | 44772 | 123 | 123 | 19 | 2074 | 4.63 | 3868 | 8.64 |
| V02 | 37854 | 104 | 104 | 19 | 1613 | 4.26 | 2963 | 7.83 |
| V08 | 31667 | 87 | 87 | 20 | 1124 | 3.55 | 2847 | 8.99 |
| V12 | 19656 | 54 | 54 | 14 | 563 | 2.86 | 1504 | 7.65 |
| V01 | 9464 | 26 | 26 | 10 | 1063 | 11.23 | 690 | 7.29 |
| V07 | 9100 | 25 | 25 | 11 | 165 | 1.81 | 682 | 7.49 |
| V05 | 8736 | 24 | 24 | 11 | 416 | 4.76 | 660 | 7.55 |
| ST | 8008 | 22 | 22 | 11 | 311 | 3.88 | 648 | 8.09 |
| V03 | 6916 | 19 | 19 | 9 | 105 | 1.52 | 532 | 7.69 |
| V09 | 6552 | 18 | 18 | 10 | 261 | 3.98 | 502 | 7.66 |
| V11 | 5096 | 14 | 14 | 9 | 197 | 3.87 | 380 | 7.46 |
| V13 | 2548 | 7 | 7 | 4 | 208 | 8.16 | 189 | 7.42 |
| V14 | 1456 | 4 | 4 | 3 | 103 | 7.07 | 146 | 10.03 |
| V15 | 364 | 1 | 1 | 1 | 0 | 0.0 | 37 | 10.16 |

## Panel Lot Summary
| Panel_lot | Rows | Participants | Sample_instances | Plates | QC_WARN | QC_WARN_pct | Below_LOD | Below_LOD_pct | NPX_median |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| B14809 | 294470 | 225 | 809 | 11 | 12477 | 4.24 | 22429 | 7.62 | 0.5882 |
| B04410 | 80807 | 74 | 222 | 9 | 4133 | 5.11 | 9402 | 11.64 | 0.5378 |

## Top Below-LOD Assays
| Assay | UniProt | Rows | Below_LOD | Below_LOD_pct | MissingFreq_median | LOD_median | NPX_median |
| --- | --- | --- | --- | --- | --- | --- | --- |
| RASA1 | P20936 | 1031 | 1024 | 99.32 | 0.9946 | 1.0253 | 0.1125 |
| MAPT | P10636 | 1031 | 1008 | 97.77 | 0.9783 | 2.1408 | -0.1996 |
| NGF | P01138 | 1031 | 1006 | 97.58 | 0.9739 | 0.5086 | 0.0753 |
| METAP1 | P53582 | 1031 | 980 | 95.05 | 0.9402 | 1.0707 | 0.22 |
| RAB6B | Q9NRW1 | 1031 | 963 | 93.4 | 0.9217 | 0.771 | -0.0758 |
| KRT14 | P02533 | 1031 | 952 | 92.34 | 0.9207 | 0.9558 | 0.2587 |
| CLSPN | Q9HAW4 | 1031 | 929 | 90.11 | 0.8967 | 1.2366 | 0.3316 |
| MRPL46 | Q9H2W6 | 1031 | 844 | 81.86 | 0.8141 | 0.5431 | 0.1977 |
| GLT8D2 | Q9H1C3 | 1031 | 829 | 80.41 | 0.7902 | 0.5107 | 0.0351 |
| XRCC4 | Q13426 | 1031 | 780 | 75.65 | 0.7359 | 0.6095 | 0.2679 |
| FOSB | P53539 | 1031 | 774 | 75.07 | 0.7402 | 0.357 | 0.0351 |
| SIRT5 | Q9NXA8 | 1031 | 758 | 73.52 | 0.75 | 0.3803 | -0.0172999999999999 |
| GGA1 | Q9UJY5 | 1031 | 702 | 68.09 | 0.6609 | 0.5621 | 0.2891 |
| COPE | O14579 | 1031 | 664 | 64.4 | 0.5772 | 0.3681 | 0.0317999999999999 |
| LIF | P15018 | 1031 | 663 | 64.31 | 0.6272 | -0.4629 | -0.7885 |
| ARID4B | Q4LE39 | 1031 | 655 | 63.53 | 0.5609 | 0.3592 | 0.2119 |
| GHRHR | Q02643 | 1031 | 654 | 63.43 | 0.6011 | 0.4213 | 0.1818 |
| PFDN2 | Q9UHV9 | 1031 | 643 | 62.37 | 0.5663 | 1.2401 | 0.6837 |
| ATP5PO | P48047 | 1031 | 636 | 61.69 | 0.6228 | 0.3345 | 0.0397 |
| LYPD1 | Q8N2G4 | 1031 | 612 | 59.36 | 0.5652 | 0.0910000000000001 | -0.01865 |

## Highest QC-WARN Sample Instances
| PATNO | EVENT_ID | PLATEID | Panel_lot | Assay_rows | QC_WARN | QC_WARN_pct | Below_LOD | Below_LOD_pct |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PPMI-60109 | V04 | BIOREP_pl3_Samplesheet | B14809 | 364 | 364 | 100.0 | 32 | 8.79 |
| PPMI-3817 | BL | BIOREP_pl1_Samplesheet | B14809 | 364 | 364 | 100.0 | 4 | 1.1 |
| PPMI-60048 | V01 | BIOREP_pl1_Samplesheet | B14809 | 364 | 270 | 74.18 | 53 | 14.56 |
| PPMI-56169 | BL | AMP-PD_pl4_Samplesheet | B14809 | 364 | 261 | 71.7 | 34 | 9.34 |
| PPMI-60035 | V06 | BIOREP_pl3_Samplesheet | B14809 | 364 | 261 | 71.7 | 28 | 7.69 |
| PPMI-3385 | BL | 20201991_SS200110_NEURO_ONC | B04410 | 364 | 259 | 71.15 | 52 | 14.29 |
| PPMI-3710 | BL | BIOREP_pl3_Samplesheet | B14809 | 364 | 259 | 71.15 | 49 | 13.46 |
| PPMI-3254 | V08 | AMP-PD_pl4_Samplesheet | B14809 | 364 | 259 | 71.15 | 44 | 12.09 |
| PPMI-3217 | V04 | 20201991_SS200113_NEURO_ONC | B04410 | 364 | 208 | 57.14 | 54 | 14.84 |
| PPMI-92834 | V13 | AMP-PD_pl4_Samplesheet | B14809 | 364 | 208 | 57.14 | 47 | 12.91 |
| PPMI-3222 | V08 | AMP-PD_pl8_Samplesheet | B14809 | 364 | 208 | 57.14 | 44 | 12.09 |
| PPMI-18567 | V01 | AMP-PD_pl6_Samplesheet | B14809 | 364 | 208 | 57.14 | 26 | 7.14 |
| PPMI-3112 | V04 | AMP-PD_pl6_Samplesheet | B14809 | 364 | 208 | 57.14 | 22 | 6.04 |
| PPMI-10874 | V02 | AMP-PD_pl7_Samplesheet | B14809 | 364 | 208 | 57.14 | 19 | 5.22 |
| PPMI-3237 | V06 | AMP-PD_pl1_Samplesheet | B14809 | 364 | 199 | 54.67 | 44 | 12.09 |
| PPMI-4078 | BL | 20201991_SS200110_NEURO_ONC | B04410 | 364 | 197 | 54.12 | 53 | 14.56 |
| PPMI-60065 | V10 | BIOREP_pl1_Samplesheet | B14809 | 364 | 197 | 54.12 | 37 | 10.16 |
| PPMI-85242 | V10 | BIOREP_pl3_Samplesheet | B14809 | 364 | 197 | 54.12 | 37 | 10.16 |
| PPMI-3967 | V02 | 20201991_SS200108_NEURO_ONC | B04410 | 364 | 197 | 54.12 | 16 | 4.4 |
| PPMI-60048 | V07 | BIOREP_pl1_Samplesheet | B14809 | 364 | 165 | 45.33 | 38 | 10.44 |

## Missing Sample-Assay Rows
| PATNO | EVENT_ID | PLATEID | Missing_Assay | OlinkID | UniProt |
| --- | --- | --- | --- | --- | --- |
| PPMI-12499 | V10 | AMP-PD_pl6_Samplesheet | NCAM2 | OID21095 | O15394 |
| PPMI-3172 | V02 | AMP-PD_pl7_Samplesheet | KIRREL2 | OID20873 | Q6UWL6 |
| PPMI-3219 | V06 | AMP-PD_pl8_Samplesheet | CA2 | OID21149 | P00918 |
| PPMI-3300 | BL | 20201991_SS200114_NEURO_ONC | GNLY | OID21132 | P22749 |
| PPMI-60013 | V08 | AMP-PD_pl1_Samplesheet | PBLD | OID20839 | P30039 |
| PPMI-60107 | V02 | BIOREP_pl2_Samplesheet | NCAM2 | OID21095 | O15394 |
| PPMI-90456 | V10 | AMP-PD_pl6_Samplesheet | DPEP1 | OID20897 | P16444 |

## Workbook Tabs
- `Executive Summary`: KPI overview, findings, and charts.
- `Coverage`: event, lot, plate, and assay-row completeness summaries.
- `Assay Summary`: assay-level QC, below-LOD, missing-frequency, and NPX distribution metrics.
- `QC & LOD`: QC counts, top warning samples, below-LOD assays, and missing sample-assay rows.
- `Data Quality`: validation checks, numeric parsing profile, and blank-field counts.
- `Codebook`: inferred descriptions and observed values for each source column.
- `Raw Sample`: first 5,000 source rows for quick inspection; the full raw CSV is not duplicated into the workbook.
