 
****************************************
Report : resources
Design : FFT
Version: T-2022.03
Date   : Thu Jul 24 17:50:29 2025
****************************************


Resource Report for this hierarchy in file ../01_RTL/RADIX2.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_4        | DW_cmp         | width=9    | u_stage_1/gte_148 (RADIX2.v:148) |
| add_x_8        | DW01_inc       | width=9    | u_stage_1/add_163 (RADIX2.v:163) |
| add_x_9        | DW01_add       | width=3    | u_stage_1/add_164 (RADIX2.v:164) |
| eq_x_12        | DW_cmp         | width=8    | u_stage_1/eq_172 (RADIX2.v:172) |
| eq_x_13        | DW_cmp         | width=8    | u_stage_1/eq_179 (RADIX2.v:179) |
| gte_x_29       | DW_cmp         | width=9    | u_stage_2/gte_148 (RADIX2.v:148) |
| add_x_33       | DW01_inc       | width=8    | u_stage_2/add_163 (RADIX2.v:163) |
| add_x_34       | DW01_add       | width=4    | u_stage_2/add_164 (RADIX2.v:164) |
| eq_x_37        | DW_cmp         | width=7    | u_stage_2/eq_172 (RADIX2.v:172) |
| eq_x_38        | DW_cmp         | width=7    | u_stage_2/eq_179 (RADIX2.v:179) |
| gte_x_54       | DW_cmp         | width=9    | u_stage_3/gte_148 (RADIX2.v:148) |
| add_x_58       | DW01_inc       | width=8    | u_stage_3/add_163 (RADIX2.v:163) |
| eq_x_62        | DW_cmp         | width=6    | u_stage_3/eq_172 (RADIX2.v:172) |
| eq_x_63        | DW_cmp         | width=6    | u_stage_3/eq_179 (RADIX2.v:179) |
| gte_x_79       | DW_cmp         | width=9    | u_stage_4/gte_148 (RADIX2.v:148) |
| add_x_83       | DW01_inc       | width=8    | u_stage_4/add_163 (RADIX2.v:163) |
| eq_x_87        | DW_cmp         | width=5    | u_stage_4/eq_172 (RADIX2.v:172) |
| eq_x_88        | DW_cmp         | width=5    | u_stage_4/eq_179 (RADIX2.v:179) |
| gte_x_104      | DW_cmp         | width=9    | u_stage_5/gte_148 (RADIX2.v:148) |
| add_x_108      | DW01_inc       | width=8    | u_stage_5/add_163 (RADIX2.v:163) |
| eq_x_112       | DW_cmp         | width=4    | u_stage_5/eq_172 (RADIX2.v:172) |
| eq_x_113       | DW_cmp         | width=4    | u_stage_5/eq_179 (RADIX2.v:179) |
| gte_x_129      | DW_cmp         | width=9    | u_stage_6/gte_148 (RADIX2.v:148) |
| add_x_133      | DW01_inc       | width=8    | u_stage_6/add_163 (RADIX2.v:163) |
| eq_x_137       | DW_cmp         | width=3    | u_stage_6/eq_172 (RADIX2.v:172) |
| eq_x_138       | DW_cmp         | width=3    | u_stage_6/eq_179 (RADIX2.v:179) |
| gte_x_154      | DW_cmp         | width=9    | u_stage_7/gte_148 (RADIX2.v:148) |
| add_x_158      | DW01_inc       | width=8    | u_stage_7/add_163 (RADIX2.v:163) |
| eq_x_162       | DW_cmp         | width=2    | u_stage_7/eq_172 (RADIX2.v:172) |
| eq_x_163       | DW_cmp         | width=2    | u_stage_7/eq_179 (RADIX2.v:179) |
| gte_x_179      | DW_cmp         | width=9    | u_stage_8/gte_148 (RADIX2.v:148) |
| add_x_183      | DW01_inc       | width=8    | u_stage_8/add_163 (RADIX2.v:163) |
| u_stage_1/u_FPC_MUL/u_FPC_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPC_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_FPC_MUL/u_FPC_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPC_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_FPC_MUL/u_FPC_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPC_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_FPC_MUL/u_FPC_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPC_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_FPC_MUL/u_FPC_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPC_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_FPC_MUL/u_FPC_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPC_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPC_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPC_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPC_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPC_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPC_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPC_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPC_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPC_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPC_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPC_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPC_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPC_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPC_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPC_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPC_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPC_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPC_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPC_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPC_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPC_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPC_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPC_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPC_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPC_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPC_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPC_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPC_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPC_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPC_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPC_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPC_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPC_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPC_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPC_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPC_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPC_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPC_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPC_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPC_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPC_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPC_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPC_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPC_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPC_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPC_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPC_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPC_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPC_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPC_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPC_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPC_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPC_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPC_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPC_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPC_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPC_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPC_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPC_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPC_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPC_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPC_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPC_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPC_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPC_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPC_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPC_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPC_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPC_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPC_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPC_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPC_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPC_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPC_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPC_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPC_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPC_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPC_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPC_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPC_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPC_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPC_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPC_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPC_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPC_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| lt_x_198       | DW_cmp         | width=9    | u_stage_1/lt_158 (RADIX2.v:158) |
            |                |            | u_stage_1/lt_226 (RADIX2.v:226) |
| lt_x_199       | DW_cmp         | width=9    | u_stage_2/lt_158 (RADIX2.v:158) |
            |                |            | u_stage_2/lt_226 (RADIX2.v:226) |
| lt_x_200       | DW_cmp         | width=9    | u_stage_3/lt_158 (RADIX2.v:158) |
            |                |            | u_stage_3/lt_226 (RADIX2.v:226) |
| lt_x_201       | DW_cmp         | width=9    | u_stage_4/lt_158 (RADIX2.v:158) |
            |                |            | u_stage_4/lt_226 (RADIX2.v:226) |
| lt_x_202       | DW_cmp         | width=9    | u_stage_5/lt_158 (RADIX2.v:158) |
            |                |            | u_stage_5/lt_226 (RADIX2.v:226) |
| lt_x_203       | DW_cmp         | width=9    | u_stage_6/lt_158 (RADIX2.v:158) |
            |                |            | u_stage_6/lt_226 (RADIX2.v:226) |
| lt_x_204       | DW_cmp         | width=9    | u_stage_7/lt_158 (RADIX2.v:158) |
            |                |            | u_stage_7/lt_226 (RADIX2.v:226) |
| lt_x_205       | DW_cmp         | width=9    | u_stage_8/lt_158 (RADIX2.v:158) |
            |                |            | u_stage_8/lt_226 (RADIX2.v:226) |
| add_x_11       | DW01_add       | width=8    | u_stage_1/add_172 (RADIX2.v:172) |
           |                |            | u_stage_1/add_177 (RADIX2.v:177) |
           |                |            | u_stage_1/add_179 (RADIX2.v:179) |
| add_x_36       | DW01_add       | width=7    | u_stage_2/add_172 (RADIX2.v:172) |
           |                |            | u_stage_2/add_177 (RADIX2.v:177) |
           |                |            | u_stage_2/add_179 (RADIX2.v:179) |
