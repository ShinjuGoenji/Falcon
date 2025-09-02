 
****************************************
Report : resources
Design : POLY_INVNORM2_FFT
Version: T-2022.03
Date   : Tue Sep  2 21:19:31 2025
****************************************


Resource Report for this hierarchy
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| u_FPR_SQR_0    | DW_fp_square   | sig_width=52 | u_FPR_SQR_0 (POLY_INVNORM2_FFT.v:59) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_SQR_1    | DW_fp_square   | sig_width=52 | u_FPR_SQR_1 (POLY_INVNORM2_FFT.v:62) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_SQR_2    | DW_fp_square   | sig_width=52 | u_FPR_SQR_2 (POLY_INVNORM2_FFT.v:65) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_SQR_3    | DW_fp_square   | sig_width=52 | u_FPR_SQR_3 (POLY_INVNORM2_FFT.v:68) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_ADD_0    | DW_fp_add      | sig_width=52 | u_FPR_ADD_0 (POLY_INVNORM2_FFT.v:71) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_ADD_1    | DW_fp_add      | sig_width=52 | u_FPR_ADD_1 (POLY_INVNORM2_FFT.v:74) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_ADD_2    | DW_fp_add      | sig_width=52 | u_FPR_ADD_2 (POLY_INVNORM2_FFT.v:77) |
     |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_FPR_DIV      | DW_fp_div      | sig_width=52 | u_FPR_DIV (POLY_INVNORM2_FFT.v:80) |
       |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
|                |                | faithful_round=0 |                      |
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
| DP_OP_49J1_125_2805             |            |                            |
|                | DP_OP_49J1_125_2805 |       |                            |
| DP_OP_50J1_126_5914             |            |                            |
|                | DP_OP_50J1_126_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J1_125_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J1_125_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J1_126_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J1_126_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J2*139347/GEN_2.UL2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*J2*139347/GEN_2.UL1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_DIV in file ./DW_fp_div__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| eq_x_2         | DW_cmp         | width=53   | eq_888                     |
| mult_x_3       | DW_mult_uns    | a_width=54 | mult_915                   |
|                |                | b_width=9  |                            |
| add_x_5        | DW01_inc       | width=55   | add_1127                   |
| add_x_6        | DW01_add       | width=55   | add_1128                   |
| add_x_7        | DW01_add       | width=54   | add_1129                   |
| eq_x_8         | DW_cmp         | width=53   | eq_1137                    |
| eq_x_9         | DW_cmp         | width=54   | eq_1137_2                  |
| eq_x_11        | DW_cmp         | width=53   | eq_1139                    |
| eq_x_12        | DW_cmp         | width=54   | eq_1139_2                  |
| lt_x_18        | DW_cmp         | width=53   | lt_1191                    |
| eq_x_35        | DW_cmp         | width=13   | eq_1338                    |
| DP_OP_124J2_135_3002            |            |                            |
|                | DP_OP_124J2_135_3002 |      |                            |
| DP_OP_125J2_136_7072            |            |                            |
|                | DP_OP_125J2_136_7072 |      |                            |
| DP_OP_126J2_137_9075            |            |                            |
|                | DP_OP_126J2_137_9075 |      |                            |
=============================================================================

Datapath Report for DP_OP_124J2_135_3002
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_124J2_135_3002 | mult_909 mult_940 add_961 add_1022 mult_991         |
|                      | mult_989 add_1054 mult_1052 mult_1050               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 9     |                                          |
| I2    | PI   | Unsigned | 54    |                                          |
| I3    | PI   | Unsigned | 53    |                                          |
| I4    | PI   | Unsigned | 43    |                                          |
| I5    | PI   | Unsigned | 43    |                                          |
| I6    | PI   | Unsigned | 30    |                                          |
| I7    | PI   | Unsigned | 29    |                                          |
| T4    | IFO  | Unsigned | 63    | I1 * I2                                  |
| T72   | IFO  | Unsigned | 60    | T4[62:3]                                 |
| T71   | IFO  | Unsigned | 53    | T4[62:10]                                |
| T6    | IFO  | Unsigned | 106   | T71 * I3                                 |
| T73   | IFO  | Unsigned | 53    | T6[105:53]                               |
| T77   | IFO  | Unsigned | 57    | O1[59:3]                                 |
| T76   | IFO  | Unsigned | 43    | O3[85:43]                                |
| T9    | IFO  | Unsigned | 86    | I4 * T76                                 |
| T78   | IFO  | Unsigned | 43    | T9[85:43]                                |
| T11   | IFO  | Unsigned | 58    | I7 * I7                                  |
| T81   | IFO  | Unsigned | 28    | T11[57:30]                               |
| T12   | IFO  | Unsigned | 58    | I6 * T81                                 |
| T82   | IFO  | Unsigned | 27    | T12[57:31]                               |
| O1    | PO   | Unsigned | 60    | T72 + T73                                |
| O2    | PO   | Unsigned | 57    | T77 + T78                                |
| O3    | PO   | Unsigned | 86    | I5 * I5                                  |
| O4    | PO   | Unsigned | 57    | O2 + T82                                 |
==============================================================================

