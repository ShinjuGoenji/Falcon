 
****************************************
Report : resources
Design : IFFT
Version: T-2022.03
Date   : Thu Sep  4 18:38:29 2025
****************************************


Resource Report for this hierarchy in file ../01_RTL/RADIX2.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_4        | DW_cmp         | width=9    | u_stage_1/gte_163 (RADIX2.v:163) |
| lt_x_7         | DW_cmp         | width=9    | u_stage_1/lt_176 (RADIX2.v:176) |
| sub_x_8        | DW01_dec       | width=8    | u_stage_1/sub_182 (RADIX2.v:182) |
| gte_x_22       | DW_cmp         | width=9    | u_stage_2/gte_163 (RADIX2.v:163) |
| lt_x_25        | DW_cmp         | width=9    | u_stage_2/lt_176 (RADIX2.v:176) |
| sub_x_26       | DW01_dec       | width=7    | u_stage_2/sub_182 (RADIX2.v:182) |
| gte_x_41       | DW_cmp         | width=9    | u_stage_3/gte_163 (RADIX2.v:163) |
| lt_x_44        | DW_cmp         | width=9    | u_stage_3/lt_176 (RADIX2.v:176) |
| sub_x_45       | DW01_dec       | width=6    | u_stage_3/sub_182 (RADIX2.v:182) |
| lt_x_53        | DW_cmp         | width=9    | u_stage_3/lt_207 (RADIX2.v:207) |
| gte_x_61       | DW_cmp         | width=9    | u_stage_4/gte_163 (RADIX2.v:163) |
| lt_x_64        | DW_cmp         | width=9    | u_stage_4/lt_176 (RADIX2.v:176) |
| sub_x_65       | DW01_dec       | width=5    | u_stage_4/sub_182 (RADIX2.v:182) |
| lt_x_73        | DW_cmp         | width=9    | u_stage_4/lt_207 (RADIX2.v:207) |
| gte_x_81       | DW_cmp         | width=9    | u_stage_5/gte_163 (RADIX2.v:163) |
| lt_x_84        | DW_cmp         | width=9    | u_stage_5/lt_176 (RADIX2.v:176) |
| sub_x_85       | DW01_dec       | width=4    | u_stage_5/sub_182 (RADIX2.v:182) |
| lt_x_93        | DW_cmp         | width=9    | u_stage_5/lt_207 (RADIX2.v:207) |
| gte_x_101      | DW_cmp         | width=9    | u_stage_6/gte_163 (RADIX2.v:163) |
| lt_x_104       | DW_cmp         | width=9    | u_stage_6/lt_176 (RADIX2.v:176) |
| sub_x_105      | DW01_dec       | width=3    | u_stage_6/sub_182 (RADIX2.v:182) |
| lt_x_113       | DW_cmp         | width=9    | u_stage_6/lt_207 (RADIX2.v:207) |
| gte_x_121      | DW_cmp         | width=9    | u_stage_7/gte_163 (RADIX2.v:163) |
| lt_x_124       | DW_cmp         | width=9    | u_stage_7/lt_176 (RADIX2.v:176) |
| sub_x_125      | DW01_dec       | width=2    | u_stage_7/sub_182 (RADIX2.v:182) |
| add_x_126      | DW01_add       | width=4    | u_stage_7/add_183 (RADIX2.v:183) |
| lt_x_133       | DW_cmp         | width=9    | u_stage_7/lt_207 (RADIX2.v:207) |
| gte_x_141      | DW_cmp         | width=9    | u_stage_8/gte_163 (RADIX2.v:163) |
| lt_x_144       | DW_cmp         | width=9    | u_stage_8/lt_176 (RADIX2.v:176) |
| add_x_145      | DW01_add       | width=3    | u_stage_8/add_183 (RADIX2.v:183) |
| lt_x_152       | DW_cmp         | width=9    | u_stage_8/lt_207 (RADIX2.v:207) |
| u_stage_1/u_FPC_MUL/u_FPR_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPR_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_FPC_MUL/u_FPR_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPR_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_FPC_MUL/u_FPR_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPR_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_FPC_MUL/u_FPR_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPR_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_FPC_MUL/u_FPR_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPR_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_FPC_MUL/u_FPR_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_1/u_FPC_MUL/u_FPR_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPR_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPR_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPR_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPR_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPR_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPR_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPR_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPR_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPR_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPR_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_FPC_MUL/u_FPR_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_8/u_FPC_MUL/u_FPR_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPR_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPR_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPR_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPR_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPR_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPR_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPR_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPR_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPR_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPR_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_FPC_MUL/u_FPR_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_7/u_FPC_MUL/u_FPR_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPR_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPR_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPR_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPR_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPR_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPR_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPR_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPR_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPR_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPR_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_FPC_MUL/u_FPR_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_6/u_FPC_MUL/u_FPR_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPR_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPR_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPR_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPR_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPR_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPR_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPR_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPR_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPR_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPR_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_FPC_MUL/u_FPR_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_5/u_FPC_MUL/u_FPR_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPR_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPR_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPR_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPR_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPR_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPR_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPR_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPR_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPR_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPR_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_FPC_MUL/u_FPR_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_4/u_FPC_MUL/u_FPR_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPR_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPR_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPR_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPR_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPR_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPR_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPR_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPR_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPR_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPR_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_FPC_MUL/u_FPR_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_3/u_FPC_MUL/u_FPR_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPR_ADD   |            |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPR_ADD (FPC.v:163) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPR_SUB   |            |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPR_SUB (FPC.v:160) |
|                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPR_MUL_3 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPR_MUL_3 (FPC.v:157) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPR_MUL_2 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPR_MUL_2 (FPC.v:154) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPR_MUL_1 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPR_MUL_1 (FPC.v:151) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_FPC_MUL/u_FPR_MUL_0 |            |                            |
|                | DW_fp_mult     | sig_width=52 | u_stage_2/u_FPC_MUL/u_FPR_MUL_0 (FPC.v:148) |
               | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1 (FPC.v:44) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0  |                            |
