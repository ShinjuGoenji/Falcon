 
****************************************
Report : resources
Design : KEYGEN
Version: T-2022.03
Date   : Fri Oct  3 02:11:42 2025
****************************************


Resource Report for this hierarchy in file ../01_RTL/MODP_R2.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=3    | genblk3[0].u_MODP_R2/lt_112 (MODP_R2.v:112) |
| lt_x_2         | DW_cmp         | width=3    | genblk3[0].u_MODP_R2/lt_113 (MODP_R2.v:113) |
| sub_x_12       | DW01_sub       | width=2    | genblk3[0].u_MODP_R2/sub_178 (MODP_R2.v:178) |
| add_x_13       | DW01_add       | width=32   | genblk3[0].u_MODP_R2/add_178 (MODP_R2.v:178) |
| lt_x_15        | DW_cmp         | width=3    | genblk3[2].u_MODP_R2/lt_112 (MODP_R2.v:112) |
| lt_x_16        | DW_cmp         | width=3    | genblk3[2].u_MODP_R2/lt_113 (MODP_R2.v:113) |
| sub_x_26       | DW01_sub       | width=2    | genblk3[2].u_MODP_R2/sub_178 (MODP_R2.v:178) |
| add_x_27       | DW01_add       | width=32   | genblk3[2].u_MODP_R2/add_178 (MODP_R2.v:178) |
| lt_x_29        | DW_cmp         | width=3    | genblk3[1].u_MODP_R2/lt_112 (MODP_R2.v:112) |
| lt_x_30        | DW_cmp         | width=3    | genblk3[1].u_MODP_R2/lt_113 (MODP_R2.v:113) |
| sub_x_40       | DW01_sub       | width=2    | genblk3[1].u_MODP_R2/sub_178 (MODP_R2.v:178) |
| add_x_41       | DW01_add       | width=32   | genblk3[1].u_MODP_R2/add_178 (MODP_R2.v:178) |
| sub_x_43       | DW01_sub       | width=31   | genblk3[0].u_MODP_R2/u_MODP_R/sub_25 (MODP_R.v:25) |
| sub_x_45       | DW01_sub       | width=31   | genblk3[2].u_MODP_R2/u_MODP_R/sub_25 (MODP_R.v:25) |
| sub_x_46       | DW01_sub       | width=31   | genblk3[1].u_MODP_R2/u_MODP_R/sub_25 (MODP_R.v:25) |
| add_x_8        | DW01_inc       | width=3    | genblk3[0].u_MODP_R2/add_149 (MODP_R2.v:149) |
                |            | genblk3[0].u_MODP_R2/add_151 (MODP_R2.v:151) |
| add_x_22       | DW01_inc       | width=3    | genblk3[2].u_MODP_R2/add_149 (MODP_R2.v:149) |
                |            | genblk3[2].u_MODP_R2/add_151 (MODP_R2.v:151) |
| add_x_36       | DW01_inc       | width=3    | genblk3[1].u_MODP_R2/add_149 (MODP_R2.v:149) |
                |            | genblk3[1].u_MODP_R2/add_151 (MODP_R2.v:151) |
| DP_OP_94J1_122_5295             |            |                            |
|                | DP_OP_94J1_122_5295 |       |                            |
| DP_OP_95J1_123_5295             |            |                            |
|                | DP_OP_95J1_123_5295 |       |                            |
| DP_OP_96J1_124_5295             |            |                            |
|                | DP_OP_96J1_124_5295 |       |                            |
| DP_OP_25_131_5341               |            |                            |
|                | DP_OP_25_131_5341 |         |                            |
| DP_OP_26_132_4301               |            |                            |
|                | DP_OP_26_132_4301 |         |                            |
| DP_OP_25_133_9574               |            |                            |
|                | DP_OP_25_133_9574 |         |                            |
| DP_OP_26_134_2599               |            |                            |
|                | DP_OP_26_134_2599 |         |                            |
=============================================================================

Datapath Report for DP_OP_94J1_122_5295
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_94J1_122_5295  | genblk3[0].u_MODP_R2/u_MODP_ADD/add_43 (MODP_ADD.v:43) |
                    | genblk3[0].u_MODP_R2/u_MODP_ADD/sub_44 (MODP_ADD.v:44) |
                    | genblk3[0].u_MODP_R2/u_MODP_ADD/gte_45 (MODP_ADD.v:45) |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| T82   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 32    | I1 + I1 (MODP_ADD.v:43)                  |
| O2    | PO   | Signed   | 31    | T82 - I2 (MODP_ADD.v:44)                 |
| O3    | PO   | Unsigned | 1     | O1 >= I2 (MODP_ADD.v:45)                 |
==============================================================================

Datapath Report for DP_OP_95J1_123_5295
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_95J1_123_5295  | genblk3[2].u_MODP_R2/u_MODP_ADD/add_43 (MODP_ADD.v:43) |
                    | genblk3[2].u_MODP_R2/u_MODP_ADD/sub_44 (MODP_ADD.v:44) |
                    | genblk3[2].u_MODP_R2/u_MODP_ADD/gte_45 (MODP_ADD.v:45) |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| T85   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 32    | I1 + I1 (MODP_ADD.v:43)                  |
