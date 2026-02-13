 
****************************************
Report : resources
Design : MAKE_FG
Version: T-2022.03
Date   : Fri Feb 13 15:17:12 2026
****************************************


Resource Report for this hierarchy in file ../01_RTL/MAKE_FG.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| ash_1          | DW_leftsh      | A_width=11 | sll_125 (MAKE_FG.sv:125)   |
|                |                | SH_width=4 |                            |
| add_x_2        | DW01_inc       | width=12   | add_151 (MAKE_FG.sv:151)   |
| ash_5          | DW_leftsh      | A_width=17 | sll_181 (MAKE_FG.sv:181)   |
|                |                | SH_width=4 |                            |
| gte_x_6        | DW_cmp         | width=17   | gte_181 (MAKE_FG.sv:181)   |
| add_x_8        | DW01_add       | width=11   | add_198 (MAKE_FG.sv:198)   |
| add_x_14       | DW01_inc       | width=12   | add_259 (MAKE_FG.sv:259)   |
| add_x_16       | DW01_add       | width=11   | add_269 (MAKE_FG.sv:269)   |
| DP_OP_124J4_122_6273            |            |                            |
|                | DP_OP_124J4_122_6273 |      |                            |
=============================================================================

Datapath Report for DP_OP_124J4_122_6273
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_124J4_122_6273 | mult_250 (MAKE_FG.sv:250) sub_250 (MAKE_FG.sv:250)  |
|                      | eq_250 (MAKE_FG.sv:250)                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 9     |                                          |
| I3    | PI   | Unsigned | 12    |                                          |
| T11   | IFO  | Unsigned | 20    | I1 * I2 (MAKE_FG.sv:250)                 |
| T12   | IFO  | Signed   | 21    | T11 - $unsigned(1'b1) (MAKE_FG.sv:250)   |
| T90   | IFO  | Signed   | 32    | T12                                      |
| O1    | PO   | Unsigned | 1     | I3 == $unsigned(T90) (MAKE_FG.sv:250)    |
==============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[1].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| DP_OP_20J6_122_3321             |            |                            |
|                | DP_OP_20J6_122_3321 |       |                            |
| DP_OP_21J6_123_6950             |            |                            |
|                | DP_OP_21J6_123_6950 |       |                            |
| DP_OP_22J6_124_1257             |            |                            |
|                | DP_OP_22J6_124_1257 |       |                            |
=============================================================================

Datapath Report for DP_OP_20J6_122_3321
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_20J6_122_3321  | mult_223 (MODP_MONTYMUL_TOP.sv:223)                 |
|                      | mult_224 (MODP_MONTYMUL_TOP.sv:224)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T10   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:223)       |
| O2    | PO   | Unsigned | 31    | T10 * I3 (MODP_MONTYMUL_TOP.sv:224)      |
==============================================================================

Datapath Report for DP_OP_21J6_123_6950
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_21J6_123_6950  | mult_225 (MODP_MONTYMUL_TOP.sv:225)                 |
|                      | add_228 (MODP_MONTYMUL_TOP.sv:228)                  |
|                      | sub_233 (MODP_MONTYMUL_TOP.sv:233)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 16    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 47    |                                          |
| I4    | PI   | Unsigned | 17    |                                          |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.sv:225)       |
| T13   | IFO  | Signed   | 17    | O1[32:16]                                |
| O1    | PO   | Unsigned | 47    | I3 + T2 (MODP_MONTYMUL_TOP.sv:228)       |
| O2    | PO   | Signed   | 17    | T13 - I4 (MODP_MONTYMUL_TOP.sv:233)      |
==============================================================================

