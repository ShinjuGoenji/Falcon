 
****************************************
Report : resources
Design : MODP_MONTYMUL_TOP
Version: T-2022.03
Date   : Wed Oct  1 11:36:22 2025
****************************************


Resource Report for this hierarchy in file ../01_RTL/MODP_MONTYMUL_TOP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| sub_x_1        | DW01_sub       | width=2    | sub_155_I2_aco (MODP_MONTYMUL_TOP.v:155) |
| sub_x_2        | DW01_sub       | width=2    | sub_155_I3_aco (MODP_MONTYMUL_TOP.v:155) |
| sub_x_3        | DW01_sub       | width=2    | sub_155_I4_aco (MODP_MONTYMUL_TOP.v:155) |
| sub_x_4        | DW01_sub       | width=2    | sub_155_I5_aco (MODP_MONTYMUL_TOP.v:155) |
| sub_x_5        | DW01_sub       | width=2    | sub_155_I6_aco (MODP_MONTYMUL_TOP.v:155) |
| sub_x_6        | DW01_sub       | width=2    | sub_155_I7_aco (MODP_MONTYMUL_TOP.v:155) |
| sub_x_7        | DW01_sub       | width=2    | sub_155_I8_aco (MODP_MONTYMUL_TOP.v:155) |
| sub_x_8        | DW01_sub       | width=2    | sub_155_I9_aco (MODP_MONTYMUL_TOP.v:155) |
| DP_OP_31_126_8875               |            |                            |
|                | DP_OP_31_126_8875 |         |                            |
| DP_OP_31_127_8955               |            |                            |
|                | DP_OP_31_127_8955 |         |                            |
=============================================================================

Datapath Report for DP_OP_31_126_8875
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_31_126_8875    | mult_264 (MODP_MONTYMUL_TOP.v:264)                  |
|                      | add_267 (MODP_MONTYMUL_TOP.v:267)                   |
|                      | C352 (MODP_MONTYMUL_TOP.v:274)                      |
|                      | C353 (MODP_MONTYMUL_TOP.v:273)                      |
|                      | add_268 (MODP_MONTYMUL_TOP.v:268)                   |
|                      | mult_265 (MODP_MONTYMUL_TOP.v:265)                  |
|                      | gte_280 (MODP_MONTYMUL_TOP.v:280)                   |
|                      | sub_275 (MODP_MONTYMUL_TOP.v:275)                   |
|                      | sub_281 (MODP_MONTYMUL_TOP.v:281)                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 16    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 48    |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Unsigned | 62    |                                          |
| I7    | PI   | Unsigned | 31    |                                          |
| T3    | IFO  | Unsigned | 62    | I7 * I2 (MODP_MONTYMUL_TOP.v:265)        |
| T15   | IFO  | Unsigned | 32    | O2[62:31]                                |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.v:264)        |
| T17   | IFO  | Signed   | 31    | O1[46:16]                                |
| T18   | IFO  | Signed   | 31    | O2[61:31]                                |
| T26   | IFO  | Signed   | 31    | { I4, I5 } ? T17 : T18 ( MODP_MONTYMUL_TOP.v:273 MODP_MONTYMUL_TOP.v:274 ) |
| O1    | PO   | Unsigned | 48    | I3 + T2 (MODP_MONTYMUL_TOP.v:267)        |
| O2    | PO   | Unsigned | 63    | I6 + T3 (MODP_MONTYMUL_TOP.v:268)        |
| O3    | PO   | Unsigned | 1     | T15 >= I2 (MODP_MONTYMUL_TOP.v:280)      |
| O4    | PO   | Signed   | 31    | T26 - I2 ( MODP_MONTYMUL_TOP.v:275 MODP_MONTYMUL_TOP.v:281 ) |
==============================================================================

