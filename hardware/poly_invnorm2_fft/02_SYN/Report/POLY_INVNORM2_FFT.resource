 
****************************************
Report : resources
Design : POLY_INVNORM2_FFT
Version: T-2022.03
Date   : Thu Sep  4 07:31:22 2025
****************************************


Resource Report for this hierarchy
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| u_FPR_SQR_0    | DW_fp_square   | sig_width=52 | u_FPR_SQR_0 (POLY_INVNORM2_FFT.v:73) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_SQR_1    | DW_fp_square   | sig_width=52 | u_FPR_SQR_1 (POLY_INVNORM2_FFT.v:76) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_SQR_2    | DW_fp_square   | sig_width=52 | u_FPR_SQR_2 (POLY_INVNORM2_FFT.v:79) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_SQR_3    | DW_fp_square   | sig_width=52 | u_FPR_SQR_3 (POLY_INVNORM2_FFT.v:82) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_ADD_0    | DW_fp_add      | sig_width=52 | u_FPR_ADD_0 (POLY_INVNORM2_FFT.v:85) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_ADD_1    | DW_fp_add      | sig_width=52 | u_FPR_ADD_1 (POLY_INVNORM2_FFT.v:88) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_ADD_2    | DW_fp_add      | sig_width=52 | u_FPR_ADD_2 (POLY_INVNORM2_FFT.v:91) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_DIV      | DW_lp_piped_fp_div | sig_width=52 | u_FPR_DIV (POLY_INVNORM2_FFT.v:94) |
   |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
|                |                | faithful_round=0 |                      |
|                |                | op_iso_mode=1 |                         |
|                |                | id_width=1 |                            |
|                |                | in_reg=0   |                            |
|                |                | stages=4   |                            |
|                |                | out_reg=0  |                            |
|                |                | no_pm=1    |                            |
|                |                | rst_mode=0 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_ADD_2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_3 in file
        ./DW_fp_square__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| sub_x_1        | DW01_sub       | width=13   | sub_314_3                  |
| add_x_2        | DW01_inc       | width=11   | add_317                    |
| gte_x_5        | DW_cmp         | width=12   | gte_329                    |
| gte_x_7        | DW_cmp         | width=12   | gte_331                    |
| gt_x_14        | DW_cmp         | width=53   | gt_421                     |
| lt_x_15        | DW_cmp         | width=9    | lt_434                     |
| lt_x_16        | DW_cmp         | width=9    | lt_438                     |
| add_x_17       | DW01_add       | width=53   | add_443                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U2             | DW_square      | width=53   | U2                         |
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_2 in file
        ./DW_fp_square__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| sub_x_1        | DW01_sub       | width=13   | sub_314_3                  |
| add_x_2        | DW01_inc       | width=11   | add_317                    |
| gte_x_5        | DW_cmp         | width=12   | gte_329                    |
| gte_x_7        | DW_cmp         | width=12   | gte_331                    |
| gt_x_14        | DW_cmp         | width=53   | gt_421                     |
| lt_x_15        | DW_cmp         | width=9    | lt_434                     |
| lt_x_16        | DW_cmp         | width=9    | lt_438                     |
| add_x_17       | DW01_add       | width=53   | add_443                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U2             | DW_square      | width=53   | U2                         |
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_1 in file
        ./DW_fp_square__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| sub_x_1        | DW01_sub       | width=13   | sub_314_3                  |
| add_x_2        | DW01_inc       | width=11   | add_317                    |
| gte_x_5        | DW_cmp         | width=12   | gte_329                    |
| gte_x_7        | DW_cmp         | width=12   | gte_331                    |
| gt_x_14        | DW_cmp         | width=53   | gt_421                     |
| lt_x_15        | DW_cmp         | width=9    | lt_434                     |
| lt_x_16        | DW_cmp         | width=9    | lt_438                     |
| add_x_17       | DW01_add       | width=53   | add_443                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U2             | DW_square      | width=53   | U2                         |
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_0 in file
        ./DW_fp_square__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| sub_x_1        | DW01_sub       | width=13   | sub_314_3                  |
| add_x_2        | DW01_inc       | width=11   | add_317                    |
| gte_x_5        | DW_cmp         | width=12   | gte_329                    |
| gte_x_7        | DW_cmp         | width=12   | gte_331                    |
| gt_x_14        | DW_cmp         | width=53   | gt_421                     |
| lt_x_15        | DW_cmp         | width=9    | lt_434                     |
| lt_x_16        | DW_cmp         | width=9    | lt_438                     |
| add_x_17       | DW01_add       | width=53   | add_443                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U2             | DW_square      | width=53   | U2                         |
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_ADD_2/U1 in file
        ./DW_fp_addsub__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_191                     |
| sub_x_4        | DW01_sub       | width=11   | sub_232                    |
| ashr_5         | DW_rightsh     | A_width=55 | srl_237_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_239                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=55 | sll_266                    |
|                |                | SH_width=6 |                            |
| add_x_12       | DW01_inc       | width=52   | add_303                    |
| U1             | DW_lzd         | a_width=56 | U1                         |
| DP_OP_49J1_126_2805             |            |                            |
|                | DP_OP_49J1_126_2805 |       |                            |
| DP_OP_50J1_127_5914             |            |                            |
|                | DP_OP_50J1_127_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J1_126_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J1_126_2805  | add_249 add_249_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 56    |                                          |
| I2    | PI   | Unsigned | 57    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 57    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_50J1_127_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J1_127_5914  | add_306 sub_307                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| O1    | PO   | Unsigned | 12    | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 13    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_ADD_1/U1 in file
        ./DW_fp_addsub__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_191                     |