| O2    | PO   | Signed   | 31    | T85 - I2 (MODP_ADD.v:44)                 |
| O3    | PO   | Unsigned | 1     | O1 >= I2 (MODP_ADD.v:45)                 |
==============================================================================

Datapath Report for DP_OP_96J1_124_5295
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_96J1_124_5295  | genblk3[1].u_MODP_R2/u_MODP_ADD/add_43 (MODP_ADD.v:43) |
                    | genblk3[1].u_MODP_R2/u_MODP_ADD/sub_44 (MODP_ADD.v:44) |
                    | genblk3[1].u_MODP_R2/u_MODP_ADD/gte_45 (MODP_ADD.v:45) |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| T86   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 32    | I1 + I1 (MODP_ADD.v:43)                  |
| O2    | PO   | Signed   | 31    | T86 - I2 (MODP_ADD.v:44)                 |
| O3    | PO   | Unsigned | 1     | O1 >= I2 (MODP_ADD.v:45)                 |
==============================================================================

Datapath Report for DP_OP_25_131_5341
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_25_131_5341    | mult_258 (MODP_MONTYMUL_TOP.v:258)                  |
|                      | add_261 (MODP_MONTYMUL_TOP.v:261)                   |
|                      | sub_269 (MODP_MONTYMUL_TOP.v:269)                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 16    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 48    |                                          |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.v:258)        |
| T17   | IFO  | Signed   | 31    | O1[46:16]                                |
| O1    | PO   | Unsigned | 48    | I3 + T2 (MODP_MONTYMUL_TOP.v:261)        |
| O2    | PO   | Signed   | 31    | T17 - I2 (MODP_MONTYMUL_TOP.v:269)       |
==============================================================================

Datapath Report for DP_OP_26_132_4301
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_26_132_4301    | mult_259 (MODP_MONTYMUL_TOP.v:259)                  |
|                      | add_262 (MODP_MONTYMUL_TOP.v:262)                   |
|                      | gte_274 (MODP_MONTYMUL_TOP.v:274)                   |
|                      | sub_275 (MODP_MONTYMUL_TOP.v:275)                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 62    |                                          |
| T3    | IFO  | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.v:259)        |
| T15   | IFO  | Unsigned | 32    | O1[62:31]                                |
| T18   | IFO  | Signed   | 31    | O1[61:31]                                |
| O1    | PO   | Unsigned | 63    | I3 + T3 (MODP_MONTYMUL_TOP.v:262)        |
| O2    | PO   | Unsigned | 1     | T15 >= I2 (MODP_MONTYMUL_TOP.v:274)      |
| O3    | PO   | Signed   | 31    | T18 - I2 (MODP_MONTYMUL_TOP.v:275)       |
==============================================================================

Datapath Report for DP_OP_25_133_9574
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_25_133_9574    | mult_258 (MODP_MONTYMUL_TOP.v:258)                  |
|                      | add_261 (MODP_MONTYMUL_TOP.v:261)                   |
|                      | sub_269 (MODP_MONTYMUL_TOP.v:269)                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 16    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 48    |                                          |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.v:258)        |
| T17   | IFO  | Signed   | 31    | O1[46:16]                                |
| O1    | PO   | Unsigned | 48    | I3 + T2 (MODP_MONTYMUL_TOP.v:261)        |
| O2    | PO   | Signed   | 31    | T17 - I2 (MODP_MONTYMUL_TOP.v:269)       |
==============================================================================

Datapath Report for DP_OP_26_134_2599
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_26_134_2599    | mult_259 (MODP_MONTYMUL_TOP.v:259)                  |
|                      | add_262 (MODP_MONTYMUL_TOP.v:262)                   |
|                      | gte_274 (MODP_MONTYMUL_TOP.v:274)                   |
|                      | sub_275 (MODP_MONTYMUL_TOP.v:275)                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 62    |                                          |
| T3    | IFO  | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.v:259)        |
| T15   | IFO  | Unsigned | 32    | O1[62:31]                                |
| T18   | IFO  | Signed   | 31    | O1[61:31]                                |
| O1    | PO   | Unsigned | 63    | I3 + T3 (MODP_MONTYMUL_TOP.v:262)        |
| O2    | PO   | Unsigned | 1     | T15 >= I2 (MODP_MONTYMUL_TOP.v:274)      |
| O3    | PO   | Signed   | 31    | T18 - I2 (MODP_MONTYMUL_TOP.v:275)       |
==============================================================================


Resource Report for Ungrouped Hierarchy u_MODP_MONTYMUL_TOP in file
        ../01_RTL/MODP_MONTYMUL_TOP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| sub_x_1        | DW01_sub       | width=2    | sub_155_I2_aco (MODP_MONTYMUL_TOP.v:155) |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[0].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=32   | gte_268 (MODP_MONTYMUL_TOP.v:268) |
| DP_OP_29J1_125_3045             |            |                            |
|                | DP_OP_29J1_125_3045 |       |                            |
=============================================================================

