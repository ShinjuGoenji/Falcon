 
****************************************
Report : resources
Design : MKGAUSS
Version: T-2022.03
Date   : Tue Jul 15 10:25:10 2025
****************************************


Resource Report for this hierarchy in file
        /home/daniel_kuo/Falcon/hardware/mkgauss/01_RTL/MKGAUSS.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_1        | DW01_inc       | width=2    | add_82 (MKGAUSS.v:82)      |
| lt_x_2         | DW_cmp         | width=63   | lt_116 (MKGAUSS.v:116)     |
| gte_x_3        | DW_cmp         | width=63   | gte_129 (MKGAUSS.v:129)    |
| gte_x_4        | DW_cmp         | width=63   | gte_129_G2 (MKGAUSS.v:129) |
| gte_x_5        | DW_cmp         | width=63   | gte_129_G3 (MKGAUSS.v:129) |
| gte_x_6        | DW_cmp         | width=63   | gte_129_G4 (MKGAUSS.v:129) |
| gte_x_7        | DW_cmp         | width=63   | gte_129_G5 (MKGAUSS.v:129) |
| gte_x_8        | DW_cmp         | width=63   | gte_129_G6 (MKGAUSS.v:129) |
| gte_x_9        | DW_cmp         | width=63   | gte_129_G7 (MKGAUSS.v:129) |
| gte_x_10       | DW_cmp         | width=63   | gte_129_G8 (MKGAUSS.v:129) |
| gte_x_11       | DW_cmp         | width=63   | gte_129_G9 (MKGAUSS.v:129) |
| gte_x_12       | DW_cmp         | width=63   | gte_129_G10 (MKGAUSS.v:129) |
| gte_x_13       | DW_cmp         | width=63   | gte_129_G11 (MKGAUSS.v:129) |
| gte_x_14       | DW_cmp         | width=63   | gte_129_G12 (MKGAUSS.v:129) |
| gte_x_15       | DW_cmp         | width=63   | gte_129_G13 (MKGAUSS.v:129) |
| gte_x_16       | DW_cmp         | width=63   | gte_129_G14 (MKGAUSS.v:129) |
| gte_x_17       | DW_cmp         | width=63   | gte_129_G15 (MKGAUSS.v:129) |
| gte_x_18       | DW_cmp         | width=63   | gte_129_G16 (MKGAUSS.v:129) |
| gte_x_19       | DW_cmp         | width=63   | gte_129_G17 (MKGAUSS.v:129) |
| gte_x_20       | DW_cmp         | width=63   | gte_129_G18 (MKGAUSS.v:129) |
| gte_x_21       | DW_cmp         | width=63   | gte_129_G19 (MKGAUSS.v:129) |
| gte_x_22       | DW_cmp         | width=63   | gte_129_G20 (MKGAUSS.v:129) |
| gte_x_23       | DW_cmp         | width=63   | gte_129_G21 (MKGAUSS.v:129) |
| gte_x_24       | DW_cmp         | width=63   | gte_129_G22 (MKGAUSS.v:129) |
| gte_x_25       | DW_cmp         | width=63   | gte_129_G23 (MKGAUSS.v:129) |
| gte_x_26       | DW_cmp         | width=63   | gte_129_G24 (MKGAUSS.v:129) |
| DP_OP_41_125_9017               |            |                            |
|                | DP_OP_41_125_9017 |         |                            |
=============================================================================

Datapath Report for DP_OP_41_125_9017
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_41_125_9017    | sub_174 (MKGAUSS.v:174) add_176 (MKGAUSS.v:176)     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 32    |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Signed   | 32    | addsub(I1,I2,I3) ( MKGAUSS.v:174 MKGAUSS.v:176 ) |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_1            | DW01_inc         | apparch (area)     |                |
| lt_x_2             | DW_cmp           | apparch (area)     |                |
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
| gte_x_26           | DW_cmp           | apparch (area)     |                |
| DP_OP_41_125_9017  | DP_OP_41_125_9017 | str (area,speed)  |                |
===============================================================================

1
