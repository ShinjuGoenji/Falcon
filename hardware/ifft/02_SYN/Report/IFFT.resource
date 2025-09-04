 
****************************************
Report : resources
Design : IFFT
Version: T-2022.03
Date   : Thu Sep  4 07:57:54 2025
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


Resource Report for Ungrouped Hierarchy *cell*J13*534108/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_SUB/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J12*534108/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_SUB/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J11*534108/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_SUB/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*534108/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_SUB/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J13*550100/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_SUB/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J12*550100/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_SUB/U1 in
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
| DP_OP_65J12_331_9389            |            |                            |
|                | DP_OP_65J12_331_9389 |      |                            |
| DP_OP_66J12_332_2805            |            |                            |
|                | DP_OP_66J12_332_2805 |      |                            |
| DP_OP_67J12_333_5914            |            |                            |
|                | DP_OP_67J12_333_5914 |      |                            |
=============================================================================

Datapath Report for DP_OP_65J12_331_9389
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65J12_331_9389 | sub_277 sub_add_279 add_279_ni                      |
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

Datapath Report for DP_OP_66J12_332_2805
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J12_332_2805 | add_294 add_294_2                                   |
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

Datapath Report for DP_OP_67J12_333_5914
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J12_333_5914 | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy *cell*J11*550100/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_SUB/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*646171/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_ADD/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*550087/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_SUB/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J16*630187/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_ADD/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J15*630187/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_ADD/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J14*630187/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_ADD/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*630187/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_ADD/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J16*646184/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_ADD/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J15*646184/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_ADD/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J14*646184/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_ADD/U1 in
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


Resource Report for Ungrouped Hierarchy *cell*J14*598245/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*598245/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J16*614214/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J15*614214/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J14*566308/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J15*566308/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*566308/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J16*566308/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J16*582277/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J15*582277/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J14*582277/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*582277/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J15*598246/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J16*598246/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J14*614213/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*614213/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J11*470256/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J12*470256/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*470256/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J13*470256/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J11*486231/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J12*486231/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J13*486231/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*486231/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J12*502173/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J13*502173/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J11*502173/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*502173/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J12*518115/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J13*518115/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*J11*518115/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1 in file
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