| add_x_61       | DW01_add       | width=6    | u_stage_3/add_172 (RADIX2.v:172) |
           |                |            | u_stage_3/add_177 (RADIX2.v:177) |
           |                |            | u_stage_3/add_179 (RADIX2.v:179) |
| add_x_86       | DW01_add       | width=5    | u_stage_4/add_172 (RADIX2.v:172) |
           |                |            | u_stage_4/add_177 (RADIX2.v:177) |
           |                |            | u_stage_4/add_179 (RADIX2.v:179) |
| add_x_111      | DW01_add       | width=4    | u_stage_5/add_172 (RADIX2.v:172) |
           |                |            | u_stage_5/add_177 (RADIX2.v:177) |
           |                |            | u_stage_5/add_179 (RADIX2.v:179) |
| add_x_136      | DW01_add       | width=3    | u_stage_6/add_172 (RADIX2.v:172) |
           |                |            | u_stage_6/add_177 (RADIX2.v:177) |
           |                |            | u_stage_6/add_179 (RADIX2.v:179) |
| add_x_161      | DW01_add       | width=2    | u_stage_7/add_172 (RADIX2.v:172) |
           |                |            | u_stage_7/add_177 (RADIX2.v:177) |
           |                |            | u_stage_7/add_179 (RADIX2.v:179) |
| add_x_5        | DW01_inc       | width=9    | u_stage_1/add_149 (RADIX2.v:149) |
           |                |            | u_stage_1/add_151 (RADIX2.v:151) |
| add_x_30       | DW01_inc       | width=9    | u_stage_2/add_149 (RADIX2.v:149) |
           |                |            | u_stage_2/add_151 (RADIX2.v:151) |
| add_x_55       | DW01_inc       | width=9    | u_stage_3/add_149 (RADIX2.v:149) |
           |                |            | u_stage_3/add_151 (RADIX2.v:151) |
| add_x_80       | DW01_inc       | width=9    | u_stage_4/add_149 (RADIX2.v:149) |
           |                |            | u_stage_4/add_151 (RADIX2.v:151) |
| add_x_105      | DW01_inc       | width=9    | u_stage_5/add_149 (RADIX2.v:149) |
           |                |            | u_stage_5/add_151 (RADIX2.v:151) |
| add_x_130      | DW01_inc       | width=9    | u_stage_6/add_149 (RADIX2.v:149) |
           |                |            | u_stage_6/add_151 (RADIX2.v:151) |
| add_x_155      | DW01_inc       | width=9    | u_stage_7/add_149 (RADIX2.v:149) |
           |                |            | u_stage_7/add_151 (RADIX2.v:151) |
| add_x_180      | DW01_inc       | width=9    | u_stage_8/add_149 (RADIX2.v:149) |
           |                |            | u_stage_8/add_151 (RADIX2.v:151) |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_0 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_1 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_2 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_3 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_0 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_1 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_2 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_3 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_0 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_1 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_2 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_3 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_0 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_1 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_2 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_3 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_0 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_1 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_2 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_3 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_0 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_1 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_2 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_3 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_0 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_1 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_2 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_3 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_0 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_1 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_2 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_3 in
        file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=11   | add_366                    |
| lte_x_3        | DW_cmp         | width=13   | lte_374                    |
| gte_x_5        | DW_cmp         | width=12   | gte_384                    |
| gte_x_7        | DW_cmp         | width=12   | gte_386                    |
| add_x_12       | DW01_add       | width=8    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=53 | mult_477                   |
|                |                | b_width=53 |                            |
| eq_x_14        | DW_cmp         | width=13   | eq_478                     |
| lt_x_17        | DW_cmp         | width=9    | lt_492                     |
| lt_x_19        | DW_cmp         | width=9    | lt_497                     |
| add_x_20       | DW01_add       | width=53   | add_501                    |
| U1             | DW_lzd         | a_width=53 | U1                         |
| U2             | DW_lzd         | a_width=53 | U2                         |
| U3             | DW_lzd         | a_width=53 | U3                         |
| U4             | DW_lzd         | a_width=53 | U4                         |
| sub_x_33       | DW01_sub       | width=12   | add_363 sub_363            |
| add_x_34       | DW01_add       | width=13   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*J11*568488/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_SUB/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J11_323_9389            |            |                            |
|                | DP_OP_65J11_323_9389 |      |                            |
| DP_OP_66J11_324_2805            |            |                            |
|                | DP_OP_66J11_324_2805 |      |                            |
| DP_OP_67J11_325_5914            |            |                            |
|                | DP_OP_67J11_325_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J11_323_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J11_323_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J11_324_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J11_324_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J11_325_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J11_325_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*568488/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_SUB/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_323_9389               |            |                            |
|                | DP_OP_65_323_9389 |         |                            |
| DP_OP_66_324_2805               |            |                            |
|                | DP_OP_66_324_2805 |         |                            |
| DP_OP_67_325_5914               |            |                            |
|                | DP_OP_67_325_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_323_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_323_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_324_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_324_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_325_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_325_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J13*568488/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_SUB/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J13_323_9389            |            |                            |
|                | DP_OP_65J13_323_9389 |      |                            |
| DP_OP_66J13_324_2805            |            |                            |
|                | DP_OP_66J13_324_2805 |      |                            |
| DP_OP_67J13_325_5914            |            |                            |
|                | DP_OP_67J13_325_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J13_323_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J13_323_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J13_324_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J13_324_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J13_325_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J13_325_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J11*584480/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_SUB/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J11_331_9389            |            |                            |
|                | DP_OP_65J11_331_9389 |      |                            |
| DP_OP_66J11_332_2805            |            |                            |
|                | DP_OP_66J11_332_2805 |      |                            |
| DP_OP_67J11_333_5914            |            |                            |
|                | DP_OP_67J11_333_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J11_331_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J11_331_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J11_332_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J11_332_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J11_333_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J11_333_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*584480/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_SUB/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_331_9389               |            |                            |
|                | DP_OP_65_331_9389 |         |                            |
| DP_OP_66_332_2805               |            |                            |
|                | DP_OP_66_332_2805 |         |                            |
| DP_OP_67_333_5914               |            |                            |
|                | DP_OP_67_333_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_331_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_331_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_332_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_332_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_333_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_333_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J13*584480/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_SUB/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J13_331_9389            |            |                            |
|                | DP_OP_65J13_331_9389 |      |                            |
| DP_OP_66J13_332_2805            |            |                            |
|                | DP_OP_66J13_332_2805 |      |                            |
| DP_OP_67J13_333_5914            |            |                            |
|                | DP_OP_67J13_333_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J13_331_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J13_331_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J13_332_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J13_332_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J13_333_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J13_333_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J12*568488/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_SUB/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J12_323_9389            |            |                            |
|                | DP_OP_65J12_323_9389 |      |                            |
| DP_OP_66J12_324_2805            |            |                            |
|                | DP_OP_66J12_324_2805 |      |                            |
| DP_OP_67J12_325_5914            |            |                            |
|                | DP_OP_67J12_325_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J12_323_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J12_323_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J12_324_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J12_324_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J12_325_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J12_325_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J11*600472/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_SUB/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J11_339_9389            |            |                            |
|                | DP_OP_65J11_339_9389 |      |                            |
| DP_OP_66J11_340_2805            |            |                            |
|                | DP_OP_66J11_340_2805 |      |                            |
| DP_OP_67J11_341_5914            |            |                            |
|                | DP_OP_67J11_341_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J11_339_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J11_339_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J11_340_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J11_340_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J11_341_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J11_341_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J14*664568/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_ADD/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J14_515_9389            |            |                            |
|                | DP_OP_65J14_515_9389 |      |                            |
| DP_OP_66J14_516_2805            |            |                            |
|                | DP_OP_66J14_516_2805 |      |                            |
| DP_OP_67J14_517_5914            |            |                            |
|                | DP_OP_67J14_517_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J14_515_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J14_515_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J14_516_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J14_516_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J14_517_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J14_517_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J15*664568/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_ADD/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J15_515_9389            |            |                            |
|                | DP_OP_65J15_515_9389 |      |                            |
| DP_OP_66J15_516_2805            |            |                            |
|                | DP_OP_66J15_516_2805 |      |                            |
| DP_OP_67J15_517_5914            |            |                            |
|                | DP_OP_67J15_517_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J15_515_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J15_515_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J15_516_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J15_516_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J15_517_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J15_517_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J16*664568/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_ADD/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J16_515_9389            |            |                            |
|                | DP_OP_65J16_515_9389 |      |                            |
| DP_OP_66J16_516_2805            |            |                            |
|                | DP_OP_66J16_516_2805 |      |                            |
| DP_OP_67J16_517_5914            |            |                            |
|                | DP_OP_67J16_517_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J16_515_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J16_515_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J16_516_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J16_516_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J16_517_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J16_517_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*664568/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_ADD/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_515_9389               |            |                            |
|                | DP_OP_65_515_9389 |         |                            |
| DP_OP_66_516_2805               |            |                            |
|                | DP_OP_66_516_2805 |         |                            |
| DP_OP_67_517_5914               |            |                            |
|                | DP_OP_67_517_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_515_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_515_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_516_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_516_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_517_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_517_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J14*680565/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_ADD/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J14_523_9389            |            |                            |
|                | DP_OP_65J14_523_9389 |      |                            |
| DP_OP_66J14_524_2805            |            |                            |
|                | DP_OP_66J14_524_2805 |      |                            |
| DP_OP_67J14_525_5914            |            |                            |
|                | DP_OP_67J14_525_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J14_523_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J14_523_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J14_524_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J14_524_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J14_525_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J14_525_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J15*680565/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_ADD/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J15_523_9389            |            |                            |
|                | DP_OP_65J15_523_9389 |      |                            |
| DP_OP_66J15_524_2805            |            |                            |
|                | DP_OP_66J15_524_2805 |      |                            |
| DP_OP_67J15_525_5914            |            |                            |
|                | DP_OP_67J15_525_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J15_523_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J15_523_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J15_524_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J15_524_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J15_525_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J15_525_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*680565/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_ADD/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_523_9389               |            |                            |
|                | DP_OP_65_523_9389 |         |                            |
| DP_OP_66_524_2805               |            |                            |
|                | DP_OP_66_524_2805 |         |                            |
| DP_OP_67_525_5914               |            |                            |
|                | DP_OP_67_525_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_523_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_523_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_524_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_524_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_525_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_525_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J16*680565/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_ADD/U1 in
        file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J16_523_9389            |            |                            |
