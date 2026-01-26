 
****************************************
Report : resources
Design : MAKE_FG
Version: T-2022.03
Date   : Wed Jan 21 00:57:51 2026
****************************************


Resource Report for this hierarchy in file ../01_RTL/MAKE_FG.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_1        | DW01_inc       | width=10   | add_138 (MAKE_FG.sv:138)   |
| add_x_6        | DW01_add       | width=10   | add_180 (MAKE_FG.sv:180)   |
| add_x_12       | DW01_inc       | width=12   | add_251 (MAKE_FG.sv:251)   |
| add_x_14       | DW01_add       | width=10   | add_257 (MAKE_FG.sv:257)   |
| DP_OP_40J6_122_9807             |            |                            |
|                | DP_OP_40J6_122_9807 |       |                            |
| DP_OP_31_152_6098               |            |                            |
|                | DP_OP_31_152_6098 |         |                            |
| DP_OP_31_153_4898               |            |                            |
|                | DP_OP_31_153_4898 |         |                            |
| DP_OP_31_154_4850               |            |                            |
|                | DP_OP_31_154_4850 |         |                            |
| DP_OP_31_155_4802               |            |                            |
|                | DP_OP_31_155_4802 |         |                            |
=============================================================================

Datapath Report for DP_OP_40J6_122_9807
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_40J6_122_9807  | mult_242 (MAKE_FG.sv:242) sub_242 (MAKE_FG.sv:242)  |
|                      | eq_242 (MAKE_FG.sv:242)                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 9     |                                          |
| I2    | PI   | Unsigned | 9     |                                          |
| I3    | PI   | Unsigned | 12    |                                          |
| T9    | IFO  | Unsigned | 18    | I1 * I2 (MAKE_FG.sv:242)                 |
| T10   | IFO  | Signed   | 19    | T9 - $unsigned(1'b1) (MAKE_FG.sv:242)    |
| T29   | IFO  | Signed   | 32    | T10                                      |
| O1    | PO   | Unsigned | 1     | I3 == $unsigned(T29) (MAKE_FG.sv:242)    |
==============================================================================

Datapath Report for DP_OP_31_152_6098
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_31_152_6098    | mult_268 (MODP_MONTYMUL_TOP.sv:268)                 |
|                      | add_271 (MODP_MONTYMUL_TOP.sv:271)                  |
|                      | C350 (MODP_MONTYMUL_TOP.sv:278)                     |
|                      | C351 (MODP_MONTYMUL_TOP.sv:277)                     |
|                      | add_272 (MODP_MONTYMUL_TOP.sv:272)                  |
|                      | mult_269 (MODP_MONTYMUL_TOP.sv:269)                 |
|                      | gte_284 (MODP_MONTYMUL_TOP.sv:284)                  |
|                      | sub_279 (MODP_MONTYMUL_TOP.sv:279)                  |
|                      | sub_285 (MODP_MONTYMUL_TOP.sv:285)                  |
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
| T3    | IFO  | Unsigned | 62    | I7 * I2 (MODP_MONTYMUL_TOP.sv:269)       |
| T15   | IFO  | Unsigned | 32    | O2[62:31]                                |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.sv:268)       |
| T17   | IFO  | Signed   | 31    | O1[46:16]                                |
| T18   | IFO  | Signed   | 31    | O2[61:31]                                |
| T26   | IFO  | Signed   | 31    | { I4, I5 } ? T17 : T18 ( MODP_MONTYMUL_TOP.sv:277 MODP_MONTYMUL_TOP.sv:278 ) |
| O1    | PO   | Unsigned | 48    | I3 + T2 (MODP_MONTYMUL_TOP.sv:271)       |
| O2    | PO   | Unsigned | 63    | I6 + T3 (MODP_MONTYMUL_TOP.sv:272)       |
| O3    | PO   | Unsigned | 1     | T15 >= I2 (MODP_MONTYMUL_TOP.sv:284)     |
| O4    | PO   | Signed   | 31    | T26 - I2 ( MODP_MONTYMUL_TOP.sv:279 MODP_MONTYMUL_TOP.sv:285 ) |
==============================================================================