| sub_x_4        | DW01_sub       | width=11   | sub_232                    |
| ashr_5         | DW_rightsh     | A_width=55 | srl_237_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_239                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=55 | sll_266                    |
|                |                | SH_width=6 |                            |
| add_x_12       | DW01_inc       | width=52   | add_303                    |
| U1             | DW_lzd         | a_width=56 | U1                         |
| DP_OP_49J1_128_2805             |            |                            |
|                | DP_OP_49J1_128_2805 |       |                            |
| DP_OP_50J1_129_5914             |            |                            |
|                | DP_OP_50J1_129_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J1_128_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J1_128_2805  | add_249 add_249_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 56    |                                          |
| I2    | PI   | Unsigned | 57    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 57    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_50J1_129_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J1_129_5914  | add_306 sub_307                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| O1    | PO   | Unsigned | 12    | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 13    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_ADD_2/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_ADD_0/U1 in file
        ./DW_fp_addsub__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_191                     |
| sub_x_4        | DW01_sub       | width=11   | sub_232                    |
| ashr_5         | DW_rightsh     | A_width=55 | srl_237_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_239                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=55 | sll_266                    |
|                |                | SH_width=6 |                            |
| add_x_12       | DW01_inc       | width=52   | add_303                    |
| U1             | DW_lzd         | a_width=56 | U1                         |
| DP_OP_49J1_130_2805             |            |                            |
|                | DP_OP_49J1_130_2805 |       |                            |
| DP_OP_50J1_131_5914             |            |                            |
|                | DP_OP_50J1_131_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J1_130_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J1_130_2805  | add_249 add_249_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 56    |                                          |
| I2    | PI   | Unsigned | 57    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 57    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_50J1_131_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J1_131_5914  | add_306 sub_307                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| O1    | PO   | Unsigned | 12    | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 13    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_ADD_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_ADD_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| u_FPR_DIV          | DW_lp_piped_fp_div | rtl              |                |
| u_FPR_SQR_0        | DW_fp_square     | rtl                |                |
| u_FPR_SQR_1        | DW_fp_square     | rtl                |                |
| u_FPR_SQR_2        | DW_fp_square     | rtl                |                |
| u_FPR_SQR_3        | DW_fp_square     | rtl                |                |
| u_FPR_ADD_0        | DW_fp_add        | rtl                |                |
| u_FPR_ADD_1        | DW_fp_add        | rtl                |                |
| u_FPR_ADD_2        | DW_fp_add        | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| sub_x_1            | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| gt_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_15            | DW_cmp           | apparch (area)     |                |
| lt_x_16            | DW_cmp           | apparch (area)     |                |
| add_x_17           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | rtl                |                |
| U2                 | DW_square        | pparch (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| sub_x_1            | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| gt_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_15            | DW_cmp           | apparch (area)     |                |
| lt_x_16            | DW_cmp           | apparch (area)     |                |
| add_x_17           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | rtl                |                |
| U2                 | DW_square        | pparch (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| sub_x_1            | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| gt_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_15            | DW_cmp           | apparch (area)     |                |
| lt_x_16            | DW_cmp           | apparch (area)     |                |
| add_x_17           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | rtl                |                |
| U2                 | DW_square        | pparch (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| sub_x_1            | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| gt_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_15            | DW_cmp           | apparch (area)     |                |
| lt_x_16            | DW_cmp           | apparch (area)     |                |
| add_x_17           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | rtl                |                |
| U2                 | DW_square        | pparch (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| sub_x_4            | DW01_sub         | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_12           | DW01_inc         | pparch (area,speed)                 |
| U1                 | DW_lzd           | cla                |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| sub_x_4            | DW01_sub         | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_12           | DW01_inc         | pparch (area,speed)                 |
| U1                 | DW_lzd           | cla                |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| sub_x_4            | DW01_sub         | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_12           | DW01_inc         | pparch (area,speed)                 |
| U1                 | DW_lzd           | cla                |                |
| DP_OP_49J1_126_2805                   |                    |                |
|                    | DP_OP_49J1_126_2805 | str (area,speed)                 |
| DP_OP_50J1_127_5914                   |                    |                |
|                    | DP_OP_50J1_127_5914 | str (area,speed)                 |
| DP_OP_49J1_128_2805                   |                    |                |
|                    | DP_OP_49J1_128_2805 | str (area,speed)                 |
| DP_OP_50J1_129_5914                   |                    |                |
|                    | DP_OP_50J1_129_5914 | str (area,speed)                 |
| DP_OP_49J1_130_2805                   |                    |                |
|                    | DP_OP_49J1_130_2805 | str (area,speed)                 |
| DP_OP_50J1_131_5914                   |                    |                |
|                    | DP_OP_50J1_131_5914 | str (area,speed)                 |
===============================================================================

1