Datapath Report for DP_OP_125J2_136_7072
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_125J2_136_7072 | mult_1134 add_1135 eq_1146 eq_1146_2 eq_1142        |
|                      | eq_1142_2                                           |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 54    |                                          |
| I2    | PI   | Unsigned | 54    |                                          |
| I3    | PI   | Unsigned | 2     |                                          |
| T93   | IFO  | Signed   | 2     | O2[54:53]                                |
| T94   | IFO  | Unsigned | 2     | O2[55:54]                                |
| T90   | IFO  | Signed   | 2     | O1[54:53]                                |
| T92   | IFO  | Unsigned | 2     | O1[55:54]                                |
| O1    | PO   | Unsigned | 56    | I1 * I2                                  |
| O2    | PO   | Unsigned | 56    | O1 + I2                                  |
| O3    | PO   | Unsigned | 1     | $unsigned(T93) == I3                     |
| O4    | PO   | Unsigned | 1     | T94 == I3                                |
| O5    | PO   | Unsigned | 1     | $unsigned(T90) == I3                     |
| O6    | PO   | Unsigned | 1     | T92 == I3                                |
==============================================================================

Datapath Report for DP_OP_126J2_137_9075
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_126J2_137_9075 | sub_856_4 add_856_4 sub_1200 gte_1309 gte_1309_2    |
|                      | lte_1310 lte_1311                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Signed   | 13    | I1 - I2 + $unsigned(10'b1111111111) - I3 |
| O2    | PO   | Signed   | 1     | O1 >= $signed(12'b011111111111)          |
| O3    | PO   | Signed   | 1     | O1 >= $signed(1'b0)                      |
| O4    | PO   | Signed   | 1     | O1 <= $signed(1'b0)                      |
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
| DP_OP_49J1_127_2805             |            |                            |
|                | DP_OP_49J1_127_2805 |       |                            |
| DP_OP_50J1_128_5914             |            |                            |
|                | DP_OP_50J1_128_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J1_127_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J1_127_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J1_128_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J1_128_5914  | add_306 sub_307                                     |
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
| DP_OP_49J1_129_2805             |            |                            |
|                | DP_OP_49J1_129_2805 |       |                            |
| DP_OP_50J1_130_5914             |            |                            |
|                | DP_OP_50J1_130_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J1_129_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J1_129_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J1_130_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J1_130_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_FPR_SQR_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_FPR_SQR_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


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


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| u_FPR_SQR_0        | DW_fp_square     | rtl                |                |
| u_FPR_SQR_1        | DW_fp_square     | rtl                |                |
| u_FPR_SQR_2        | DW_fp_square     | rtl                |                |
| u_FPR_SQR_3        | DW_fp_square     | rtl                |                |
| u_FPR_ADD_0        | DW_fp_add        | rtl                |                |
| u_FPR_ADD_1        | DW_fp_add        | rtl                |                |
| u_FPR_ADD_2        | DW_fp_add        | rtl                |                |
| u_FPR_DIV          | DW_fp_div        | str                |                |
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
| U3                 | DW_lzd           | cla                |                |
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
| U3                 | DW_lzd           | cla                |                |
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
| U3                 | DW_lzd           | cla                |                |
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
| U3                 | DW_lzd           | cla                |                |
| U2                 | DW_square        | pparch (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| sub_x_4            | DW01_sub         | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_12           | DW01_inc         | pparch (area,speed)                 |
| U1                 | DW_lzd           | cla                |                |
| eq_x_2             | DW_cmp           | apparch (area)     |                |
| mult_x_3           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4_mux          |
| add_x_5            | DW01_inc         | pparch (area,speed)                 |
| add_x_6            | DW01_add         | pparch (area,speed)                 |
| add_x_7            | DW01_add         | pparch (area,speed)                 |
| eq_x_8             | DW_cmp           | apparch (area)     |                |
| eq_x_9             | DW_cmp           | apparch (area)     |                |
| eq_x_11            | DW_cmp           | apparch (area)     |                |
| eq_x_12            | DW_cmp           | apparch (area)     |                |
| lt_x_18            | DW_cmp           | apparch (area)     |                |
| eq_x_35            | DW_cmp           | apparch (area)     |                |
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
| DP_OP_49J1_125_2805                   |                    |                |
|                    | DP_OP_49J1_125_2805 | str (area,speed)                 |
| DP_OP_50J1_126_5914                   |                    |                |
|                    | DP_OP_50J1_126_5914 | str (area,speed)                 |
| DP_OP_124J2_135_3002                  |                    |                |
|                    | DP_OP_124J2_135_3002 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_125J2_136_7072                  |                    |                |
|                    | DP_OP_125J2_136_7072 | str (area,speed)                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_126J2_137_9075                  |                    |                |
|                    | DP_OP_126J2_137_9075 | str (area)     |                |
| DP_OP_49J1_127_2805                   |                    |                |
|                    | DP_OP_49J1_127_2805 | str (area,speed)                 |
| DP_OP_50J1_128_5914                   |                    |                |
|                    | DP_OP_50J1_128_5914 | str (area)      |                |
| DP_OP_49J1_129_2805                   |                    |                |
|                    | DP_OP_49J1_129_2805 | str (area,speed)                 |
| DP_OP_50J1_130_5914                   |                    |                |
|                    | DP_OP_50J1_130_5914 | str (area)      |                |
===============================================================================

1