Datapath Report for DP_OP_31_153_4898
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_31_153_4898    | mult_268 (MODP_MONTYMUL_TOP.sv:268)                 |
|                      | add_271 (MODP_MONTYMUL_TOP.sv:271)                  |
|                      | C350 (MODP_MONTYMUL_TOP.sv:278)                     |
|                      | C351 (MODP_MONTYMUL_TOP.sv:277)                     |
|                      | add_272 (MODP_MONTYMUL_TOP.sv:272)                  |
|                      | mult_269 (MODP_MONTYMUL_TOP.sv:269)                 |
|                      | gte_284 (MODP_MONTYMUL_TOP.sv:284)                  |
|                      | sub_279 (MODP_MONTYMUL_TOP.sv:279)                  |
|                      | sub_285 (MODP_MONTYMUL_TOP.sv:285)                  |
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
| T3    | IFO  | Unsigned | 62    | I7 * I2 (MODP_MONTYMUL_TOP.sv:269)       |
| T15   | IFO  | Unsigned | 32    | O2[62:31]                                |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.sv:268)       |
| T17   | IFO  | Signed   | 31    | O1[46:16]                                |
| T18   | IFO  | Signed   | 31    | O2[61:31]                                |
| T26   | IFO  | Signed   | 31    | { I4, I5 } ? T17 : T18 ( MODP_MONTYMUL_TOP.sv:277 MODP_MONTYMUL_TOP.sv:278 ) |
| O1    | PO   | Unsigned | 48    | I3 + T2 (MODP_MONTYMUL_TOP.sv:271)       |
| O2    | PO   | Unsigned | 63    | I6 + T3 (MODP_MONTYMUL_TOP.sv:272)       |
| O3    | PO   | Unsigned | 1     | T15 >= I2 (MODP_MONTYMUL_TOP.sv:284)     |
| O4    | PO   | Signed   | 31    | T26 - I2 ( MODP_MONTYMUL_TOP.sv:279 MODP_MONTYMUL_TOP.sv:285 ) |
==============================================================================

Datapath Report for DP_OP_31_154_4850
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_31_154_4850    | mult_268 (MODP_MONTYMUL_TOP.sv:268)                 |
|                      | add_271 (MODP_MONTYMUL_TOP.sv:271)                  |
|                      | C350 (MODP_MONTYMUL_TOP.sv:278)                     |
|                      | C351 (MODP_MONTYMUL_TOP.sv:277)                     |
|                      | add_272 (MODP_MONTYMUL_TOP.sv:272)                  |
|                      | mult_269 (MODP_MONTYMUL_TOP.sv:269)                 |
|                      | gte_284 (MODP_MONTYMUL_TOP.sv:284)                  |
|                      | sub_279 (MODP_MONTYMUL_TOP.sv:279)                  |
|                      | sub_285 (MODP_MONTYMUL_TOP.sv:285)                  |
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
| T3    | IFO  | Unsigned | 62    | I7 * I2 (MODP_MONTYMUL_TOP.sv:269)       |
| T15   | IFO  | Unsigned | 32    | O2[62:31]                                |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.sv:268)       |
| T17   | IFO  | Signed   | 31    | O1[46:16]                                |
| T18   | IFO  | Signed   | 31    | O2[61:31]                                |
| T26   | IFO  | Signed   | 31    | { I4, I5 } ? T17 : T18 ( MODP_MONTYMUL_TOP.sv:277 MODP_MONTYMUL_TOP.sv:278 ) |
| O1    | PO   | Unsigned | 48    | I3 + T2 (MODP_MONTYMUL_TOP.sv:271)       |
| O2    | PO   | Unsigned | 63    | I6 + T3 (MODP_MONTYMUL_TOP.sv:272)       |
| O3    | PO   | Unsigned | 1     | T15 >= I2 (MODP_MONTYMUL_TOP.sv:284)     |
| O4    | PO   | Signed   | 31    | T26 - I2 ( MODP_MONTYMUL_TOP.sv:279 MODP_MONTYMUL_TOP.sv:285 ) |
==============================================================================