|                | DW_fp_add      | sig_width=52 | u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0 (FPC.v:41) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1 (FPC.v:91) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0  |                            |
|                | DW_fp_sub      | sig_width=52 | u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0 (FPC.v:88) |
    | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
| add_x_5        | DW01_inc       | width=9    | u_stage_1/add_164 (RADIX2.v:164) |
           |                |            | u_stage_1/add_166 (RADIX2.v:166) |
| add_x_23       | DW01_inc       | width=9    | u_stage_2/add_164 (RADIX2.v:164) |
           |                |            | u_stage_2/add_166 (RADIX2.v:166) |
| add_x_42       | DW01_inc       | width=9    | u_stage_3/add_164 (RADIX2.v:164) |
           |                |            | u_stage_3/add_166 (RADIX2.v:166) |
| add_x_62       | DW01_inc       | width=9    | u_stage_4/add_164 (RADIX2.v:164) |
           |                |            | u_stage_4/add_166 (RADIX2.v:166) |
| add_x_82       | DW01_inc       | width=9    | u_stage_5/add_164 (RADIX2.v:164) |
           |                |            | u_stage_5/add_166 (RADIX2.v:166) |
| add_x_102      | DW01_inc       | width=9    | u_stage_6/add_164 (RADIX2.v:164) |
           |                |            | u_stage_6/add_166 (RADIX2.v:166) |
| add_x_122      | DW01_inc       | width=9    | u_stage_7/add_164 (RADIX2.v:164) |
           |                |            | u_stage_7/add_166 (RADIX2.v:166) |