Datapath Report for DP_OP_31_127_8955
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_31_127_8955    | mult_264 (MODP_MONTYMUL_TOP.v:264)                  |
|                      | add_267 (MODP_MONTYMUL_TOP.v:267)                   |
|                      | C352 (MODP_MONTYMUL_TOP.v:274)                      |
|                      | C353 (MODP_MONTYMUL_TOP.v:273)                      |
|                      | add_268 (MODP_MONTYMUL_TOP.v:268)                   |
|                      | mult_265 (MODP_MONTYMUL_TOP.v:265)                  |
|                      | gte_280 (MODP_MONTYMUL_TOP.v:280)                   |
|                      | sub_275 (MODP_MONTYMUL_TOP.v:275)                   |
|                      | sub_281 (MODP_MONTYMUL_TOP.v:281)                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 16    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 48    |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Unsigned | 62    |                                          |
| I7    | PI   | Unsigned | 31    |                                          |
| T3    | IFO  | Unsigned | 62    | I7 * I2 (MODP_MONTYMUL_TOP.v:265)        |
| T15   | IFO  | Unsigned | 32    | O2[62:31]                                |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.v:264)        |
| T17   | IFO  | Signed   | 31    | O1[46:16]                                |
| T18   | IFO  | Signed   | 31    | O2[61:31]                                |
| T26   | IFO  | Signed   | 31    | { I4, I5 } ? T17 : T18 ( MODP_MONTYMUL_TOP.v:273 MODP_MONTYMUL_TOP.v:274 ) |
| O1    | PO   | Unsigned | 48    | I3 + T2 (MODP_MONTYMUL_TOP.v:267)        |
| O2    | PO   | Unsigned | 63    | I6 + T3 (MODP_MONTYMUL_TOP.v:268)        |
| O3    | PO   | Unsigned | 1     | T15 >= I2 (MODP_MONTYMUL_TOP.v:280)      |
| O4    | PO   | Signed   | 31    | T26 - I2 ( MODP_MONTYMUL_TOP.v:275 MODP_MONTYMUL_TOP.v:281 ) |
==============================================================================


Resource Report for Ungrouped Hierarchy genblk1[1].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=32   | gte_274 (MODP_MONTYMUL_TOP.v:274) |
| DP_OP_29J1_122_1862             |            |                            |
|                | DP_OP_29J1_122_1862 |       |                            |
=============================================================================

Datapath Report for DP_OP_29J1_122_1862
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_29J1_122_1862  | mult_262 (MODP_MONTYMUL_TOP.v:262)                  |
|                      | mult_263 (MODP_MONTYMUL_TOP.v:263)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T12   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.v:262)        |
| O2    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL_TOP.v:263)       |
==============================================================================


Resource Report for Ungrouped Hierarchy genblk1[0].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=32   | gte_274 (MODP_MONTYMUL_TOP.v:274) |
| DP_OP_29J1_122_1862             |            |                            |
|                | DP_OP_29J1_122_1862 |       |                            |
=============================================================================

Datapath Report for DP_OP_29J1_122_1862
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_29J1_122_1862  | mult_262 (MODP_MONTYMUL_TOP.v:262)                  |
|                      | mult_263 (MODP_MONTYMUL_TOP.v:263)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T12   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.v:262)        |
| O2    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL_TOP.v:263)       |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| sub_x_1            | DW01_sub         | apparch (area)     |                |
| sub_x_2            | DW01_sub         | apparch (area)     |                |
| sub_x_3            | DW01_sub         | apparch (area)     |                |
| sub_x_4            | DW01_sub         | apparch (area)     |                |
| sub_x_5            | DW01_sub         | apparch (area)     |                |
| sub_x_6            | DW01_sub         | apparch (area)     |                |
| sub_x_7            | DW01_sub         | apparch (area)     |                |
| sub_x_8            | DW01_sub         | apparch (area)     |                |
| gte_x_1            | DW_cmp           | pparch (area,speed)                 |
| gte_x_1            | DW_cmp           | pparch (area,speed)                 |
| DP_OP_31_126_8875  | DP_OP_31_126_8875 | str (area,speed)  |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_31_127_8955  | DP_OP_31_127_8955 | str (area,speed)  |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_29J1_122_1862                   |                    |                |
|                    | DP_OP_29J1_122_1862 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_29J1_122_1862                   |                    |                |
|                    | DP_OP_29J1_122_1862 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
===============================================================================

1