Datapath Report for DP_OP_31_155_4802
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_31_155_4802    | mult_268 (MODP_MONTYMUL_TOP.sv:268)                 |
|                      | add_271 (MODP_MONTYMUL_TOP.sv:271)                  |
|                      | C350 (MODP_MONTYMUL_TOP.sv:278)                     |
|                      | C351 (MODP_MONTYMUL_TOP.sv:277)                     |
|                      | add_272 (MODP_MONTYMUL_TOP.sv:272)                  |
|                      | mult_269 (MODP_MONTYMUL_TOP.sv:269)                 |
|                      | gte_284 (MODP_MONTYMUL_TOP.sv:284)                  |
|                      | sub_279 (MODP_MONTYMUL_TOP.sv:279)                  |
|                      | sub_285 (MODP_MONTYMUL_TOP.sv:285)                  |
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
| T3    | IFO  | Unsigned | 62    | I7 * I2 (MODP_MONTYMUL_TOP.sv:269)       |
| T15   | IFO  | Unsigned | 32    | O2[62:31]                                |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.sv:268)       |
| T17   | IFO  | Signed   | 31    | O1[46:16]                                |
| T18   | IFO  | Signed   | 31    | O2[61:31]                                |
| T26   | IFO  | Signed   | 31    | { I4, I5 } ? T17 : T18 ( MODP_MONTYMUL_TOP.sv:277 MODP_MONTYMUL_TOP.sv:278 ) |
| O1    | PO   | Unsigned | 48    | I3 + T2 (MODP_MONTYMUL_TOP.sv:271)       |
| O2    | PO   | Unsigned | 63    | I6 + T3 (MODP_MONTYMUL_TOP.sv:272)       |
| O3    | PO   | Unsigned | 1     | T15 >= I2 (MODP_MONTYMUL_TOP.sv:284)     |
| O4    | PO   | Signed   | 31    | T26 - I2 ( MODP_MONTYMUL_TOP.sv:279 MODP_MONTYMUL_TOP.sv:285 ) |
==============================================================================


Resource Report for Ungrouped Hierarchy u_MODP_MONTYMUL_TOP in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| sub_x_1        | DW01_sub       | width=3    | sub_163_I5_aco (MODP_MONTYMUL_TOP.sv:163) |
| sub_x_2        | DW01_sub       | width=3    | sub_163_I6_aco (MODP_MONTYMUL_TOP.sv:163) |
| sub_x_3        | DW01_sub       | width=3    | sub_163_I7_aco (MODP_MONTYMUL_TOP.sv:163) |
| add_x_748      | DW01_add       | width=2    | sub_163_I2_aco (MODP_MONTYMUL_TOP.sv:163) |
  |                |            | sub_163_I3_aco (MODP_MONTYMUL_TOP.sv:163) |
  |                |            | sub_163_I4_aco (MODP_MONTYMUL_TOP.sv:163) |
| sub_x_749      | DW01_sub       | width=3    | sub_163_I2_aco (MODP_MONTYMUL_TOP.sv:163) |
  |                |            | sub_163_I3_aco (MODP_MONTYMUL_TOP.sv:163) |
  |                |            | sub_163_I4_aco (MODP_MONTYMUL_TOP.sv:163) |
| sub_x_750      | DW01_sub       | width=3    | sub_163_I2_aco (MODP_MONTYMUL_TOP.sv:163) |
  |                |            | sub_163_I3_aco (MODP_MONTYMUL_TOP.sv:163) |
  |                |            | sub_163_I4_aco (MODP_MONTYMUL_TOP.sv:163) |