Datapath Report for DP_OP_29J1_125_3045
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_29J1_125_3045  | mult_256 (MODP_MONTYMUL_TOP.v:256)                  |
|                      | mult_257 (MODP_MONTYMUL_TOP.v:257)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T12   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.v:256)        |
| O2    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL_TOP.v:257)       |
==============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[1].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=32   | gte_268 (MODP_MONTYMUL_TOP.v:268) |
| DP_OP_29J1_125_3045             |            |                            |
|                | DP_OP_29J1_125_3045 |       |                            |
=============================================================================

Datapath Report for DP_OP_29J1_125_3045
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_29J1_125_3045  | mult_256 (MODP_MONTYMUL_TOP.v:256)                  |
|                      | mult_257 (MODP_MONTYMUL_TOP.v:257)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T12   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.v:256)        |
| O2    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL_TOP.v:257)       |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'genblk3[0].u_MODP_R2/u_MODP_R/sub_25 (MODP_R.v:25)' in design 'KEYGEN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'genblk3[0].u_MODP_R2/u_MODP_ADD/add_43 (MODP_ADD.v:43)'.  (HDL-120)

Information: Operator associated with resources 'genblk3[0].u_MODP_R2/u_MODP_ADD/sub_44 (MODP_ADD.v:44)' in design 'KEYGEN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'genblk3[0].u_MODP_R2/u_MODP_ADD/C41 (MODP_ADD.v:45)'.  (HDL-120)

Information: Operator associated with resources 'genblk3[2].u_MODP_R2/u_MODP_R/sub_25 (MODP_R.v:25)' in design 'KEYGEN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'genblk3[2].u_MODP_R2/u_MODP_ADD/add_43 (MODP_ADD.v:43)'.  (HDL-120)

Information: Operator associated with resources 'genblk3[2].u_MODP_R2/u_MODP_ADD/sub_44 (MODP_ADD.v:44)' in design 'KEYGEN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'genblk3[2].u_MODP_R2/u_MODP_ADD/C41 (MODP_ADD.v:45)'.  (HDL-120)

Information: Operator associated with resources 'genblk3[1].u_MODP_R2/u_MODP_R/sub_25 (MODP_R.v:25)' in design 'KEYGEN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'genblk3[1].u_MODP_R2/u_MODP_ADD/add_43 (MODP_ADD.v:43)'.  (HDL-120)

Information: Operator associated with resources 'genblk3[1].u_MODP_R2/u_MODP_ADD/sub_44 (MODP_ADD.v:44)' in design 'KEYGEN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'genblk3[1].u_MODP_R2/u_MODP_ADD/C41 (MODP_ADD.v:45)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| lt_x_1             | DW_cmp           | apparch (area)     |                |
| lt_x_2             | DW_cmp           | apparch (area)     |                |
| sub_x_12           | DW01_sub         | apparch (area)     |                |
| add_x_13           | DW01_add         | pparch (area,speed)                 |
| lt_x_15            | DW_cmp           | apparch (area)     |                |
| lt_x_16            | DW_cmp           | apparch (area)     |                |
| sub_x_26           | DW01_sub         | apparch (area)     |                |
| add_x_27           | DW01_add         | pparch (area,speed)                 |
| lt_x_29            | DW_cmp           | apparch (area)     |                |
| lt_x_30            | DW_cmp           | apparch (area)     |                |
| sub_x_40           | DW01_sub         | apparch (area)     |                |
| add_x_41           | DW01_add         | pparch (area,speed)                 |
| sub_x_43           | DW01_sub         | pparch (area,speed)                 |
| sub_x_45           | DW01_sub         | pparch (area,speed)                 |
| sub_x_46           | DW01_sub         | pparch (area,speed)                 |
| add_x_8            | DW01_inc         | apparch (area)     |                |
| add_x_22           | DW01_inc         | apparch (area)     |                |
| add_x_36           | DW01_inc         | apparch (area)     |                |
| sub_x_1            | DW01_sub         | apparch (area)     |                |
| DP_OP_94J1_122_5295                   |                    |                |
|                    | DP_OP_94J1_122_5295 | str (area,speed)                 |
| DP_OP_95J1_123_5295                   |                    |                |
|                    | DP_OP_95J1_123_5295 | str (area,speed)                 |
| DP_OP_96J1_124_5295                   |                    |                |
|                    | DP_OP_96J1_124_5295 | str (area,speed)                 |
| DP_OP_25_131_5341  | DP_OP_25_131_5341 | str (area)        |                |
|                    |                  | mult_arch: benc_radix8              |
| DP_OP_26_132_4301  | DP_OP_26_132_4301 | str (area,speed)  |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_25_133_9574  | DP_OP_25_133_9574 | str (area)        |                |
|                    |                  | mult_arch: benc_radix8              |
| DP_OP_26_134_2599  | DP_OP_26_134_2599 | str (area,speed)  |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_29J1_125_3045                   |                    |                |
|                    | DP_OP_29J1_125_3045 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_29J1_125_3045                   |                    |                |
|                    | DP_OP_29J1_125_3045 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
===============================================================================

1
