# Olink Target 48 Neurodegeneration Panel Report

Generated: 2026-05-14 10:51

Source: `C:\Users\Rajib Ghosh\Documents\I-sp-team\Hackensack\HMH_Datasets\HMH_Datasets\PPMI_Project_318_Plasma_24Apr2026_olink_48_neurodegen_panel.csv`

This is a content and data-quality report for the Olink plasma neurodegeneration panel export.

## Executive Summary

The file contains 14,637 rows, 119 participants, 357 participant-event records, 357 sample-event/well instances, 41 assays, 10 plates, and 12 event IDs. Every sample instance has exactly 41 assay rows.

All rows are `SampleQC=PASS`. `AssayQC=WARN` appears on 3,375 rows (23.06%). NPX is missing on 26 rows (0.18%), across 21 sample instances; each missing NPX row has `Ct=999`.

Measurement-limit flags are substantial for a few assays: 1,342 rows are below LOD (9.17%), 2,125 are below LQL (14.52%), and 12 are above ULOQ (0.08%).

## Event Coverage

| Event | Rows | Participants | Plates | NPX Missing | Below LOD | Below LQL | AssayQC WARN |
| --- | --- | --- | --- | --- | --- | --- | --- |
| BL | 4715 | 115 | 10 | 9 | 457 | 728 | 1076 |
| V10 | 2542 | 62 | 10 | 6 | 220 | 351 | 543 |
| V16 | 2255 | 55 | 10 | 2 | 164 | 287 | 549 |
| V14 | 1763 | 43 | 10 | 4 | 201 | 274 | 263 |
| V09 | 779 | 19 | 10 | 1 | 90 | 116 | 192 |
| V11 | 656 | 16 | 9 | 2 | 50 | 93 | 132 |
| V08 | 574 | 14 | 6 | 0 | 32 | 79 | 214 |
| V18 | 533 | 13 | 6 | 1 | 43 | 70 | 191 |
| V12 | 328 | 8 | 6 | 1 | 48 | 63 | 127 |
| V15 | 246 | 6 | 5 | 0 | 11 | 29 | 43 |
| V02 | 164 | 4 | 4 | 0 | 23 | 26 | 4 |
| V17 | 82 | 2 | 2 | 0 | 3 | 9 | 41 |

## Highest Below-LQL Assays

| Assay | Rows | NPX Missing | Below LOD | Below LOD % | Below LQL | Below LQL % | WARN |
| --- | --- | --- | --- | --- | --- | --- | --- |
| SNCAIP | 357 | 1 | 162 | 45.38 | 342 | 95.8 | 72 |
| NLGN1 | 357 | 12 | 283 | 79.27 | 332 | 93.0 | 72 |
| LRRK2 | 357 | 6 | 265 | 74.23 | 304 | 85.15 | 72 |
| pTau217 | 357 | 6 | 143 | 40.06 | 204 | 57.14 | 72 |
| HLA-DRA | 357 | 0 | 38 | 10.64 | 196 | 54.9 | 72 |
| NGF | 357 | 0 | 38 | 10.64 | 158 | 44.26 | 105 |
| FOXO3 | 357 | 0 | 39 | 10.92 | 78 | 21.85 | 72 |
| WWOX | 357 | 0 | 14 | 3.92 | 71 | 19.89 | 72 |
| TP53 | 357 | 0 | 37 | 10.36 | 59 | 16.53 | 72 |
| GFAP | 357 | 0 | 45 | 12.61 | 53 | 14.85 | 72 |
| GDNF | 357 | 0 | 14 | 3.92 | 52 | 14.57 | 72 |
| NEFL | 357 | 0 | 38 | 10.64 | 48 | 13.45 | 72 |
| CLSTN3 | 357 | 0 | 40 | 11.2 | 40 | 11.2 | 177 |
| Abeta42 | 357 | 0 | 38 | 10.64 | 38 | 10.64 | 108 |
| STX1B | 357 | 1 | 37 | 10.36 | 37 | 10.36 | 105 |

## Data Quality Notes

| Check | Result | Status |
| --- | --- | --- |
| Rows | 14637 | Info |
| Columns | 30 | Info |
| Unique sample instances | 357 | Info |
| Assays per sample instance | 41 to 41 | OK |
| Exact duplicate rows | 0 | OK |
| Duplicate PATNO/EVENT_ID/Assay rows | 0 | OK |
| SampleQC non-PASS rows | 0 | OK |
| AssayQC WARN rows | 3375 | Review |
| NPX missing / NA rows | 26 | Review |
| Ct=999 rows not matching NPX missing | 0 | OK |
| BelowLOD flag mismatches against NPX < LODNPX | 0 | OK |
| BelowLQL computed below but flag not TRUE | 0 | OK |
| BelowLQL TRUE but QuantifiedValue >= LQL | 157 | Review |
| AboveULOQ flag mismatches against QuantifiedValue > ULOQ | 0 | OK |
| Assays where MissingFreq differs from actual NPX missing rate | 23 | Info |

`BelowLOD` is exactly consistent with `NPX < LODNPX` for rows with numeric NPX. `AboveULOQ` is exactly consistent with `QuantifiedValue > ULOQ`. `BelowLQL` has 157 TRUE rows where the rounded `QuantifiedValue` is not below `LQL`; these are retained in a review sample in the workbook.

`MissingFreq` does not equal the actual NPX NA rate in this subset. It appears to be assay/software metadata rather than a row-set missingness calculation, so the workbook reports both values separately.

## Recommended Next Steps

1. Treat high below-LQL assays such as NLGN1, SNCAIP, LRRK2, and pTau217 carefully in downstream modeling.
2. Decide whether to filter, flag, or retain `AssayQC=WARN` rows, especially plates P6 and P9.
3. Review the 26 Ct=999 / NPX missing rows and the 12 EIF2AK2 above-ULOQ rows.
4. Clarify the intended interpretation of `MissingFreq` before using it as an analysis missingness measure.