Resource Report for Ungrouped Hierarchy *cell*518115/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=56 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1 in file
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


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_5/u_FPC_MUL/u_FPR_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_6/u_FPC_MUL/u_FPR_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_4/u_FPC_MUL/u_FPR_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_1/u_FPC_MUL/u_FPR_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U2
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


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_7/u_FPC_MUL/u_FPR_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_4/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_3/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_1/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_2/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_2/u_FPC_MUL/u_FPR_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_3/u_FPC_MUL/u_FPR_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_6/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_ADD/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_7/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_8/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_ADD/u_FPR_ADD_1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy u_stage_8/u_FPC_MUL/u_FPR_SUB/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_stage_5/u_BUTTERFLY/u_FPC_SUB/u_FPR_SUB_1/U1/U2
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
| DP_OP_65J13_323_9389                  |                    |                |
|                    | DP_OP_65J13_323_9389 | str (area,speed)                |
| DP_OP_66J13_324_2805                  |                    |                |
|                    | DP_OP_66J13_324_2805 | str (area,speed)                |
| DP_OP_67J13_325_5914                  |                    |                |
|                    | DP_OP_67J13_325_5914 | str (area,speed)                |
| DP_OP_65J12_323_9389                  |                    |                |
|                    | DP_OP_65J12_323_9389 | str (area,speed)                |
| DP_OP_66J12_324_2805                  |                    |                |
|                    | DP_OP_66J12_324_2805 | str (area,speed)                |
| DP_OP_67J12_325_5914                  |                    |                |
|                    | DP_OP_67J12_325_5914 | str (area,speed)                |
| DP_OP_65J11_323_9389                  |                    |                |
|                    | DP_OP_65J11_323_9389 | str (area,speed)                |
| DP_OP_66J11_324_2805                  |                    |                |
|                    | DP_OP_66J11_324_2805 | str (area,speed)                |
| DP_OP_67J11_325_5914                  |                    |                |
|                    | DP_OP_67J11_325_5914 | str (area,speed)                |
| DP_OP_65_323_9389  | DP_OP_65_323_9389 | str (area,speed)  |                |
| DP_OP_66_324_2805  | DP_OP_66_324_2805 | str (area,speed)  |                |
| DP_OP_67_325_5914  | DP_OP_67_325_5914 | str (area,speed)  |                |
| DP_OP_65J13_331_9389                  |                    |                |
|                    | DP_OP_65J13_331_9389 | str (area,speed)                |
| DP_OP_66J13_332_2805                  |                    |                |
|                    | DP_OP_66J13_332_2805 | str (area,speed)                |
| DP_OP_67J13_333_5914                  |                    |                |
|                    | DP_OP_67J13_333_5914 | str (area,speed)                |
| DP_OP_65J12_331_9389                  |                    |                |
|                    | DP_OP_65J12_331_9389 | str (area,speed)                |
| DP_OP_66J12_332_2805                  |                    |                |
|                    | DP_OP_66J12_332_2805 | str (area,speed)                |
| DP_OP_67J12_333_5914                  |                    |                |
|                    | DP_OP_67J12_333_5914 | str (area,speed)                |
| DP_OP_65J11_331_9389                  |                    |                |
|                    | DP_OP_65J11_331_9389 | str (area,speed)                |
| DP_OP_66J11_332_2805                  |                    |                |
|                    | DP_OP_66J11_332_2805 | str (area,speed)                |
| DP_OP_67J11_333_5914                  |                    |                |
|                    | DP_OP_67J11_333_5914 | str (area,speed)                |
| DP_OP_65_523_9389  | DP_OP_65_523_9389 | str (area,speed)  |                |
| DP_OP_66_524_2805  | DP_OP_66_524_2805 | str (area,speed)  |                |
| DP_OP_67_525_5914  | DP_OP_67_525_5914 | str (area,speed)  |                |
| DP_OP_65_331_9389  | DP_OP_65_331_9389 | str (area,speed)  |                |
| DP_OP_66_332_2805  | DP_OP_66_332_2805 | str (area,speed)  |                |
| DP_OP_67_333_5914  | DP_OP_67_333_5914 | str (area,speed)  |                |
| DP_OP_65J16_515_9389                  |                    |                |
|                    | DP_OP_65J16_515_9389 | str (area,speed)                |
| DP_OP_66J16_516_2805                  |                    |                |
|                    | DP_OP_66J16_516_2805 | str (area,speed)                |
| DP_OP_67J16_517_5914                  |                    |                |
|                    | DP_OP_67J16_517_5914 | str (area,speed)                |
| DP_OP_65J15_515_9389                  |                    |                |
|                    | DP_OP_65J15_515_9389 | str (area,speed)                |
| DP_OP_66J15_516_2805                  |                    |                |
|                    | DP_OP_66J15_516_2805 | str (area,speed)                |
| DP_OP_67J15_517_5914                  |                    |                |
|                    | DP_OP_67J15_517_5914 | str (area,speed)                |
| DP_OP_65J14_515_9389                  |                    |                |
|                    | DP_OP_65J14_515_9389 | str (area,speed)                |
| DP_OP_66J14_516_2805                  |                    |                |
|                    | DP_OP_66J14_516_2805 | str (area,speed)                |
| DP_OP_67J14_517_5914                  |                    |                |
|                    | DP_OP_67J14_517_5914 | str (area,speed)                |
| DP_OP_65_515_9389  | DP_OP_65_515_9389 | str (area,speed)  |                |
| DP_OP_66_516_2805  | DP_OP_66_516_2805 | str (area,speed)  |                |
| DP_OP_67_517_5914  | DP_OP_67_517_5914 | str (area,speed)  |                |
| DP_OP_65J16_523_9389                  |                    |                |
|                    | DP_OP_65J16_523_9389 | str (area,speed)                |
| DP_OP_66J16_524_2805                  |                    |                |
|                    | DP_OP_66J16_524_2805 | str (area,speed)                |
| DP_OP_67J16_525_5914                  |                    |                |
|                    | DP_OP_67J16_525_5914 | str (area,speed)                |
| DP_OP_65J15_523_9389                  |                    |                |
|                    | DP_OP_65J15_523_9389 | str (area,speed)                |
| DP_OP_66J15_524_2805                  |                    |                |
|                    | DP_OP_66J15_524_2805 | str (area,speed)                |
| DP_OP_67J15_525_5914                  |                    |                |
|                    | DP_OP_67J15_525_5914 | str (area,speed)                |
| DP_OP_65J14_523_9389                  |                    |                |
|                    | DP_OP_65J14_523_9389 | str (area,speed)                |
| DP_OP_66J14_524_2805                  |                    |                |
|                    | DP_OP_66J14_524_2805 | str (area,speed)                |
| DP_OP_67J14_525_5914                  |                    |                |
|                    | DP_OP_67J14_525_5914 | str (area,speed)                |
| DP_OP_65J14_499_9389                  |                    |                |
|                    | DP_OP_65J14_499_9389 | str (area,speed)                |
| DP_OP_66J14_500_2805                  |                    |                |
|                    | DP_OP_66J14_500_2805 | str (area,speed)                |
| DP_OP_67J14_501_5914                  |                    |                |
|                    | DP_OP_67J14_501_5914 | str (area,speed)                |
| DP_OP_65_499_9389  | DP_OP_65_499_9389 | str (area,speed)  |                |
| DP_OP_66_500_2805  | DP_OP_66_500_2805 | str (area,speed)  |                |
| DP_OP_67_501_5914  | DP_OP_67_501_5914 | str (area,speed)  |                |
| DP_OP_65J16_507_9389                  |                    |                |
|                    | DP_OP_65J16_507_9389 | str (area,speed)                |
| DP_OP_66J16_508_2805                  |                    |                |
|                    | DP_OP_66J16_508_2805 | str (area,speed)                |
| DP_OP_67J16_509_5914                  |                    |                |
|                    | DP_OP_67J16_509_5914 | str (area,speed)                |
| DP_OP_65J15_507_9389                  |                    |                |
|                    | DP_OP_65J15_507_9389 | str (area,speed)                |
| DP_OP_66J15_508_2805                  |                    |                |
|                    | DP_OP_66J15_508_2805 | str (area,speed)                |
| DP_OP_67J15_509_5914                  |                    |                |
|                    | DP_OP_67J15_509_5914 | str (area,speed)                |
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
| DP_OP_65_483_9389  | DP_OP_65_483_9389 | str (area,speed)  |                |
| DP_OP_66_484_2805  | DP_OP_66_484_2805 | str (area,speed)  |                |
| DP_OP_67_485_5914  | DP_OP_67_485_5914 | str (area,speed)  |                |
| DP_OP_65J16_483_9389                  |                    |                |
|                    | DP_OP_65J16_483_9389 | str (area,speed)                |
| DP_OP_66J16_484_2805                  |                    |                |
|                    | DP_OP_66J16_484_2805 | str (area,speed)                |
| DP_OP_67J16_485_5914                  |                    |                |
|                    | DP_OP_67J16_485_5914 | str (area,speed)                |
| DP_OP_65J16_491_9389                  |                    |                |
|                    | DP_OP_65J16_491_9389 | str (area,speed)                |
| DP_OP_66J16_492_2805                  |                    |                |
|                    | DP_OP_66J16_492_2805 | str (area,speed)                |
| DP_OP_67J16_493_5914                  |                    |                |
|                    | DP_OP_67J16_493_5914 | str (area,speed)                |
| DP_OP_65J15_491_9389                  |                    |                |
|                    | DP_OP_65J15_491_9389 | str (area,speed)                |
| DP_OP_66J15_492_2805                  |                    |                |
|                    | DP_OP_66J15_492_2805 | str (area,speed)                |
| DP_OP_67J15_493_5914                  |                    |                |
|                    | DP_OP_67J15_493_5914 | str (area,speed)                |
| DP_OP_65J14_491_9389                  |                    |                |
|                    | DP_OP_65J14_491_9389 | str (area,speed)                |
| DP_OP_66J14_492_2805                  |                    |                |
|                    | DP_OP_66J14_492_2805 | str (area,speed)                |
| DP_OP_67J14_493_5914                  |                    |                |
|                    | DP_OP_67J14_493_5914 | str (area,speed)                |
| DP_OP_65_491_9389  | DP_OP_65_491_9389 | str (area,speed)  |                |
| DP_OP_66_492_2805  | DP_OP_66_492_2805 | str (area,speed)  |                |
| DP_OP_67_493_5914  | DP_OP_67_493_5914 | str (area,speed)  |                |
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
| DP_OP_65J14_507_9389                  |                    |                |
|                    | DP_OP_65J14_507_9389 | str (area,speed)                |
| DP_OP_66J14_508_2805                  |                    |                |
|                    | DP_OP_66J14_508_2805 | str (area,speed)                |
| DP_OP_67J14_509_5914                  |                    |                |
|                    | DP_OP_67J14_509_5914 | str (area,speed)                |
| DP_OP_65_507_9389  | DP_OP_65_507_9389 | str (area,speed)  |                |
| DP_OP_66_508_2805  | DP_OP_66_508_2805 | str (area,speed)  |                |
| DP_OP_67_509_5914  | DP_OP_67_509_5914 | str (area,speed)  |                |
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
| DP_OP_65_299_9389  | DP_OP_65_299_9389 | str (area,speed)  |                |
| DP_OP_66_300_2805  | DP_OP_66_300_2805 | str (area,speed)  |                |
| DP_OP_67_301_5914  | DP_OP_67_301_5914 | str (area,speed)  |                |
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
| DP_OP_65J11_307_9389                  |                    |                |
|                    | DP_OP_65J11_307_9389 | str (area,speed)                |
| DP_OP_66J11_308_2805                  |                    |                |
|                    | DP_OP_66J11_308_2805 | str (area,speed)                |
| DP_OP_67J11_309_5914                  |                    |                |
|                    | DP_OP_67J11_309_5914 | str (area,speed)                |
| DP_OP_65_307_9389  | DP_OP_65_307_9389 | str (area,speed)  |                |
| DP_OP_66_308_2805  | DP_OP_66_308_2805 | str (area,speed)  |                |
| DP_OP_67_309_5914  | DP_OP_67_309_5914 | str (area,speed)  |                |
| DP_OP_65J12_315_9389                  |                    |                |
|                    | DP_OP_65J12_315_9389 | str (area,speed)                |
| DP_OP_66J12_316_2805                  |                    |                |
|                    | DP_OP_66J12_316_2805 | str (area,speed)                |
| DP_OP_67J12_317_5914                  |                    |                |
|                    | DP_OP_67J12_317_5914 | str (area,speed)                |
| DP_OP_65J13_315_9389                  |                    |                |
|                    | DP_OP_65J13_315_9389 | str (area,speed)                |
| DP_OP_66J13_316_2805                  |                    |                |
|                    | DP_OP_66J13_316_2805 | str (area,speed)                |
| DP_OP_67J13_317_5914                  |                    |                |
|                    | DP_OP_67J13_317_5914 | str (area,speed)                |
| DP_OP_65J11_315_9389                  |                    |                |
|                    | DP_OP_65J11_315_9389 | str (area,speed)                |
| DP_OP_66J11_316_2805                  |                    |                |
|                    | DP_OP_66J11_316_2805 | str (area,speed)                |
| DP_OP_67J11_317_5914                  |                    |                |
|                    | DP_OP_67J11_317_5914 | str (area,speed)                |
| DP_OP_65_315_9389  | DP_OP_65_315_9389 | str (area,speed)  |                |
| DP_OP_66_316_2805  | DP_OP_66_316_2805 | str (area,speed)  |                |
| DP_OP_67_317_5914  | DP_OP_67_317_5914 | str (area,speed)  |                |
===============================================================================

1