=============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[0].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=32   | gte_278 (MODP_MONTYMUL_TOP.sv:278) |
| DP_OP_29J5_134_5124             |            |                            |
|                | DP_OP_29J5_134_5124 |       |                            |
=============================================================================

Datapath Report for DP_OP_29J5_134_5124
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_29J5_134_5124  | mult_266 (MODP_MONTYMUL_TOP.sv:266)                 |
|                      | mult_267 (MODP_MONTYMUL_TOP.sv:267)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T12   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:266)       |
| O2    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL_TOP.sv:267)      |
==============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[1].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=32   | gte_278 (MODP_MONTYMUL_TOP.sv:278) |
| DP_OP_29J5_134_5124             |            |                            |
|                | DP_OP_29J5_134_5124 |       |                            |
=============================================================================

Datapath Report for DP_OP_29J5_134_5124
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_29J5_134_5124  | mult_266 (MODP_MONTYMUL_TOP.sv:266)                 |
|                      | mult_267 (MODP_MONTYMUL_TOP.sv:267)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T12   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:266)       |
| O2    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL_TOP.sv:267)      |
==============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[2].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=32   | gte_278 (MODP_MONTYMUL_TOP.sv:278) |
| DP_OP_29J5_134_5124             |            |                            |
|                | DP_OP_29J5_134_5124 |       |                            |
=============================================================================

Datapath Report for DP_OP_29J5_134_5124
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_29J5_134_5124  | mult_266 (MODP_MONTYMUL_TOP.sv:266)                 |
|                      | mult_267 (MODP_MONTYMUL_TOP.sv:267)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T12   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:266)       |
| O2    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL_TOP.sv:267)      |
==============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[3].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=32   | gte_278 (MODP_MONTYMUL_TOP.sv:278) |
| DP_OP_29J5_134_5124             |            |                            |
|                | DP_OP_29J5_134_5124 |       |                            |
=============================================================================

Datapath Report for DP_OP_29J5_134_5124
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_29J5_134_5124  | mult_266 (MODP_MONTYMUL_TOP.sv:266)                 |
|                      | mult_267 (MODP_MONTYMUL_TOP.sv:267)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T12   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:266)       |
| O2    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL_TOP.sv:267)      |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_1            | DW01_inc         | apparch (area)     |                |
| add_x_6            | DW01_add         | apparch (area)     |                |
| add_x_12           | DW01_inc         | apparch (area)     |                |
| add_x_14           | DW01_add         | apparch (area)     |                |
| sub_x_1            | DW01_sub         | apparch (area)     |                |
| sub_x_2            | DW01_sub         | apparch (area)     |                |
| sub_x_3            | DW01_sub         | apparch (area)     |                |
| add_x_748          | DW01_add         | apparch (area)     |                |
| sub_x_749          | DW01_sub         | apparch (area)     |                |
| sub_x_750          | DW01_sub         | apparch (area)     |                |
| DP_OP_40J6_122_9807                   |                    |                |
|                    | DP_OP_40J6_122_9807 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_31_152_6098  | DP_OP_31_152_6098 | str (area,speed)  |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_31_153_4898  | DP_OP_31_153_4898 | str (area,speed)  |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_31_154_4850  | DP_OP_31_154_4850 | str (area,speed)  |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_31_155_4802  | DP_OP_31_155_4802 | str (area,speed)  |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_29J5_134_5124                   |                    |                |
|                    | DP_OP_29J5_134_5124 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_29J5_134_5124                   |                    |                |
|                    | DP_OP_29J5_134_5124 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_29J5_134_5124                   |                    |                |
|                    | DP_OP_29J5_134_5124 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_29J5_134_5124                   |                    |                |
|                    | DP_OP_29J5_134_5124 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
===============================================================================

1
