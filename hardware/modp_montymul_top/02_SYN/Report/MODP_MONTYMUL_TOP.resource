 
****************************************
Report : resources
Design : MODP_MONTYMUL_TOP
Version: T-2022.03
Date   : Wed Oct  1 01:18:59 2025
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
| DP_OP_31_126_8875    | mult_68 (MODP_MONTYMUL.v:68)                        |
|                      | add_71 (MODP_MONTYMUL.v:71)                         |
|                      | C352 (MODP_MONTYMUL.v:78) C353 (MODP_MONTYMUL.v:77) |
|                      | add_72 (MODP_MONTYMUL.v:72)                         |
|                      | mult_69 (MODP_MONTYMUL.v:69)                        |
|                      | gte_84 (MODP_MONTYMUL.v:84)                         |
|                      | sub_79 (MODP_MONTYMUL.v:79)                         |
|                      | sub_85 (MODP_MONTYMUL.v:85)                         |
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
| T3    | IFO  | Unsigned | 62    | I7 * I2 (MODP_MONTYMUL.v:69)             |
| T15   | IFO  | Unsigned | 32    | O2[62:31]                                |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL.v:68)             |
| T17   | IFO  | Signed   | 31    | O1[46:16]                                |
| T18   | IFO  | Signed   | 31    | O2[61:31]                                |
| T26   | IFO  | Signed   | 31    | { I4, I5 } ? T17 : T18 ( MODP_MONTYMUL.v:77 MODP_MONTYMUL.v:78 ) |
| O1    | PO   | Unsigned | 48    | I3 + T2 (MODP_MONTYMUL.v:71)             |
| O2    | PO   | Unsigned | 63    | I6 + T3 (MODP_MONTYMUL.v:72)             |
| O3    | PO   | Unsigned | 1     | T15 >= I2 (MODP_MONTYMUL.v:84)           |
| O4    | PO   | Signed   | 31    | T26 - I2 ( MODP_MONTYMUL.v:79 MODP_MONTYMUL.v:85 ) |
==============================================================================

Datapath Report for DP_OP_31_127_8955
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_31_127_8955    | mult_68 (MODP_MONTYMUL.v:68)                        |
|                      | add_71 (MODP_MONTYMUL.v:71)                         |
|                      | C352 (MODP_MONTYMUL.v:78) C353 (MODP_MONTYMUL.v:77) |
|                      | add_72 (MODP_MONTYMUL.v:72)                         |
|                      | mult_69 (MODP_MONTYMUL.v:69)                        |
|                      | gte_84 (MODP_MONTYMUL.v:84)                         |
|                      | sub_79 (MODP_MONTYMUL.v:79)                         |
|                      | sub_85 (MODP_MONTYMUL.v:85)                         |
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
| T3    | IFO  | Unsigned | 62    | I7 * I2 (MODP_MONTYMUL.v:69)             |
| T15   | IFO  | Unsigned | 32    | O2[62:31]                                |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL.v:68)             |
| T17   | IFO  | Signed   | 31    | O1[46:16]                                |
| T18   | IFO  | Signed   | 31    | O2[61:31]                                |
| T26   | IFO  | Signed   | 31    | { I4, I5 } ? T17 : T18 ( MODP_MONTYMUL.v:77 MODP_MONTYMUL.v:78 ) |
| O1    | PO   | Unsigned | 48    | I3 + T2 (MODP_MONTYMUL.v:71)             |
| O2    | PO   | Unsigned | 63    | I6 + T3 (MODP_MONTYMUL.v:72)             |
| O3    | PO   | Unsigned | 1     | T15 >= I2 (MODP_MONTYMUL.v:84)           |
| O4    | PO   | Signed   | 31    | T26 - I2 ( MODP_MONTYMUL.v:79 MODP_MONTYMUL.v:85 ) |
==============================================================================


Resource Report for Ungrouped Hierarchy genblk1[1].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=32   | gte_78 (MODP_MONTYMUL.v:78) |
| DP_OP_29J1_122_1862             |            |                            |
|                | DP_OP_29J1_122_1862 |       |                            |
=============================================================================

Datapath Report for DP_OP_29J1_122_1862
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_29J1_122_1862  | mult_66 (MODP_MONTYMUL.v:66)                        |
|                      | mult_67 (MODP_MONTYMUL.v:67)                        |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T12   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL.v:66)             |
| O2    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL.v:67)            |
==============================================================================


Resource Report for Ungrouped Hierarchy genblk1[0].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=32   | gte_78 (MODP_MONTYMUL.v:78) |
| DP_OP_29J1_122_1862             |            |                            |
|                | DP_OP_29J1_122_1862 |       |                            |
=============================================================================

Datapath Report for DP_OP_29J1_122_1862
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_29J1_122_1862  | mult_66 (MODP_MONTYMUL.v:66)                        |
|                      | mult_67 (MODP_MONTYMUL.v:67)                        |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T12   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL.v:66)             |
| O2    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL.v:67)            |
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