Datapath Report for DP_OP_22J6_124_1257
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_22J6_124_1257  | mult_226 (MODP_MONTYMUL_TOP.sv:226)                 |
|                      | add_229 (MODP_MONTYMUL_TOP.sv:229)                  |
|                      | sub_234 (MODP_MONTYMUL_TOP.sv:234)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 62    |                                          |
| T3    | IFO  | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:226)       |
| T15   | IFO  | Unsigned | 32    | O1[62:31]                                |
| O1    | PO   | Unsigned | 63    | I3 + T3 (MODP_MONTYMUL_TOP.sv:229)       |
| O2    | PO   | Signed   | 32    | T15 - I2 (MODP_MONTYMUL_TOP.sv:234)      |
==============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[0].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| DP_OP_20J6_125_7417             |            |                            |
|                | DP_OP_20J6_125_7417 |       |                            |
| DP_OP_21J6_126_4195             |            |                            |
|                | DP_OP_21J6_126_4195 |       |                            |
| DP_OP_22J6_127_7128             |            |                            |
|                | DP_OP_22J6_127_7128 |       |                            |
=============================================================================

Datapath Report for DP_OP_20J6_125_7417
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_20J6_125_7417  | mult_223 (MODP_MONTYMUL_TOP.sv:223)                 |
|                      | mult_224 (MODP_MONTYMUL_TOP.sv:224)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T10   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:223)       |
| O2    | PO   | Unsigned | 31    | T10 * I3 (MODP_MONTYMUL_TOP.sv:224)      |
==============================================================================

Datapath Report for DP_OP_21J6_126_4195
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_21J6_126_4195  | mult_225 (MODP_MONTYMUL_TOP.sv:225)                 |
|                      | add_228 (MODP_MONTYMUL_TOP.sv:228)                  |
|                      | sub_233 (MODP_MONTYMUL_TOP.sv:233)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 16    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 47    |                                          |
| I4    | PI   | Unsigned | 17    |                                          |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.sv:225)       |
| T13   | IFO  | Signed   | 17    | O1[32:16]                                |
| O1    | PO   | Unsigned | 47    | I3 + T2 (MODP_MONTYMUL_TOP.sv:228)       |
| O2    | PO   | Signed   | 17    | T13 - I4 (MODP_MONTYMUL_TOP.sv:233)      |
==============================================================================

Datapath Report for DP_OP_22J6_127_7128
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_22J6_127_7128  | mult_226 (MODP_MONTYMUL_TOP.sv:226)                 |
|                      | add_229 (MODP_MONTYMUL_TOP.sv:229)                  |
|                      | sub_234 (MODP_MONTYMUL_TOP.sv:234)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 62    |                                          |
| T3    | IFO  | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:226)       |
| T15   | IFO  | Unsigned | 32    | O1[62:31]                                |
| O1    | PO   | Unsigned | 63    | I3 + T3 (MODP_MONTYMUL_TOP.sv:229)       |
| O2    | PO   | Signed   | 32    | T15 - I2 (MODP_MONTYMUL_TOP.sv:234)      |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'gte_181 (MAKE_FG.sv:181)' in design 'MAKE_FG' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'sll_181 (MAKE_FG.sv:181)'.  (HDL-120)

Information: Operator associated with resources 'mult_250 (MAKE_FG.sv:250)' in design 'MAKE_FG' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'sll_125 (MAKE_FG.sv:125)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| ash_1              | DW_leftsh        | astr (area)        |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| add_x_8            | DW01_add         | pparch (area,speed)                 |
| add_x_14           | DW01_inc         | apparch (area)     |                |
| add_x_16           | DW01_add         | pparch (area,speed)                 |
| DP_OP_124J4_122_6273                  |                    |                |
|                    | DP_OP_124J4_122_6273 | str (area,speed)                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_20J6_122_3321                   |                    |                |
|                    | DP_OP_20J6_122_3321 | str (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_22J6_124_1257                   |                    |                |
|                    | DP_OP_22J6_124_1257 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| DP_OP_20J6_125_7417                   |                    |                |
|                    | DP_OP_20J6_125_7417 | str (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_22J6_127_7128                   |                    |                |
|                    | DP_OP_22J6_127_7128 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