| add_x_142      | DW01_inc       | width=9    | u_stage_8/add_164 (RADIX2.v:164) |
           |                |            | u_stage_8/add_166 (RADIX2.v:166) |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_SUB
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_ADD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=52 | U1                       |
|                |                | exp_width=11 |                          |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_0 in
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


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_1 in
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


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_2 in
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


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_3 in
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


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_0 in
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


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_1 in
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


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_2 in
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


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_3 in
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


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_0 in
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


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_1 in
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


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_2 in
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


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_3 in
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


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_0 in
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


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_1 in
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


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_2 in
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


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_3 in
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


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_0 in
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


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_1 in
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


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_2 in
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


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_3 in
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


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_0 in
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


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_1 in
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


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_2 in
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


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_3 in
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


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_0 in
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


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_1 in
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


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_2 in
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


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_3 in
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


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_0 in
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


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_1 in
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


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_2 in
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


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_3 in
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


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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
| DP_OP_49J2_144_2805             |            |                            |
|                | DP_OP_49J2_144_2805 |       |                            |
| DP_OP_50J2_145_5914             |            |                            |
|                | DP_OP_50J2_145_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_144_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_144_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_145_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_145_5914  | add_306 sub_307                                     |
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
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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
| DP_OP_49J2_146_2805             |            |                            |
|                | DP_OP_49J2_146_2805 |       |                            |
| DP_OP_50J2_147_5914             |            |                            |
|                | DP_OP_50J2_147_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_146_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_146_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_147_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_147_5914  | add_306 sub_307                                     |
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
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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
| DP_OP_49J2_148_2805             |            |                            |
|                | DP_OP_49J2_148_2805 |       |                            |
| DP_OP_50J2_149_5914             |            |                            |
|                | DP_OP_50J2_149_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_148_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_148_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_149_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_149_5914  | add_306 sub_307                                     |
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
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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
| DP_OP_49J2_150_2805             |            |                            |
|                | DP_OP_49J2_150_2805 |       |                            |
| DP_OP_50J2_151_5914             |            |                            |
|                | DP_OP_50J2_151_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_150_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_150_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_151_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_151_5914  | add_306 sub_307                                     |
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
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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
| DP_OP_49J2_124_2805             |            |                            |
|                | DP_OP_49J2_124_2805 |       |                            |
| DP_OP_50J2_125_5914             |            |                            |
|                | DP_OP_50J2_125_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_124_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_124_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_125_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_125_5914  | add_306 sub_307                                     |
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
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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
| DP_OP_49J2_126_2805             |            |                            |
|                | DP_OP_49J2_126_2805 |       |                            |
| DP_OP_50J2_127_5914             |            |                            |
|                | DP_OP_50J2_127_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_126_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_126_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_127_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_127_5914  | add_306 sub_307                                     |
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
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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
| DP_OP_49J2_128_2805             |            |                            |
|                | DP_OP_49J2_128_2805 |       |                            |
| DP_OP_50J2_129_5914             |            |                            |
|                | DP_OP_50J2_129_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_128_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_128_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_129_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_129_5914  | add_306 sub_307                                     |
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
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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
| DP_OP_49J2_130_2805             |            |                            |
|                | DP_OP_49J2_130_2805 |       |                            |
| DP_OP_50J2_131_5914             |            |                            |
|                | DP_OP_50J2_131_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_130_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_130_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_131_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_131_5914  | add_306 sub_307                                     |
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
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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
| DP_OP_49J2_132_2805             |            |                            |
|                | DP_OP_49J2_132_2805 |       |                            |
| DP_OP_50J2_133_5914             |            |                            |
|                | DP_OP_50J2_133_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_132_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_132_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_133_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_133_5914  | add_306 sub_307                                     |
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
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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
| DP_OP_49J2_134_2805             |            |                            |
|                | DP_OP_49J2_134_2805 |       |                            |
| DP_OP_50J2_135_5914             |            |                            |
|                | DP_OP_50J2_135_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_134_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_134_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_135_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_135_5914  | add_306 sub_307                                     |
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
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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
| DP_OP_49J2_136_2805             |            |                            |
|                | DP_OP_49J2_136_2805 |       |                            |
| DP_OP_50J2_137_5914             |            |                            |
|                | DP_OP_50J2_137_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_136_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_136_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_137_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_137_5914  | add_306 sub_307                                     |
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
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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
| DP_OP_49J2_138_2805             |            |                            |
|                | DP_OP_49J2_138_2805 |       |                            |
| DP_OP_50J2_139_5914             |            |                            |
|                | DP_OP_50J2_139_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_138_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_138_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_139_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_139_5914  | add_306 sub_307                                     |
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
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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
| DP_OP_49J2_140_2805             |            |                            |
|                | DP_OP_49J2_140_2805 |       |                            |
| DP_OP_50J2_141_5914             |            |                            |
|                | DP_OP_50J2_141_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_140_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_140_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_141_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_141_5914  | add_306 sub_307                                     |
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
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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
| DP_OP_49J2_142_2805             |            |                            |
|                | DP_OP_49J2_142_2805 |       |                            |
| DP_OP_50J2_143_5914             |            |                            |
|                | DP_OP_50J2_143_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_142_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_142_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_143_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_143_5914  | add_306 sub_307                                     |
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
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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
| DP_OP_49J2_182_2805             |            |                            |
|                | DP_OP_49J2_182_2805 |       |                            |
| DP_OP_50J2_183_5914             |            |                            |
|                | DP_OP_50J2_183_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_182_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_182_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_183_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_183_5914  | add_306 sub_307                                     |
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
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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
| DP_OP_49J2_184_2805             |            |                            |
|                | DP_OP_49J2_184_2805 |       |                            |
| DP_OP_50J2_185_5914             |            |                            |
|                | DP_OP_50J2_185_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_184_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_184_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_185_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_185_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_SUB/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_190_2805             |            |                            |
|                | DP_OP_49J2_190_2805 |       |                            |
| DP_OP_50J2_191_5914             |            |                            |
|                | DP_OP_50J2_191_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_190_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_190_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_191_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_191_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_SUB/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_194_2805             |            |                            |
|                | DP_OP_49J2_194_2805 |       |                            |
| DP_OP_50J2_195_5914             |            |                            |
|                | DP_OP_50J2_195_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_194_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_194_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_195_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_195_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_SUB/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_198_2805             |            |                            |
|                | DP_OP_49J2_198_2805 |       |                            |
| DP_OP_50J2_199_5914             |            |                            |
|                | DP_OP_50J2_199_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_198_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_198_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_199_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_199_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_SUB/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_202_2805             |            |                            |
|                | DP_OP_49J2_202_2805 |       |                            |
| DP_OP_50J2_203_5914             |            |                            |
|                | DP_OP_50J2_203_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_202_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_202_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_203_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_203_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_SUB/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_206_2805             |            |                            |
|                | DP_OP_49J2_206_2805 |       |                            |
| DP_OP_50J2_207_5914             |            |                            |
|                | DP_OP_50J2_207_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_206_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_206_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_207_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_207_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_SUB/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_210_2805             |            |                            |
|                | DP_OP_49J2_210_2805 |       |                            |
| DP_OP_50J2_211_5914             |            |                            |
|                | DP_OP_50J2_211_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_210_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_210_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_211_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_211_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_SUB/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_218_2805             |            |                            |
|                | DP_OP_49J2_218_2805 |       |                            |
| DP_OP_50J2_219_5914             |            |                            |
|                | DP_OP_50J2_219_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_218_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_218_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_219_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_219_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_SUB/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_214_2805             |            |                            |
|                | DP_OP_49J2_214_2805 |       |                            |
| DP_OP_50J2_215_5914             |            |                            |
|                | DP_OP_50J2_215_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_214_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_214_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_215_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_215_5914  | add_306 sub_307                                     |
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
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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
| DP_OP_49J2_154_2805             |            |                            |
|                | DP_OP_49J2_154_2805 |       |                            |
| DP_OP_50J2_155_5914             |            |                            |
|                | DP_OP_50J2_155_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_154_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_154_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_155_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_155_5914  | add_306 sub_307                                     |
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
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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
| DP_OP_49J2_156_2805             |            |                            |
|                | DP_OP_49J2_156_2805 |       |                            |
| DP_OP_50J2_157_5914             |            |                            |
|                | DP_OP_50J2_157_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_156_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_156_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_157_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_157_5914  | add_306 sub_307                                     |
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
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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
| DP_OP_49J2_158_2805             |            |                            |
|                | DP_OP_49J2_158_2805 |       |                            |
| DP_OP_50J2_159_5914             |            |                            |
|                | DP_OP_50J2_159_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_158_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_158_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_159_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_159_5914  | add_306 sub_307                                     |
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
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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
| DP_OP_49J2_160_2805             |            |                            |
|                | DP_OP_49J2_160_2805 |       |                            |
| DP_OP_50J2_161_5914             |            |                            |
|                | DP_OP_50J2_161_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_160_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_160_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_161_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_161_5914  | add_306 sub_307                                     |
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
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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
| DP_OP_49J2_162_2805             |            |                            |
|                | DP_OP_49J2_162_2805 |       |                            |
| DP_OP_50J2_163_5914             |            |                            |
|                | DP_OP_50J2_163_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_162_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_162_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_163_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_163_5914  | add_306 sub_307                                     |
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
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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
| DP_OP_49J2_164_2805             |            |                            |
|                | DP_OP_49J2_164_2805 |       |                            |
| DP_OP_50J2_165_5914             |            |                            |
|                | DP_OP_50J2_165_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_164_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_164_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_165_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_165_5914  | add_306 sub_307                                     |
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
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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
| DP_OP_49J2_166_2805             |            |                            |
|                | DP_OP_49J2_166_2805 |       |                            |
| DP_OP_50J2_167_5914             |            |                            |
|                | DP_OP_50J2_167_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_166_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_166_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_167_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_167_5914  | add_306 sub_307                                     |
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
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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
| DP_OP_49J2_168_2805             |            |                            |
|                | DP_OP_49J2_168_2805 |       |                            |
| DP_OP_50J2_169_5914             |            |                            |
|                | DP_OP_50J2_169_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_168_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_168_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_169_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_169_5914  | add_306 sub_307                                     |
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
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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
| DP_OP_49J2_170_2805             |            |                            |
|                | DP_OP_49J2_170_2805 |       |                            |
| DP_OP_50J2_171_5914             |            |                            |
|                | DP_OP_50J2_171_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_170_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_170_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_171_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_171_5914  | add_306 sub_307                                     |
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
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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
| DP_OP_49J2_172_2805             |            |                            |
|                | DP_OP_49J2_172_2805 |       |                            |
| DP_OP_50J2_173_5914             |            |                            |
|                | DP_OP_50J2_173_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_172_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_172_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_173_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_173_5914  | add_306 sub_307                                     |
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
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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
| DP_OP_49J2_174_2805             |            |                            |
|                | DP_OP_49J2_174_2805 |       |                            |
| DP_OP_50J2_175_5914             |            |                            |
|                | DP_OP_50J2_175_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_174_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_174_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_175_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_175_5914  | add_306 sub_307                                     |
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
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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
| DP_OP_49J2_176_2805             |            |                            |
|                | DP_OP_49J2_176_2805 |       |                            |
| DP_OP_50J2_177_5914             |            |                            |
|                | DP_OP_50J2_177_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_176_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_176_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_177_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_177_5914  | add_306 sub_307                                     |
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
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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
| DP_OP_49J2_178_2805             |            |                            |
|                | DP_OP_49J2_178_2805 |       |                            |
| DP_OP_50J2_179_5914             |            |                            |
|                | DP_OP_50J2_179_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_178_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_178_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_179_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_179_5914  | add_306 sub_307                                     |
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
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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
| DP_OP_49J2_180_2805             |            |                            |
|                | DP_OP_49J2_180_2805 |       |                            |
| DP_OP_50J2_181_5914             |            |                            |
|                | DP_OP_50J2_181_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_180_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_180_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_181_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_181_5914  | add_306 sub_307                                     |
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
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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
| DP_OP_49J2_186_2805             |            |                            |
|                | DP_OP_49J2_186_2805 |       |                            |
| DP_OP_50J2_187_5914             |            |                            |
|                | DP_OP_50J2_187_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_186_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_186_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_187_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_187_5914  | add_306 sub_307                                     |
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
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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
| DP_OP_49J2_188_2805             |            |                            |
|                | DP_OP_49J2_188_2805 |       |                            |
| DP_OP_50J2_189_5914             |            |                            |
|                | DP_OP_50J2_189_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_188_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_188_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_189_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_189_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_ADD/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_192_2805             |            |                            |
|                | DP_OP_49J2_192_2805 |       |                            |
| DP_OP_50J2_193_5914             |            |                            |
|                | DP_OP_50J2_193_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_192_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_192_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_193_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_193_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_ADD/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_196_2805             |            |                            |
|                | DP_OP_49J2_196_2805 |       |                            |
| DP_OP_50J2_197_5914             |            |                            |
|                | DP_OP_50J2_197_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_196_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_196_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_197_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_197_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_ADD/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_200_2805             |            |                            |
|                | DP_OP_49J2_200_2805 |       |                            |
| DP_OP_50J2_201_5914             |            |                            |
|                | DP_OP_50J2_201_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_200_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_200_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_201_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_201_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_ADD/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_204_2805             |            |                            |
|                | DP_OP_49J2_204_2805 |       |                            |
| DP_OP_50J2_205_5914             |            |                            |
|                | DP_OP_50J2_205_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_204_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_204_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_205_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_205_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_ADD/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_208_2805             |            |                            |
|                | DP_OP_49J2_208_2805 |       |                            |
| DP_OP_50J2_209_5914             |            |                            |
|                | DP_OP_50J2_209_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_208_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_208_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_209_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_209_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_ADD/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_212_2805             |            |                            |
|                | DP_OP_49J2_212_2805 |       |                            |
| DP_OP_50J2_213_5914             |            |                            |
|                | DP_OP_50J2_213_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_212_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_212_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_213_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_213_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_ADD/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_220_2805             |            |                            |
|                | DP_OP_49J2_220_2805 |       |                            |
| DP_OP_50J2_221_5914             |            |                            |
|                | DP_OP_50J2_221_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_220_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_220_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_221_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_221_5914  | add_306 sub_307                                     |
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


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_ADD/U1 in
        file ./DW_fp_addsub__rtl.v.e
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
| DP_OP_49J2_216_2805             |            |                            |
|                | DP_OP_49J2_216_2805 |       |                            |
| DP_OP_50J2_217_5914             |            |                            |
|                | DP_OP_50J2_217_5914 |       |                            |
=============================================================================

