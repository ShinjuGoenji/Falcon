 
****************************************
Report : resources
Design : MKGAUSS
Version: T-2022.03
Date   : Tue Jul 15 06:07:22 2025
****************************************


Resource Report for this hierarchy in file
        /home/daniel_kuo/Falcon/hardware/mkgauss/01_RTL/MKGAUSS.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_95 (MKGAUSS.v:95)       |
| gte_x_2        | DW_cmp         | width=63   | gte_109 (MKGAUSS.v:109)    |
| gte_x_3        | DW_cmp         | width=63   | gte_109_G2 (MKGAUSS.v:109) |
| gte_x_4        | DW_cmp         | width=63   | gte_109_G3 (MKGAUSS.v:109) |
| gte_x_5        | DW_cmp         | width=63   | gte_109_G4 (MKGAUSS.v:109) |
| gte_x_6        | DW_cmp         | width=63   | gte_109_G5 (MKGAUSS.v:109) |
| gte_x_7        | DW_cmp         | width=63   | gte_109_G6 (MKGAUSS.v:109) |
| gte_x_8        | DW_cmp         | width=63   | gte_109_G7 (MKGAUSS.v:109) |
| gte_x_9        | DW_cmp         | width=63   | gte_109_G8 (MKGAUSS.v:109) |
| gte_x_10       | DW_cmp         | width=63   | gte_109_G9 (MKGAUSS.v:109) |
| gte_x_11       | DW_cmp         | width=63   | gte_109_G10 (MKGAUSS.v:109) |
| gte_x_12       | DW_cmp         | width=63   | gte_109_G11 (MKGAUSS.v:109) |
| gte_x_13       | DW_cmp         | width=63   | gte_109_G12 (MKGAUSS.v:109) |
| gte_x_14       | DW_cmp         | width=63   | gte_109_G13 (MKGAUSS.v:109) |
| gte_x_15       | DW_cmp         | width=63   | gte_109_G14 (MKGAUSS.v:109) |
| gte_x_16       | DW_cmp         | width=63   | gte_109_G15 (MKGAUSS.v:109) |
| gte_x_17       | DW_cmp         | width=63   | gte_109_G16 (MKGAUSS.v:109) |
| gte_x_18       | DW_cmp         | width=63   | gte_109_G17 (MKGAUSS.v:109) |
| gte_x_19       | DW_cmp         | width=63   | gte_109_G18 (MKGAUSS.v:109) |
| gte_x_20       | DW_cmp         | width=63   | gte_109_G19 (MKGAUSS.v:109) |
| gte_x_21       | DW_cmp         | width=63   | gte_109_G20 (MKGAUSS.v:109) |
| gte_x_22       | DW_cmp         | width=63   | gte_109_G21 (MKGAUSS.v:109) |
| gte_x_23       | DW_cmp         | width=63   | gte_109_G22 (MKGAUSS.v:109) |
| gte_x_24       | DW_cmp         | width=63   | gte_109_G23 (MKGAUSS.v:109) |
| gte_x_25       | DW_cmp         | width=63   | gte_109_G24 (MKGAUSS.v:109) |
| add_x_29       | DW01_inc       | width=2    | add_161 (MKGAUSS.v:161)    |
| DP_OP_40_125_9017               |            |                            |
|                | DP_OP_40_125_9017 |         |                            |
=============================================================================

Datapath Report for DP_OP_40_125_9017
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_40_125_9017    | sub_152 (MKGAUSS.v:152) add_154 (MKGAUSS.v:154)     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 32    |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Signed   | 32    | addsub(I1,I2,I3) ( MKGAUSS.v:152 MKGAUSS.v:154 ) |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| lt_x_1             | DW_cmp           | apparch (area)     |                |
| gte_x_2            | DW_cmp           | apparch (area)     |                |
| gte_x_3            | DW_cmp           | apparch (area)     |                |
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
| add_x_29           | DW01_inc         | apparch (area)     |                |
| DP_OP_40_125_9017  | DP_OP_40_125_9017 | str (area,speed)  |                |
===============================================================================

1