|                | DP_OP_65J16_523_9389 |      |                            |
| DP_OP_66J16_524_2805            |            |                            |
|                | DP_OP_66J16_524_2805 |      |                            |
| DP_OP_67J16_525_5914            |            |                            |
|                | DP_OP_67J16_525_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J16_523_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J16_523_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J16_524_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J16_524_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J16_525_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J16_525_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J14*600688/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J14_483_9389            |            |                            |
|                | DP_OP_65J14_483_9389 |      |                            |
| DP_OP_66J14_484_2805            |            |                            |
|                | DP_OP_66J14_484_2805 |      |                            |
| DP_OP_67J14_485_5914            |            |                            |
|                | DP_OP_67J14_485_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J14_483_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J14_483_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J14_484_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J14_484_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J14_485_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J14_485_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J15*600688/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J15_483_9389            |            |                            |
|                | DP_OP_65J15_483_9389 |      |                            |
| DP_OP_66J15_484_2805            |            |                            |
|                | DP_OP_66J15_484_2805 |      |                            |
| DP_OP_67J15_485_5914            |            |                            |
|                | DP_OP_67J15_485_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J15_483_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J15_483_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J15_484_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J15_484_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J15_485_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J15_485_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J16*648595/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J16_507_9389            |            |                            |
|                | DP_OP_65J16_507_9389 |      |                            |
| DP_OP_66J16_508_2805            |            |                            |
|                | DP_OP_66J16_508_2805 |      |                            |
| DP_OP_67J16_509_5914            |            |                            |
|                | DP_OP_67J16_509_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J16_507_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J16_507_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J16_508_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J16_508_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J16_509_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J16_509_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*648595/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_507_9389               |            |                            |
|                | DP_OP_65_507_9389 |         |                            |
| DP_OP_66_508_2805               |            |                            |
|                | DP_OP_66_508_2805 |         |                            |
| DP_OP_67_509_5914               |            |                            |
|                | DP_OP_67_509_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_507_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_507_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_508_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_508_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_509_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_509_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*600689/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_483_9389               |            |                            |
|                | DP_OP_65_483_9389 |         |                            |
| DP_OP_66_484_2805               |            |                            |
|                | DP_OP_66_484_2805 |         |                            |
| DP_OP_67_485_5914               |            |                            |
|                | DP_OP_67_485_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_483_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_483_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_484_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_484_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_485_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_485_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J16*600689/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J16_483_9389            |            |                            |
|                | DP_OP_65J16_483_9389 |      |                            |
| DP_OP_66J16_484_2805            |            |                            |
|                | DP_OP_66J16_484_2805 |      |                            |
| DP_OP_67J16_485_5914            |            |                            |
|                | DP_OP_67J16_485_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J16_483_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J16_483_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J16_484_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J16_484_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J16_485_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J16_485_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J14*616656/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J14_491_9389            |            |                            |
|                | DP_OP_65J14_491_9389 |      |                            |
| DP_OP_66J14_492_2805            |            |                            |
|                | DP_OP_66J14_492_2805 |      |                            |
| DP_OP_67J14_493_5914            |            |                            |
|                | DP_OP_67J14_493_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J14_491_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J14_491_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J14_492_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J14_492_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J14_493_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J14_493_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J15*616656/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J15_491_9389            |            |                            |
|                | DP_OP_65J15_491_9389 |      |                            |
| DP_OP_66J15_492_2805            |            |                            |
|                | DP_OP_66J15_492_2805 |      |                            |
| DP_OP_67J15_493_5914            |            |                            |
|                | DP_OP_67J15_493_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J15_491_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J15_491_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J15_492_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J15_492_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J15_493_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J15_493_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J16*616658/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J16_491_9389            |            |                            |
|                | DP_OP_65J16_491_9389 |      |                            |
| DP_OP_66J16_492_2805            |            |                            |
|                | DP_OP_66J16_492_2805 |      |                            |
| DP_OP_67J16_493_5914            |            |                            |
|                | DP_OP_67J16_493_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J16_491_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J16_491_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J16_492_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J16_492_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J16_493_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J16_493_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*616658/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_491_9389               |            |                            |
|                | DP_OP_65_491_9389 |         |                            |
| DP_OP_66_492_2805               |            |                            |
|                | DP_OP_66_492_2805 |         |                            |
| DP_OP_67_493_5914               |            |                            |
|                | DP_OP_67_493_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_491_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_491_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_492_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_492_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_493_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_493_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J14*632625/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J14_499_9389            |            |                            |
|                | DP_OP_65J14_499_9389 |      |                            |
| DP_OP_66J14_500_2805            |            |                            |
|                | DP_OP_66J14_500_2805 |      |                            |
| DP_OP_67J14_501_5914            |            |                            |
|                | DP_OP_67J14_501_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J14_499_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J14_499_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J14_500_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J14_500_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J14_501_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J14_501_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J15*632625/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J15_499_9389            |            |                            |
|                | DP_OP_65J15_499_9389 |      |                            |
| DP_OP_66J15_500_2805            |            |                            |
|                | DP_OP_66J15_500_2805 |      |                            |
| DP_OP_67J15_501_5914            |            |                            |
|                | DP_OP_67J15_501_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J15_499_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J15_499_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J15_500_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J15_500_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J15_501_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J15_501_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J16*632627/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J16_499_9389            |            |                            |
|                | DP_OP_65J16_499_9389 |      |                            |
| DP_OP_66J16_500_2805            |            |                            |
|                | DP_OP_66J16_500_2805 |      |                            |
| DP_OP_67J16_501_5914            |            |                            |
|                | DP_OP_67J16_501_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J16_499_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J16_499_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J16_500_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J16_500_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J16_501_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J16_501_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*632627/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_499_9389               |            |                            |
|                | DP_OP_65_499_9389 |         |                            |
| DP_OP_66_500_2805               |            |                            |
|                | DP_OP_66_500_2805 |         |                            |
| DP_OP_67_501_5914               |            |                            |
|                | DP_OP_67_501_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_499_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_499_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_500_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_500_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_501_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_501_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J14*648594/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J14_507_9389            |            |                            |
|                | DP_OP_65J14_507_9389 |      |                            |
| DP_OP_66J14_508_2805            |            |                            |
|                | DP_OP_66J14_508_2805 |      |                            |
| DP_OP_67J14_509_5914            |            |                            |
|                | DP_OP_67J14_509_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J14_507_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J14_507_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J14_508_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J14_508_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J14_509_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J14_509_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J15*648594/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J15_507_9389            |            |                            |
|                | DP_OP_65J15_507_9389 |      |                            |
| DP_OP_66J15_508_2805            |            |                            |
|                | DP_OP_66J15_508_2805 |      |                            |
| DP_OP_67J15_509_5914            |            |                            |
|                | DP_OP_67J15_509_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J15_507_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J15_507_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J15_508_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J15_508_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J15_509_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J15_509_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J11*504636/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J11_291_9389            |            |                            |
|                | DP_OP_65J11_291_9389 |      |                            |
| DP_OP_66J11_292_2805            |            |                            |
|                | DP_OP_66J11_292_2805 |      |                            |
| DP_OP_67J11_293_5914            |            |                            |
|                | DP_OP_67J11_293_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J11_291_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J11_291_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J11_292_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J11_292_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J11_293_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J11_293_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J12*504636/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J12_291_9389            |            |                            |
|                | DP_OP_65J12_291_9389 |      |                            |
| DP_OP_66J12_292_2805            |            |                            |
|                | DP_OP_66J12_292_2805 |      |                            |
| DP_OP_67J12_293_5914            |            |                            |
|                | DP_OP_67J12_293_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J12_291_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J12_291_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J12_292_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J12_292_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J12_293_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J12_293_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*504636/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_291_9389               |            |                            |
|                | DP_OP_65_291_9389 |         |                            |
| DP_OP_66_292_2805               |            |                            |
|                | DP_OP_66_292_2805 |         |                            |
| DP_OP_67_293_5914               |            |                            |
|                | DP_OP_67_293_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_291_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_291_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_292_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_292_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_293_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_293_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J13*504636/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J13_291_9389            |            |                            |
|                | DP_OP_65J13_291_9389 |      |                            |
| DP_OP_66J13_292_2805            |            |                            |
|                | DP_OP_66J13_292_2805 |      |                            |
| DP_OP_67J13_293_5914            |            |                            |
|                | DP_OP_67J13_293_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J13_291_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J13_291_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J13_292_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J13_292_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J13_293_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J13_293_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J11*520611/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J11_299_9389            |            |                            |
|                | DP_OP_65J11_299_9389 |      |                            |
| DP_OP_66J11_300_2805            |            |                            |
|                | DP_OP_66J11_300_2805 |      |                            |
| DP_OP_67J11_301_5914            |            |                            |
|                | DP_OP_67J11_301_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J11_299_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J11_299_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J11_300_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J11_300_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J11_301_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J11_301_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*520611/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_299_9389               |            |                            |
|                | DP_OP_65_299_9389 |         |                            |
| DP_OP_66_300_2805               |            |                            |
|                | DP_OP_66_300_2805 |         |                            |
| DP_OP_67_301_5914               |            |                            |
|                | DP_OP_67_301_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_299_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_299_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_300_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_300_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_301_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_301_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J12*520611/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J12_299_9389            |            |                            |
|                | DP_OP_65J12_299_9389 |      |                            |
| DP_OP_66J12_300_2805            |            |                            |
|                | DP_OP_66J12_300_2805 |      |                            |
| DP_OP_67J12_301_5914            |            |                            |
|                | DP_OP_67J12_301_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J12_299_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J12_299_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J12_300_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J12_300_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J12_301_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J12_301_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J13*520611/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J13_299_9389            |            |                            |
|                | DP_OP_65J13_299_9389 |      |                            |
| DP_OP_66J13_300_2805            |            |                            |
|                | DP_OP_66J13_300_2805 |      |                            |
| DP_OP_67J13_301_5914            |            |                            |
|                | DP_OP_67J13_301_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J13_299_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J13_299_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J13_300_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J13_300_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J13_301_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J13_301_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J11*536553/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J11_307_9389            |            |                            |
|                | DP_OP_65J11_307_9389 |      |                            |
| DP_OP_66J11_308_2805            |            |                            |
|                | DP_OP_66J11_308_2805 |      |                            |
| DP_OP_67J11_309_5914            |            |                            |
|                | DP_OP_67J11_309_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J11_307_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J11_307_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J11_308_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J11_308_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J11_309_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J11_309_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*536553/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_307_9389               |            |                            |
|                | DP_OP_65_307_9389 |         |                            |
| DP_OP_66_308_2805               |            |                            |
|                | DP_OP_66_308_2805 |         |                            |
| DP_OP_67_309_5914               |            |                            |
|                | DP_OP_67_309_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_307_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_307_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_308_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_308_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_309_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_309_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J12*536553/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J12_307_9389            |            |                            |
|                | DP_OP_65J12_307_9389 |      |                            |
| DP_OP_66J12_308_2805            |            |                            |
|                | DP_OP_66J12_308_2805 |      |                            |
| DP_OP_67J12_309_5914            |            |                            |
|                | DP_OP_67J12_309_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J12_307_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J12_307_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J12_308_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J12_308_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J12_309_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J12_309_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J13*536553/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J13_307_9389            |            |                            |
|                | DP_OP_65J13_307_9389 |      |                            |
| DP_OP_66J13_308_2805            |            |                            |
|                | DP_OP_66J13_308_2805 |      |                            |
| DP_OP_67J13_309_5914            |            |                            |
|                | DP_OP_67J13_309_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J13_307_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J13_307_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J13_308_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J13_308_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J13_309_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J13_309_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J11*552495/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J11_315_9389            |            |                            |
|                | DP_OP_65J11_315_9389 |      |                            |
| DP_OP_66J11_316_2805            |            |                            |
|                | DP_OP_66J11_316_2805 |      |                            |
| DP_OP_67J11_317_5914            |            |                            |
|                | DP_OP_67J11_317_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J11_315_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J11_315_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J11_316_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J11_316_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J11_317_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J11_317_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*552495/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_315_9389               |            |                            |
|                | DP_OP_65_315_9389 |         |                            |
| DP_OP_66_316_2805               |            |                            |
|                | DP_OP_66_316_2805 |         |                            |
| DP_OP_67_317_5914               |            |                            |
|                | DP_OP_67_317_5914 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_315_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_315_9389    | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66_316_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_316_2805    | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67_317_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_317_5914    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J13*552495/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J13_315_9389            |            |                            |
|                | DP_OP_65J13_315_9389 |      |                            |
| DP_OP_66J13_316_2805            |            |                            |
|                | DP_OP_66J13_316_2805 |      |                            |
| DP_OP_67J13_317_5914            |            |                            |
|                | DP_OP_67J13_317_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J13_315_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J13_315_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J13_316_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J13_316_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J13_317_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J13_317_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J12*552495/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=63   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=55 | srl_283_lsb_trim           |
|                |                | SH_width=11 |                           |
| ash_6          | DW_leftsh      | A_width=55 | sll_285                    |
|                |                | SH_width=11 |                           |
| ash_8          | DW_leftsh      | A_width=56 | sll_337                    |
|                |                | SH_width=7 |                            |
| add_x_9        | DW01_add       | width=6    | add_339                    |
| add_x_16       | DW01_inc       | width=52   | add_398                    |
| U2             | DW_lzd         | a_width=57 | U2                         |
| U1             | DW_norm        | a_width=56 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=7 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65J12_315_9389            |            |                            |
|                | DP_OP_65J12_315_9389 |      |                            |
| DP_OP_66J12_316_2805            |            |                            |
|                | DP_OP_66J12_316_2805 |      |                            |
| DP_OP_67J12_317_5914            |            |                            |
|                | DP_OP_67J12_317_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J12_315_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J12_315_9389 | sub_277 sub_add_279 add_279_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| T64   | IFO  | Signed   | 11    | O1[10:0]                                 |
| O1    | PO   | Signed   | 12    | I1 - I2                                  |
| O2    | PO   | Signed   | 11    | -T64 + $unsigned(11'b00000000000)        |
==============================================================================

Datapath Report for DP_OP_66J12_316_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J12_316_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J12_317_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J12_317_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPC_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPC_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPC_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPC_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPC_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPC_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPC_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPC_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'u_stage_1/add_149 (RADIX2.v:149) u_stage_1/add_151 (RADIX2.v:151)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_1/C1122 (RADIX2.v:148)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_1/add_164 (RADIX2.v:164)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'u_stage_1/add_163 (RADIX2.v:163)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_2/add_149 (RADIX2.v:149) u_stage_2/add_151 (RADIX2.v:151)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_2/C1123 (RADIX2.v:148)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_2/add_164 (RADIX2.v:164)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'u_stage_2/add_163 (RADIX2.v:163)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_3/add_149 (RADIX2.v:149) u_stage_3/add_151 (RADIX2.v:151)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_3/C1124 (RADIX2.v:148)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_3/add_164 (RADIX2.v:164)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'u_stage_3/add_163 (RADIX2.v:163)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_4/add_149 (RADIX2.v:149) u_stage_4/add_151 (RADIX2.v:151)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_4/C1125 (RADIX2.v:148)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_4/add_164 (RADIX2.v:164)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'u_stage_4/add_163 (RADIX2.v:163)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_5/add_149 (RADIX2.v:149) u_stage_5/add_151 (RADIX2.v:151)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_5/C1126 (RADIX2.v:148)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_5/add_164 (RADIX2.v:164)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'u_stage_5/add_163 (RADIX2.v:163)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_6/add_149 (RADIX2.v:149) u_stage_6/add_151 (RADIX2.v:151)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_6/C1127 (RADIX2.v:148)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_6/add_164 (RADIX2.v:164)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'u_stage_6/add_163 (RADIX2.v:163)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_7/add_149 (RADIX2.v:149) u_stage_7/add_151 (RADIX2.v:151)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_7/C1128 (RADIX2.v:148)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_7/add_164 (RADIX2.v:164)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'u_stage_7/add_163 (RADIX2.v:163)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_8/add_149 (RADIX2.v:149) u_stage_8/add_151 (RADIX2.v:151)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_8/C1159 (RADIX2.v:148)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_8/add_164 (RADIX2.v:164)' in design 'FFT' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'u_stage_8/add_163 (RADIX2.v:163)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gte_x_4            | DW_cmp           | apparch (area)     |                |
| add_x_8            | DW01_inc         | apparch (area)     |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| eq_x_12            | DW_cmp           | apparch (area)     |                |
| eq_x_13            | DW_cmp           | apparch (area)     |                |
| gte_x_29           | DW_cmp           | apparch (area)     |                |
| add_x_33           | DW01_inc         | apparch (area)     |                |
| add_x_34           | DW01_add         | apparch (area)     |                |
| eq_x_37            | DW_cmp           | apparch (area)     |                |
| eq_x_38            | DW_cmp           | apparch (area)     |                |
| gte_x_54           | DW_cmp           | apparch (area)     |                |
| add_x_58           | DW01_inc         | apparch (area)     |                |
| eq_x_62            | DW_cmp           | apparch (area)     |                |
| eq_x_63            | DW_cmp           | apparch (area)     |                |
| gte_x_79           | DW_cmp           | apparch (area)     |                |
| add_x_83           | DW01_inc         | apparch (area)     |                |
| eq_x_87            | DW_cmp           | apparch (area)     |                |
| eq_x_88            | DW_cmp           | apparch (area)     |                |
| gte_x_104          | DW_cmp           | apparch (area)     |                |
| add_x_108          | DW01_inc         | apparch (area)     |                |
| eq_x_112           | DW_cmp           | apparch (area)     |                |
| eq_x_113           | DW_cmp           | apparch (area)     |                |
| gte_x_129          | DW_cmp           | apparch (area)     |                |
| add_x_133          | DW01_inc         | pparch (area,speed)                 |
| eq_x_137           | DW_cmp           | apparch (area)     |                |
| eq_x_138           | DW_cmp           | apparch (area)     |                |
| gte_x_154          | DW_cmp           | apparch (area)     |                |
| add_x_158          | DW01_inc         | pparch (area,speed)                 |
| eq_x_162           | DW_cmp           | apparch (area)     |                |
| eq_x_163           | DW_cmp           | apparch (area)     |                |
| gte_x_179          | DW_cmp           | apparch (area)     |                |
| add_x_183          | DW01_inc         | pparch (area,speed)                 |
| u_stage_1/u_FPC_MUL/u_FPC_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_1/u_FPC_MUL/u_FPC_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_1/u_FPC_MUL/u_FPC_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_1/u_FPC_MUL/u_FPC_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_1/u_FPC_MUL/u_FPC_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_1/u_FPC_MUL/u_FPC_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPC_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPC_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPC_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPC_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPC_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPC_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPC_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPC_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPC_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPC_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPC_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPC_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPC_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPC_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPC_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPC_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPC_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPC_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPC_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPC_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPC_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPC_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPC_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPC_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPC_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPC_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPC_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPC_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPC_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPC_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPC_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPC_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPC_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPC_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPC_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPC_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPC_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPC_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPC_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPC_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPC_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPC_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPC_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPC_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| lt_x_198           | DW_cmp           | apparch (area)     |                |
| lt_x_199           | DW_cmp           | apparch (area)     |                |
| lt_x_200           | DW_cmp           | apparch (area)     |                |
| lt_x_201           | DW_cmp           | apparch (area)     |                |
| lt_x_202           | DW_cmp           | apparch (area)     |                |
| lt_x_203           | DW_cmp           | apparch (area)     |                |
| lt_x_204           | DW_cmp           | apparch (area)     |                |
| lt_x_205           | DW_cmp           | apparch (area)     |                |
| add_x_11           | DW01_add         | apparch (area)     |                |
| add_x_36           | DW01_add         | apparch (area)     |                |
| add_x_61           | DW01_add         | apparch (area)     |                |
| add_x_86           | DW01_add         | apparch (area)     |                |
| add_x_111          | DW01_add         | apparch (area)     |                |
| add_x_136          | DW01_add         | apparch (area)     |                |
| add_x_161          | DW01_add         | apparch (area)     |                |
| add_x_5            | DW01_inc         | pparch (area,speed)                 |
| add_x_30           | DW01_inc         | apparch (area)     |                |
| add_x_55           | DW01_inc         | apparch (area)     |                |
| add_x_80           | DW01_inc         | apparch (area)     |                |
| add_x_105          | DW01_inc         | apparch (area)     |                |
| add_x_130          | DW01_inc         | apparch (area)     |                |
| add_x_155          | DW01_inc         | pparch (area,speed)                 |
| add_x_180          | DW01_inc         | pparch (area,speed)                 |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| U1                 | DW_fp_addsub     | str                |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | cla                |                |
| U4                 | DW_lzd           | cla                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| DP_OP_65J11_323_9389                  |                    |                |
|                    | DP_OP_65J11_323_9389 | str (area,speed)                |
| DP_OP_66J11_324_2805                  |                    |                |
|                    | DP_OP_66J11_324_2805 | str (area,speed)                |
| DP_OP_67J11_325_5914                  |                    |                |
|                    | DP_OP_67J11_325_5914 | str (area,speed)                |
| DP_OP_65_323_9389  | DP_OP_65_323_9389 | str (area,speed)  |                |
| DP_OP_66_324_2805  | DP_OP_66_324_2805 | str (area,speed)  |                |
| DP_OP_67_325_5914  | DP_OP_67_325_5914 | str (area,speed)  |                |
| DP_OP_65J13_323_9389                  |                    |                |
|                    | DP_OP_65J13_323_9389 | str (area,speed)                |
| DP_OP_66J13_324_2805                  |                    |                |
|                    | DP_OP_66J13_324_2805 | str (area,speed)                |
| DP_OP_67J13_325_5914                  |                    |                |
|                    | DP_OP_67J13_325_5914 | str (area,speed)                |
| DP_OP_65J11_331_9389                  |                    |                |
|                    | DP_OP_65J11_331_9389 | str (area,speed)                |
| DP_OP_66J11_332_2805                  |                    |                |
|                    | DP_OP_66J11_332_2805 | str (area,speed)                |
| DP_OP_67J11_333_5914                  |                    |                |
|                    | DP_OP_67J11_333_5914 | str (area,speed)                |
| DP_OP_65_331_9389  | DP_OP_65_331_9389 | str (area,speed)  |                |
| DP_OP_66_332_2805  | DP_OP_66_332_2805 | str (area,speed)  |                |
| DP_OP_67_333_5914  | DP_OP_67_333_5914 | str (area,speed)  |                |
| DP_OP_65J13_331_9389                  |                    |                |
|                    | DP_OP_65J13_331_9389 | str (area,speed)                |
| DP_OP_66J13_332_2805                  |                    |                |
|                    | DP_OP_66J13_332_2805 | str (area,speed)                |
| DP_OP_67J13_333_5914                  |                    |                |
|                    | DP_OP_67J13_333_5914 | str (area,speed)                |
| DP_OP_65J12_323_9389                  |                    |                |
|                    | DP_OP_65J12_323_9389 | str (area,speed)                |
| DP_OP_66J12_324_2805                  |                    |                |
|                    | DP_OP_66J12_324_2805 | str (area,speed)                |
| DP_OP_67J12_325_5914                  |                    |                |
|                    | DP_OP_67J12_325_5914 | str (area,speed)                |
| DP_OP_65J11_339_9389                  |                    |                |
|                    | DP_OP_65J11_339_9389 | str (area,speed)                |
| DP_OP_66J11_340_2805                  |                    |                |
|                    | DP_OP_66J11_340_2805 | str (area,speed)                |
| DP_OP_67J11_341_5914                  |                    |                |
|                    | DP_OP_67J11_341_5914 | str (area,speed)                |
| DP_OP_65J14_515_9389                  |                    |                |
|                    | DP_OP_65J14_515_9389 | str (area,speed)                |
| DP_OP_66J14_516_2805                  |                    |                |
|                    | DP_OP_66J14_516_2805 | str (area,speed)                |
| DP_OP_67J14_517_5914                  |                    |                |
|                    | DP_OP_67J14_517_5914 | str (area,speed)                |
| DP_OP_65J15_515_9389                  |                    |                |
|                    | DP_OP_65J15_515_9389 | str (area,speed)                |
| DP_OP_66J15_516_2805                  |                    |                |
|                    | DP_OP_66J15_516_2805 | str (area,speed)                |
| DP_OP_67J15_517_5914                  |                    |                |
|                    | DP_OP_67J15_517_5914 | str (area,speed)                |
| DP_OP_65J16_515_9389                  |                    |                |
|                    | DP_OP_65J16_515_9389 | str (area,speed)                |
| DP_OP_66J16_516_2805                  |                    |                |
|                    | DP_OP_66J16_516_2805 | str (area,speed)                |
| DP_OP_67J16_517_5914                  |                    |                |
|                    | DP_OP_67J16_517_5914 | str (area,speed)                |
| DP_OP_65_515_9389  | DP_OP_65_515_9389 | str (area,speed)  |                |
| DP_OP_66_516_2805  | DP_OP_66_516_2805 | str (area,speed)  |                |
| DP_OP_67_517_5914  | DP_OP_67_517_5914 | str (area,speed)  |                |
| DP_OP_65J14_523_9389                  |                    |                |
|                    | DP_OP_65J14_523_9389 | str (area,speed)                |
| DP_OP_66J14_524_2805                  |                    |                |
|                    | DP_OP_66J14_524_2805 | str (area,speed)                |
| DP_OP_67J14_525_5914                  |                    |                |
|                    | DP_OP_67J14_525_5914 | str (area,speed)                |
| DP_OP_65J15_523_9389                  |                    |                |
|                    | DP_OP_65J15_523_9389 | str (area,speed)                |
| DP_OP_66J15_524_2805                  |                    |                |
|                    | DP_OP_66J15_524_2805 | str (area,speed)                |
| DP_OP_67J15_525_5914                  |                    |                |
|                    | DP_OP_67J15_525_5914 | str (area,speed)                |
| DP_OP_65_523_9389  | DP_OP_65_523_9389 | str (area,speed)  |                |
| DP_OP_66_524_2805  | DP_OP_66_524_2805 | str (area,speed)  |                |
| DP_OP_67_525_5914  | DP_OP_67_525_5914 | str (area,speed)  |                |
| DP_OP_65J16_523_9389                  |                    |                |
|                    | DP_OP_65J16_523_9389 | str (area,speed)                |
| DP_OP_66J16_524_2805                  |                    |                |
|                    | DP_OP_66J16_524_2805 | str (area,speed)                |
| DP_OP_67J16_525_5914                  |                    |                |
|                    | DP_OP_67J16_525_5914 | str (area,speed)                |
| DP_OP_65J14_483_9389                  |                    |                |
|                    | DP_OP_65J14_483_9389 | str (area,speed)                |
| DP_OP_66J14_484_2805                  |                    |                |
|                    | DP_OP_66J14_484_2805 | str (area,speed)                |
| DP_OP_67J14_485_5914                  |                    |                |
|                    | DP_OP_67J14_485_5914 | str (area,speed)                |
| DP_OP_65J15_483_9389                  |                    |                |
|                    | DP_OP_65J15_483_9389 | str (area,speed)                |
| DP_OP_66J15_484_2805                  |                    |                |
|                    | DP_OP_66J15_484_2805 | str (area,speed)                |
| DP_OP_67J15_485_5914                  |                    |                |
|                    | DP_OP_67J15_485_5914 | str (area,speed)                |
| DP_OP_65J16_507_9389                  |                    |                |
|                    | DP_OP_65J16_507_9389 | str (area,speed)                |
| DP_OP_66J16_508_2805                  |                    |                |
|                    | DP_OP_66J16_508_2805 | str (area,speed)                |
| DP_OP_67J16_509_5914                  |                    |                |
|                    | DP_OP_67J16_509_5914 | str (area,speed)                |
| DP_OP_65_507_9389  | DP_OP_65_507_9389 | str (area,speed)  |                |
| DP_OP_66_508_2805  | DP_OP_66_508_2805 | str (area,speed)  |                |
| DP_OP_67_509_5914  | DP_OP_67_509_5914 | str (area,speed)  |                |
| DP_OP_65_483_9389  | DP_OP_65_483_9389 | str (area,speed)  |                |
| DP_OP_66_484_2805  | DP_OP_66_484_2805 | str (area,speed)  |                |
| DP_OP_67_485_5914  | DP_OP_67_485_5914 | str (area,speed)  |                |
| DP_OP_65J16_483_9389                  |                    |                |
|                    | DP_OP_65J16_483_9389 | str (area,speed)                |
| DP_OP_66J16_484_2805                  |                    |                |
|                    | DP_OP_66J16_484_2805 | str (area,speed)                |
| DP_OP_67J16_485_5914                  |                    |                |
|                    | DP_OP_67J16_485_5914 | str (area,speed)                |
| DP_OP_65J14_491_9389                  |                    |                |
|                    | DP_OP_65J14_491_9389 | str (area,speed)                |
| DP_OP_66J14_492_2805                  |                    |                |
|                    | DP_OP_66J14_492_2805 | str (area,speed)                |
| DP_OP_67J14_493_5914                  |                    |                |
|                    | DP_OP_67J14_493_5914 | str (area,speed)                |
| DP_OP_65J15_491_9389                  |                    |                |
|                    | DP_OP_65J15_491_9389 | str (area,speed)                |
| DP_OP_66J15_492_2805                  |                    |                |
|                    | DP_OP_66J15_492_2805 | str (area,speed)                |
| DP_OP_67J15_493_5914                  |                    |                |
|                    | DP_OP_67J15_493_5914 | str (area,speed)                |
| DP_OP_65J16_491_9389                  |                    |                |
|                    | DP_OP_65J16_491_9389 | str (area,speed)                |
| DP_OP_66J16_492_2805                  |                    |                |
|                    | DP_OP_66J16_492_2805 | str (area,speed)                |
| DP_OP_67J16_493_5914                  |                    |                |
|                    | DP_OP_67J16_493_5914 | str (area,speed)                |
| DP_OP_65_491_9389  | DP_OP_65_491_9389 | str (area,speed)  |                |
| DP_OP_66_492_2805  | DP_OP_66_492_2805 | str (area,speed)  |                |
| DP_OP_67_493_5914  | DP_OP_67_493_5914 | str (area,speed)  |                |
| DP_OP_65J14_499_9389                  |                    |                |
|                    | DP_OP_65J14_499_9389 | str (area,speed)                |
| DP_OP_66J14_500_2805                  |                    |                |
|                    | DP_OP_66J14_500_2805 | str (area,speed)                |
| DP_OP_67J14_501_5914                  |                    |                |
|                    | DP_OP_67J14_501_5914 | str (area,speed)                |
| DP_OP_65J15_499_9389                  |                    |                |
|                    | DP_OP_65J15_499_9389 | str (area,speed)                |
| DP_OP_66J15_500_2805                  |                    |                |
|                    | DP_OP_66J15_500_2805 | str (area,speed)                |
| DP_OP_67J15_501_5914                  |                    |                |
|                    | DP_OP_67J15_501_5914 | str (area,speed)                |
| DP_OP_65J16_499_9389                  |                    |                |
|                    | DP_OP_65J16_499_9389 | str (area,speed)                |
| DP_OP_66J16_500_2805                  |                    |                |
|                    | DP_OP_66J16_500_2805 | str (area,speed)                |
| DP_OP_67J16_501_5914                  |                    |                |
|                    | DP_OP_67J16_501_5914 | str (area,speed)                |
| DP_OP_65_499_9389  | DP_OP_65_499_9389 | str (area,speed)  |                |
| DP_OP_66_500_2805  | DP_OP_66_500_2805 | str (area,speed)  |                |
| DP_OP_67_501_5914  | DP_OP_67_501_5914 | str (area,speed)  |                |
| DP_OP_65J14_507_9389                  |                    |                |
|                    | DP_OP_65J14_507_9389 | str (area,speed)                |
| DP_OP_66J14_508_2805                  |                    |                |
|                    | DP_OP_66J14_508_2805 | str (area,speed)                |
| DP_OP_67J14_509_5914                  |                    |                |
|                    | DP_OP_67J14_509_5914 | str (area,speed)                |
| DP_OP_65J15_507_9389                  |                    |                |
|                    | DP_OP_65J15_507_9389 | str (area,speed)                |
| DP_OP_66J15_508_2805                  |                    |                |
|                    | DP_OP_66J15_508_2805 | str (area,speed)                |
| DP_OP_67J15_509_5914                  |                    |                |
|                    | DP_OP_67J15_509_5914 | str (area,speed)                |
| DP_OP_65J11_291_9389                  |                    |                |
|                    | DP_OP_65J11_291_9389 | str (area,speed)                |
| DP_OP_66J11_292_2805                  |                    |                |
|                    | DP_OP_66J11_292_2805 | str (area,speed)                |
| DP_OP_67J11_293_5914                  |                    |                |
|                    | DP_OP_67J11_293_5914 | str (area,speed)                |
| DP_OP_65J12_291_9389                  |                    |                |
|                    | DP_OP_65J12_291_9389 | str (area,speed)                |
| DP_OP_66J12_292_2805                  |                    |                |
|                    | DP_OP_66J12_292_2805 | str (area,speed)                |
| DP_OP_67J12_293_5914                  |                    |                |
|                    | DP_OP_67J12_293_5914 | str (area,speed)                |
| DP_OP_65_291_9389  | DP_OP_65_291_9389 | str (area,speed)  |                |
| DP_OP_66_292_2805  | DP_OP_66_292_2805 | str (area,speed)  |                |
| DP_OP_67_293_5914  | DP_OP_67_293_5914 | str (area,speed)  |                |
| DP_OP_65J13_291_9389                  |                    |                |
|                    | DP_OP_65J13_291_9389 | str (area,speed)                |
| DP_OP_66J13_292_2805                  |                    |                |
|                    | DP_OP_66J13_292_2805 | str (area,speed)                |
| DP_OP_67J13_293_5914                  |                    |                |
|                    | DP_OP_67J13_293_5914 | str (area,speed)                |
| DP_OP_65J11_299_9389                  |                    |                |
|                    | DP_OP_65J11_299_9389 | str (area,speed)                |
| DP_OP_66J11_300_2805                  |                    |                |
|                    | DP_OP_66J11_300_2805 | str (area,speed)                |
| DP_OP_67J11_301_5914                  |                    |                |
|                    | DP_OP_67J11_301_5914 | str (area,speed)                |
| DP_OP_65_299_9389  | DP_OP_65_299_9389 | str (area,speed)  |                |
| DP_OP_66_300_2805  | DP_OP_66_300_2805 | str (area,speed)  |                |
| DP_OP_67_301_5914  | DP_OP_67_301_5914 | str (area,speed)  |                |
| DP_OP_65J12_299_9389                  |                    |                |
|                    | DP_OP_65J12_299_9389 | str (area,speed)                |
| DP_OP_66J12_300_2805                  |                    |                |
|                    | DP_OP_66J12_300_2805 | str (area,speed)                |
| DP_OP_67J12_301_5914                  |                    |                |
|                    | DP_OP_67J12_301_5914 | str (area,speed)                |
| DP_OP_65J13_299_9389                  |                    |                |
|                    | DP_OP_65J13_299_9389 | str (area,speed)                |
| DP_OP_66J13_300_2805                  |                    |                |
|                    | DP_OP_66J13_300_2805 | str (area,speed)                |
| DP_OP_67J13_301_5914                  |                    |                |
|                    | DP_OP_67J13_301_5914 | str (area,speed)                |
| DP_OP_65J11_307_9389                  |                    |                |
|                    | DP_OP_65J11_307_9389 | str (area,speed)                |
| DP_OP_66J11_308_2805                  |                    |                |
|                    | DP_OP_66J11_308_2805 | str (area,speed)                |
| DP_OP_67J11_309_5914                  |                    |                |
|                    | DP_OP_67J11_309_5914 | str (area,speed)                |
| DP_OP_65_307_9389  | DP_OP_65_307_9389 | str (area,speed)  |                |
| DP_OP_66_308_2805  | DP_OP_66_308_2805 | str (area,speed)  |                |
| DP_OP_67_309_5914  | DP_OP_67_309_5914 | str (area,speed)  |                |
| DP_OP_65J12_307_9389                  |                    |                |
|                    | DP_OP_65J12_307_9389 | str (area,speed)                |
| DP_OP_66J12_308_2805                  |                    |                |
|                    | DP_OP_66J12_308_2805 | str (area,speed)                |
| DP_OP_67J12_309_5914                  |                    |                |
|                    | DP_OP_67J12_309_5914 | str (area,speed)                |
| DP_OP_65J13_307_9389                  |                    |                |
|                    | DP_OP_65J13_307_9389 | str (area,speed)                |
| DP_OP_66J13_308_2805                  |                    |                |
|                    | DP_OP_66J13_308_2805 | str (area,speed)                |
| DP_OP_67J13_309_5914                  |                    |                |
|                    | DP_OP_67J13_309_5914 | str (area,speed)                |
| DP_OP_65J11_315_9389                  |                    |                |
|                    | DP_OP_65J11_315_9389 | str (area,speed)                |
| DP_OP_66J11_316_2805                  |                    |                |
|                    | DP_OP_66J11_316_2805 | str (area,speed)                |
| DP_OP_67J11_317_5914                  |                    |                |
|                    | DP_OP_67J11_317_5914 | str (area,speed)                |
| DP_OP_65_315_9389  | DP_OP_65_315_9389 | str (area,speed)  |                |
| DP_OP_66_316_2805  | DP_OP_66_316_2805 | str (area,speed)  |                |
| DP_OP_67_317_5914  | DP_OP_67_317_5914 | str (area,speed)  |                |
| DP_OP_65J13_315_9389                  |                    |                |
|                    | DP_OP_65J13_315_9389 | str (area,speed)                |
| DP_OP_66J13_316_2805                  |                    |                |
|                    | DP_OP_66J13_316_2805 | str (area,speed)                |
| DP_OP_67J13_317_5914                  |                    |                |
|                    | DP_OP_67J13_317_5914 | str (area,speed)                |
| DP_OP_65J12_315_9389                  |                    |                |
|                    | DP_OP_65J12_315_9389 | str (area,speed)                |
| DP_OP_66J12_316_2805                  |                    |                |
|                    | DP_OP_66J12_316_2805 | str (area,speed)                |
| DP_OP_67J12_317_5914                  |                    |                |
|                    | DP_OP_67J12_317_5914 | str (area,speed)                |
===============================================================================

1