Datapath Report for DP_OP_49J2_216_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_49J2_216_2805  | add_249 add_249_2                                   |
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

Datapath Report for DP_OP_50J2_217_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_50J2_217_5914  | add_306 sub_307                                     |
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
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_2/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_3/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_2/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_MUL_3/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_SUB/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_SUB/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_SUB/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_SUB/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_SUB/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_SUB/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_SUB/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_SUB/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_ADD/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_ADD/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_ADD/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_ADD/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_ADD/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_ADD/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_ADD/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_ADD/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'u_stage_1/sub_182 (RADIX2.v:182)' in design 'IFFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_1/add_183 (RADIX2.v:183)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_2/sub_182 (RADIX2.v:182)' in design 'IFFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_2/add_183 (RADIX2.v:183)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_3/sub_182 (RADIX2.v:182)' in design 'IFFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_3/add_183 (RADIX2.v:183)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_4/sub_182 (RADIX2.v:182)' in design 'IFFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_4/add_183 (RADIX2.v:183)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_5/sub_182 (RADIX2.v:182)' in design 'IFFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_5/add_183 (RADIX2.v:183)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_6/sub_182 (RADIX2.v:182)' in design 'IFFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_6/add_183 (RADIX2.v:183)'.  (HDL-120)

Information: Operator associated with resources 'u_stage_7/sub_182 (RADIX2.v:182)' in design 'IFFT' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'u_stage_7/add_183 (RADIX2.v:183)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gte_x_4            | DW_cmp           | apparch (area)     |                |
| lt_x_7             | DW_cmp           | apparch (area)     |                |
| sub_x_8            | DW01_dec         | apparch (area)     |                |
| gte_x_22           | DW_cmp           | apparch (area)     |                |
| lt_x_25            | DW_cmp           | apparch (area)     |                |
| sub_x_26           | DW01_dec         | apparch (area)     |                |
| gte_x_41           | DW_cmp           | apparch (area)     |                |
| lt_x_44            | DW_cmp           | apparch (area)     |                |
| sub_x_45           | DW01_dec         | apparch (area)     |                |
| lt_x_53            | DW_cmp           | apparch (area)     |                |
| gte_x_61           | DW_cmp           | apparch (area)     |                |
| lt_x_64            | DW_cmp           | apparch (area)     |                |
| sub_x_65           | DW01_dec         | apparch (area)     |                |
| lt_x_73            | DW_cmp           | apparch (area)     |                |
| gte_x_81           | DW_cmp           | apparch (area)     |                |
| lt_x_84            | DW_cmp           | apparch (area)     |                |
| sub_x_85           | DW01_dec         | apparch (area)     |                |
| lt_x_93            | DW_cmp           | apparch (area)     |                |
| gte_x_101          | DW_cmp           | apparch (area)     |                |
| lt_x_104           | DW_cmp           | apparch (area)     |                |
| sub_x_105          | DW01_dec         | apparch (area)     |                |
| lt_x_113           | DW_cmp           | apparch (area)     |                |
| gte_x_121          | DW_cmp           | apparch (area)     |                |
| lt_x_124           | DW_cmp           | apparch (area)     |                |
| sub_x_125          | DW01_dec         | apparch (area)     |                |
| add_x_126          | DW01_add         | apparch (area)     |                |
| lt_x_133           | DW_cmp           | apparch (area)     |                |
| gte_x_141          | DW_cmp           | apparch (area)     |                |
| lt_x_144           | DW_cmp           | apparch (area)     |                |
| add_x_145          | DW01_add         | apparch (area)     |                |
| lt_x_152           | DW_cmp           | apparch (area)     |                |
| u_stage_1/u_FPC_MUL/u_FPR_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_1/u_FPC_MUL/u_FPR_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_1/u_FPC_MUL/u_FPR_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_1/u_FPC_MUL/u_FPR_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_1/u_FPC_MUL/u_FPR_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_1/u_FPC_MUL/u_FPR_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPR_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPR_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPR_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPR_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPR_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_8/u_FPC_MUL/u_FPR_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPR_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPR_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPR_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPR_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPR_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_7/u_FPC_MUL/u_FPR_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPR_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPR_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPR_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPR_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPR_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_6/u_FPC_MUL/u_FPR_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPR_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPR_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPR_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPR_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPR_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_5/u_FPC_MUL/u_FPR_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPR_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPR_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPR_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPR_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPR_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_4/u_FPC_MUL/u_FPR_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPR_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPR_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPR_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPR_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPR_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_3/u_FPC_MUL/u_FPR_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPR_ADD         |                    |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPR_SUB         |                    |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPR_MUL_3       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPR_MUL_2       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPR_MUL_1       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_2/u_FPC_MUL/u_FPR_MUL_0       |                    |                |
|                    | DW_fp_mult       | rtl                |                |
| u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0                |                |
|                    | DW_fp_add        | rtl                |                |
| u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1                |                |
|                    | DW_fp_sub        | rtl                |                |
| u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0                |                |
|                    | DW_fp_sub        | rtl                |                |
| add_x_5            | DW01_inc         | apparch (area)     |                |
| add_x_23           | DW01_inc         | apparch (area)     |                |
| add_x_42           | DW01_inc         | apparch (area)     |                |
| add_x_62           | DW01_inc         | apparch (area)     |                |
| add_x_82           | DW01_inc         | apparch (area)     |                |
| add_x_102          | DW01_inc         | apparch (area)     |                |
| add_x_122          | DW01_inc         | apparch (area)     |                |
| add_x_142          | DW01_inc         | apparch (area)     |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
| U1                 | DW_fp_addsub     | rtl                |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| add_x_34           | DW01_add         | apparch (area)     |                |
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
| DP_OP_49J2_144_2805                   |                    |                |
|                    | DP_OP_49J2_144_2805 | str (area,speed)                 |
| DP_OP_50J2_145_5914                   |                    |                |
|                    | DP_OP_50J2_145_5914 | str (area,speed)                 |
| DP_OP_49J2_146_2805                   |                    |                |
|                    | DP_OP_49J2_146_2805 | str (area,speed)                 |
| DP_OP_50J2_147_5914                   |                    |                |
|                    | DP_OP_50J2_147_5914 | str (area,speed)                 |
| DP_OP_49J2_148_2805                   |                    |                |
|                    | DP_OP_49J2_148_2805 | str (area,speed)                 |
| DP_OP_50J2_149_5914                   |                    |                |
|                    | DP_OP_50J2_149_5914 | str (area,speed)                 |
| DP_OP_49J2_150_2805                   |                    |                |
|                    | DP_OP_49J2_150_2805 | str (area,speed)                 |
| DP_OP_50J2_151_5914                   |                    |                |
|                    | DP_OP_50J2_151_5914 | str (area,speed)                 |
| DP_OP_49J2_124_2805                   |                    |                |
|                    | DP_OP_49J2_124_2805 | str (area,speed)                 |
| DP_OP_50J2_125_5914                   |                    |                |
|                    | DP_OP_50J2_125_5914 | str (area,speed)                 |
| DP_OP_49J2_126_2805                   |                    |                |
|                    | DP_OP_49J2_126_2805 | str (area,speed)                 |
| DP_OP_50J2_127_5914                   |                    |                |
|                    | DP_OP_50J2_127_5914 | str (area,speed)                 |
| DP_OP_49J2_128_2805                   |                    |                |
|                    | DP_OP_49J2_128_2805 | str (area,speed)                 |
| DP_OP_50J2_129_5914                   |                    |                |
|                    | DP_OP_50J2_129_5914 | str (area,speed)                 |
| DP_OP_49J2_130_2805                   |                    |                |
|                    | DP_OP_49J2_130_2805 | str (area,speed)                 |
| DP_OP_50J2_131_5914                   |                    |                |
|                    | DP_OP_50J2_131_5914 | str (area,speed)                 |
| DP_OP_49J2_132_2805                   |                    |                |
|                    | DP_OP_49J2_132_2805 | str (area,speed)                 |
| DP_OP_50J2_133_5914                   |                    |                |
|                    | DP_OP_50J2_133_5914 | str (area,speed)                 |
| DP_OP_49J2_134_2805                   |                    |                |
|                    | DP_OP_49J2_134_2805 | str (area,speed)                 |
| DP_OP_50J2_135_5914                   |                    |                |
|                    | DP_OP_50J2_135_5914 | str (area,speed)                 |
| DP_OP_49J2_136_2805                   |                    |                |
|                    | DP_OP_49J2_136_2805 | str (area,speed)                 |
| DP_OP_50J2_137_5914                   |                    |                |
|                    | DP_OP_50J2_137_5914 | str (area,speed)                 |
| DP_OP_49J2_138_2805                   |                    |                |
|                    | DP_OP_49J2_138_2805 | str (area,speed)                 |
| DP_OP_50J2_139_5914                   |                    |                |
|                    | DP_OP_50J2_139_5914 | str (area,speed)                 |
| DP_OP_49J2_140_2805                   |                    |                |
|                    | DP_OP_49J2_140_2805 | str (area,speed)                 |
| DP_OP_50J2_141_5914                   |                    |                |
|                    | DP_OP_50J2_141_5914 | str (area,speed)                 |
| DP_OP_49J2_142_2805                   |                    |                |
|                    | DP_OP_49J2_142_2805 | str (area,speed)                 |
| DP_OP_50J2_143_5914                   |                    |                |
|                    | DP_OP_50J2_143_5914 | str (area,speed)                 |
| DP_OP_49J2_182_2805                   |                    |                |
|                    | DP_OP_49J2_182_2805 | str (area,speed)                 |
| DP_OP_50J2_183_5914                   |                    |                |
|                    | DP_OP_50J2_183_5914 | str (area,speed)                 |
| DP_OP_49J2_184_2805                   |                    |                |
|                    | DP_OP_49J2_184_2805 | str (area,speed)                 |
| DP_OP_50J2_185_5914                   |                    |                |
|                    | DP_OP_50J2_185_5914 | str (area,speed)                 |
| DP_OP_49J2_190_2805                   |                    |                |
|                    | DP_OP_49J2_190_2805 | str (area,speed)                 |
| DP_OP_50J2_191_5914                   |                    |                |
|                    | DP_OP_50J2_191_5914 | str (area,speed)                 |
| DP_OP_49J2_194_2805                   |                    |                |
|                    | DP_OP_49J2_194_2805 | str (area,speed)                 |
| DP_OP_50J2_195_5914                   |                    |                |
|                    | DP_OP_50J2_195_5914 | str (area,speed)                 |
| DP_OP_49J2_198_2805                   |                    |                |
|                    | DP_OP_49J2_198_2805 | str (area,speed)                 |
| DP_OP_50J2_199_5914                   |                    |                |
|                    | DP_OP_50J2_199_5914 | str (area,speed)                 |
| DP_OP_49J2_202_2805                   |                    |                |
|                    | DP_OP_49J2_202_2805 | str (area,speed)                 |
| DP_OP_50J2_203_5914                   |                    |                |
|                    | DP_OP_50J2_203_5914 | str (area,speed)                 |
| DP_OP_49J2_206_2805                   |                    |                |
|                    | DP_OP_49J2_206_2805 | str (area,speed)                 |
| DP_OP_50J2_207_5914                   |                    |                |
|                    | DP_OP_50J2_207_5914 | str (area,speed)                 |
| DP_OP_49J2_210_2805                   |                    |                |
|                    | DP_OP_49J2_210_2805 | str (area,speed)                 |
| DP_OP_50J2_211_5914                   |                    |                |
|                    | DP_OP_50J2_211_5914 | str (area,speed)                 |
| DP_OP_49J2_218_2805                   |                    |                |
|                    | DP_OP_49J2_218_2805 | str (area,speed)                 |
| DP_OP_50J2_219_5914                   |                    |                |
|                    | DP_OP_50J2_219_5914 | str (area,speed)                 |
| DP_OP_49J2_214_2805                   |                    |                |
|                    | DP_OP_49J2_214_2805 | str (area,speed)                 |
| DP_OP_50J2_215_5914                   |                    |                |
|                    | DP_OP_50J2_215_5914 | str (area,speed)                 |
| DP_OP_49J2_154_2805                   |                    |                |
|                    | DP_OP_49J2_154_2805 | str (area,speed)                 |
| DP_OP_50J2_155_5914                   |                    |                |
|                    | DP_OP_50J2_155_5914 | str (area,speed)                 |
| DP_OP_49J2_156_2805                   |                    |                |
|                    | DP_OP_49J2_156_2805 | str (area,speed)                 |
| DP_OP_50J2_157_5914                   |                    |                |
|                    | DP_OP_50J2_157_5914 | str (area,speed)                 |
| DP_OP_49J2_158_2805                   |                    |                |
|                    | DP_OP_49J2_158_2805 | str (area,speed)                 |
| DP_OP_50J2_159_5914                   |                    |                |
|                    | DP_OP_50J2_159_5914 | str (area,speed)                 |
| DP_OP_49J2_160_2805                   |                    |                |
|                    | DP_OP_49J2_160_2805 | str (area,speed)                 |
| DP_OP_50J2_161_5914                   |                    |                |
|                    | DP_OP_50J2_161_5914 | str (area,speed)                 |
| DP_OP_49J2_162_2805                   |                    |                |
|                    | DP_OP_49J2_162_2805 | str (area,speed)                 |
| DP_OP_50J2_163_5914                   |                    |                |
|                    | DP_OP_50J2_163_5914 | str (area,speed)                 |
| DP_OP_49J2_164_2805                   |                    |                |
|                    | DP_OP_49J2_164_2805 | str (area,speed)                 |
| DP_OP_50J2_165_5914                   |                    |                |
|                    | DP_OP_50J2_165_5914 | str (area,speed)                 |
| DP_OP_49J2_166_2805                   |                    |                |
|                    | DP_OP_49J2_166_2805 | str (area,speed)                 |
| DP_OP_50J2_167_5914                   |                    |                |
|                    | DP_OP_50J2_167_5914 | str (area,speed)                 |
| DP_OP_49J2_168_2805                   |                    |                |
|                    | DP_OP_49J2_168_2805 | str (area,speed)                 |
| DP_OP_50J2_169_5914                   |                    |                |
|                    | DP_OP_50J2_169_5914 | str (area,speed)                 |
| DP_OP_49J2_170_2805                   |                    |                |
|                    | DP_OP_49J2_170_2805 | str (area,speed)                 |
| DP_OP_50J2_171_5914                   |                    |                |
|                    | DP_OP_50J2_171_5914 | str (area,speed)                 |
| DP_OP_49J2_172_2805                   |                    |                |
|                    | DP_OP_49J2_172_2805 | str (area,speed)                 |
| DP_OP_50J2_173_5914                   |                    |                |
|                    | DP_OP_50J2_173_5914 | str (area,speed)                 |
| DP_OP_49J2_174_2805                   |                    |                |
|                    | DP_OP_49J2_174_2805 | str (area,speed)                 |
| DP_OP_50J2_175_5914                   |                    |                |
|                    | DP_OP_50J2_175_5914 | str (area,speed)                 |
| DP_OP_49J2_176_2805                   |                    |                |
|                    | DP_OP_49J2_176_2805 | str (area,speed)                 |
| DP_OP_50J2_177_5914                   |                    |                |
|                    | DP_OP_50J2_177_5914 | str (area,speed)                 |
| DP_OP_49J2_178_2805                   |                    |                |
|                    | DP_OP_49J2_178_2805 | str (area,speed)                 |
| DP_OP_50J2_179_5914                   |                    |                |
|                    | DP_OP_50J2_179_5914 | str (area,speed)                 |
| DP_OP_49J2_180_2805                   |                    |                |
|                    | DP_OP_49J2_180_2805 | str (area,speed)                 |
| DP_OP_50J2_181_5914                   |                    |                |
|                    | DP_OP_50J2_181_5914 | str (area,speed)                 |
| DP_OP_49J2_186_2805                   |                    |                |
|                    | DP_OP_49J2_186_2805 | str (area,speed)                 |
| DP_OP_50J2_187_5914                   |                    |                |
|                    | DP_OP_50J2_187_5914 | str (area,speed)                 |
| DP_OP_49J2_188_2805                   |                    |                |
|                    | DP_OP_49J2_188_2805 | str (area,speed)                 |
| DP_OP_50J2_189_5914                   |                    |                |
|                    | DP_OP_50J2_189_5914 | str (area,speed)                 |
| DP_OP_49J2_192_2805                   |                    |                |
|                    | DP_OP_49J2_192_2805 | str (area,speed)                 |
| DP_OP_50J2_193_5914                   |                    |                |
|                    | DP_OP_50J2_193_5914 | str (area,speed)                 |
| DP_OP_49J2_196_2805                   |                    |                |
|                    | DP_OP_49J2_196_2805 | str (area,speed)                 |
| DP_OP_50J2_197_5914                   |                    |                |
|                    | DP_OP_50J2_197_5914 | str (area,speed)                 |
| DP_OP_49J2_200_2805                   |                    |                |
|                    | DP_OP_49J2_200_2805 | str (area,speed)                 |
| DP_OP_50J2_201_5914                   |                    |                |
|                    | DP_OP_50J2_201_5914 | str (area,speed)                 |
| DP_OP_49J2_204_2805                   |                    |                |
|                    | DP_OP_49J2_204_2805 | str (area,speed)                 |
| DP_OP_50J2_205_5914                   |                    |                |
|                    | DP_OP_50J2_205_5914 | str (area,speed)                 |
| DP_OP_49J2_208_2805                   |                    |                |
|                    | DP_OP_49J2_208_2805 | str (area,speed)                 |
| DP_OP_50J2_209_5914                   |                    |                |
|                    | DP_OP_50J2_209_5914 | str (area,speed)                 |
| DP_OP_49J2_212_2805                   |                    |                |
|                    | DP_OP_49J2_212_2805 | str (area,speed)                 |
| DP_OP_50J2_213_5914                   |                    |                |
|                    | DP_OP_50J2_213_5914 | str (area,speed)                 |
| DP_OP_49J2_220_2805                   |                    |                |
|                    | DP_OP_49J2_220_2805 | str (area,speed)                 |
| DP_OP_50J2_221_5914                   |                    |                |
|                    | DP_OP_50J2_221_5914 | str (area,speed)                 |
| DP_OP_49J2_216_2805                   |                    |                |
|                    | DP_OP_49J2_216_2805 | str (area,speed)                 |
| DP_OP_50J2_217_5914                   |                    |                |
|                    | DP_OP_50J2_217_5914 | str (area,speed)                 |
===============================================================================

1
