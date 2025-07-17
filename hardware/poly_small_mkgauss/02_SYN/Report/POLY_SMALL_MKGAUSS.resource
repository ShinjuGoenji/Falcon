 
****************************************
Report : resources
Design : POLY_SMALL_MKGAUSS
Version: T-2022.03
Date   : Thu Jul 17 22:02:26 2025
****************************************


Resource Report for this hierarchy in file ../01_RTL/POLY_SMALL_MKGAUSS.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_1        | DW01_inc       | width=9    | add_85 (POLY_SMALL_MKGAUSS.v:85) |
| DP_OP_59_126_1886               |            |                            |
|                | DP_OP_59_126_1886 |         |                            |
=============================================================================

Datapath Report for DP_OP_59_126_1886
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_59_126_1886    | sub_197 (MKGAUSS.v:197) sub_199 (MKGAUSS.v:199)     |
|                      | add_205 (MKGAUSS.v:205)                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 7     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Signed   | 7     | addsub(I1,I2,I3) ( MKGAUSS.v:197 MKGAUSS.v:199 MKGAUSS.v:205 ) |
==============================================================================


Resource Report for Ungrouped Hierarchy u_MKGAUSS in file ../01_RTL/MKGAUSS.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_1        | DW01_inc       | width=2    | add_96 (MKGAUSS.v:96)      |
| lt_x_3         | DW_cmp         | width=63   | lt_133 (MKGAUSS.v:133)     |
| gte_x_4        | DW_cmp         | width=63   | gte_147 (MKGAUSS.v:147)    |
| gte_x_5        | DW_cmp         | width=63   | gte_147_G2 (MKGAUSS.v:147) |
| gte_x_6        | DW_cmp         | width=63   | gte_147_G3 (MKGAUSS.v:147) |
| gte_x_7        | DW_cmp         | width=63   | gte_147_G4 (MKGAUSS.v:147) |
| gte_x_8        | DW_cmp         | width=63   | gte_147_G5 (MKGAUSS.v:147) |
| gte_x_9        | DW_cmp         | width=63   | gte_147_G6 (MKGAUSS.v:147) |
| gte_x_10       | DW_cmp         | width=63   | gte_147_G7 (MKGAUSS.v:147) |
| gte_x_11       | DW_cmp         | width=63   | gte_147_G8 (MKGAUSS.v:147) |
| gte_x_12       | DW_cmp         | width=63   | gte_147_G9 (MKGAUSS.v:147) |
| gte_x_13       | DW_cmp         | width=63   | gte_147_G10 (MKGAUSS.v:147) |
| gte_x_14       | DW_cmp         | width=63   | gte_147_G11 (MKGAUSS.v:147) |
| gte_x_15       | DW_cmp         | width=63   | gte_147_G12 (MKGAUSS.v:147) |
| gte_x_16       | DW_cmp         | width=63   | gte_147_G13 (MKGAUSS.v:147) |
| gte_x_17       | DW_cmp         | width=63   | gte_147_G14 (MKGAUSS.v:147) |
| gte_x_18       | DW_cmp         | width=63   | gte_147_G15 (MKGAUSS.v:147) |
| gte_x_19       | DW_cmp         | width=63   | gte_147_G16 (MKGAUSS.v:147) |
| gte_x_20       | DW_cmp         | width=63   | gte_147_G17 (MKGAUSS.v:147) |
| gte_x_21       | DW_cmp         | width=63   | gte_147_G18 (MKGAUSS.v:147) |
| gte_x_22       | DW_cmp         | width=63   | gte_147_G19 (MKGAUSS.v:147) |
| gte_x_23       | DW_cmp         | width=63   | gte_147_G20 (MKGAUSS.v:147) |
| gte_x_24       | DW_cmp         | width=63   | gte_147_G21 (MKGAUSS.v:147) |
| gte_x_25       | DW_cmp         | width=63   | gte_147_G22 (MKGAUSS.v:147) |
| gte_x_26       | DW_cmp         | width=63   | gte_147_G23 (MKGAUSS.v:147) |
| gte_x_27       | DW_cmp         | width=63   | gte_147_G24 (MKGAUSS.v:147) |
=============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_1            | DW01_inc         | apparch (area)     |                |
| add_x_1            | DW01_inc         | apparch (area)     |                |
| lt_x_3             | DW_cmp           | apparch (area)     |                |
| gte_x_4            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_6            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| gte_x_8            | DW_cmp           | apparch (area)     |                |
| gte_x_9            | DW_cmp           | apparch (area)     |                |
| gte_x_10           | DW_cmp           | apparch (area)     |                |
| gte_x_11           | DW_cmp           | apparch (area)     |                |
| gte_x_12           | DW_cmp           | apparch (area)     |                |
| gte_x_13           | DW_cmp           | apparch (area)     |                |
| gte_x_14           | DW_cmp           | apparch (area)     |                |
| gte_x_15           | DW_cmp           | apparch (area)     |                |
| gte_x_16           | DW_cmp           | apparch (area)     |                |
| gte_x_17           | DW_cmp           | apparch (area)     |                |
| gte_x_18           | DW_cmp           | apparch (area)     |                |
| gte_x_19           | DW_cmp           | apparch (area)     |                |
| gte_x_20           | DW_cmp           | apparch (area)     |                |
| gte_x_21           | DW_cmp           | apparch (area)     |                |
| gte_x_22           | DW_cmp           | apparch (area)     |                |
| gte_x_23           | DW_cmp           | apparch (area)     |                |
| gte_x_24           | DW_cmp           | apparch (area)     |                |
| gte_x_25           | DW_cmp           | apparch (area)     |                |
| gte_x_26           | DW_cmp           | apparch (area)     |                |
| gte_x_27           | DW_cmp           | apparch (area)     |                |
| DP_OP_59_126_1886  | DP_OP_59_126_1886 | str (area,speed)  |                |
===============================================================================

1
