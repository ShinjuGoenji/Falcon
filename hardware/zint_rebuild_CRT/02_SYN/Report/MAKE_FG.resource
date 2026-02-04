 
****************************************
Report : resources
Design : MAKE_FG
Version: T-2022.03
Date   : Wed Feb  4 01:02:12 2026
****************************************


Resource Report for this hierarchy in file ../01_RTL/MAKE_FG.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| ash_1          | DW_leftsh      | A_width=9  | sll_117 (MAKE_FG.sv:117)   |
|                |                | SH_width=4 |                            |
| add_x_2        | DW01_inc       | width=10   | add_143 (MAKE_FG.sv:143)   |
| ash_7          | DW_leftsh      | A_width=17 | sll_173 (MAKE_FG.sv:173)   |
|                |                | SH_width=4 |                            |
| gte_x_8        | DW_cmp         | width=17   | gte_173 (MAKE_FG.sv:173)   |
| add_x_10       | DW01_add       | width=10   | add_190 (MAKE_FG.sv:190)   |
| add_x_16       | DW01_inc       | width=12   | add_261 (MAKE_FG.sv:261)   |
| add_x_18       | DW01_add       | width=10   | add_267 (MAKE_FG.sv:267)   |
| DP_OP_46J4_122_9807             |            |                            |
|                | DP_OP_46J4_122_9807 |       |                            |
=============================================================================

Datapath Report for DP_OP_46J4_122_9807
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_46J4_122_9807  | mult_252 (MAKE_FG.sv:252) sub_252 (MAKE_FG.sv:252)  |
|                      | eq_252 (MAKE_FG.sv:252)                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 9     |                                          |
| I2    | PI   | Unsigned | 9     |                                          |
| I3    | PI   | Unsigned | 12    |                                          |
| T13   | IFO  | Unsigned | 18    | I1 * I2 (MAKE_FG.sv:252)                 |
| T14   | IFO  | Signed   | 19    | T13 - $unsigned(1'b1) (MAKE_FG.sv:252)   |
| T35   | IFO  | Signed   | 32    | T14                                      |
| O1    | PO   | Unsigned | 1     | I3 == $unsigned(T35) (MAKE_FG.sv:252)    |
==============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[3].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| DP_OP_20J7_122_5124             |            |                            |
|                | DP_OP_20J7_122_5124 |       |                            |
| DP_OP_21J7_123_5926             |            |                            |
|                | DP_OP_21J7_123_5926 |       |                            |
| DP_OP_22J7_124_3060             |            |                            |
|                | DP_OP_22J7_124_3060 |       |                            |
=============================================================================

Datapath Report for DP_OP_20J7_122_5124
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_20J7_122_5124  | mult_228 (MODP_MONTYMUL_TOP.sv:228)                 |
|                      | mult_229 (MODP_MONTYMUL_TOP.sv:229)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T10   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:228)       |
| O2    | PO   | Unsigned | 31    | T10 * I3 (MODP_MONTYMUL_TOP.sv:229)      |
==============================================================================

Datapath Report for DP_OP_21J7_123_5926
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_21J7_123_5926  | mult_230 (MODP_MONTYMUL_TOP.sv:230)                 |
|                      | add_233 (MODP_MONTYMUL_TOP.sv:233)                  |
|                      | sub_238 (MODP_MONTYMUL_TOP.sv:238)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 16    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 47    |                                          |
| I4    | PI   | Unsigned | 17    |                                          |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.sv:230)       |
| T13   | IFO  | Signed   | 17    | O1[32:16]                                |
| O1    | PO   | Unsigned | 47    | I3 + T2 (MODP_MONTYMUL_TOP.sv:233)       |
| O2    | PO   | Signed   | 17    | T13 - I4 (MODP_MONTYMUL_TOP.sv:238)      |
==============================================================================

Datapath Report for DP_OP_22J7_124_3060
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_22J7_124_3060  | mult_231 (MODP_MONTYMUL_TOP.sv:231)                 |
|                      | add_234 (MODP_MONTYMUL_TOP.sv:234)                  |
|                      | sub_239 (MODP_MONTYMUL_TOP.sv:239)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 62    |                                          |
| T3    | IFO  | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:231)       |
| T15   | IFO  | Unsigned | 32    | O1[62:31]                                |
| O1    | PO   | Unsigned | 63    | I3 + T3 (MODP_MONTYMUL_TOP.sv:234)       |
| O2    | PO   | Signed   | 32    | T15 - I2 (MODP_MONTYMUL_TOP.sv:239)      |
==============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[2].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| DP_OP_20J8_122_9220             |            |                            |
|                | DP_OP_20J8_122_9220 |       |                            |
| DP_OP_21J8_123_3171             |            |                            |
|                | DP_OP_21J8_123_3171 |       |                            |
| DP_OP_22J8_124_8931             |            |                            |
|                | DP_OP_22J8_124_8931 |       |                            |
=============================================================================

Datapath Report for DP_OP_20J8_122_9220
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_20J8_122_9220  | mult_228 (MODP_MONTYMUL_TOP.sv:228)                 |
|                      | mult_229 (MODP_MONTYMUL_TOP.sv:229)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T10   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:228)       |
| O2    | PO   | Unsigned | 31    | T10 * I3 (MODP_MONTYMUL_TOP.sv:229)      |
==============================================================================

Datapath Report for DP_OP_21J8_123_3171
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_21J8_123_3171  | mult_230 (MODP_MONTYMUL_TOP.sv:230)                 |
|                      | add_233 (MODP_MONTYMUL_TOP.sv:233)                  |
|                      | sub_238 (MODP_MONTYMUL_TOP.sv:238)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 16    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 47    |                                          |
| I4    | PI   | Unsigned | 17    |                                          |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.sv:230)       |
| T13   | IFO  | Signed   | 17    | O1[32:16]                                |
| O1    | PO   | Unsigned | 47    | I3 + T2 (MODP_MONTYMUL_TOP.sv:233)       |
| O2    | PO   | Signed   | 17    | T13 - I4 (MODP_MONTYMUL_TOP.sv:238)      |
==============================================================================

Datapath Report for DP_OP_22J8_124_8931
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_22J8_124_8931  | mult_231 (MODP_MONTYMUL_TOP.sv:231)                 |
|                      | add_234 (MODP_MONTYMUL_TOP.sv:234)                  |
|                      | sub_239 (MODP_MONTYMUL_TOP.sv:239)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 62    |                                          |
| T3    | IFO  | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:231)       |
| T15   | IFO  | Unsigned | 32    | O1[62:31]                                |
| O1    | PO   | Unsigned | 63    | I3 + T3 (MODP_MONTYMUL_TOP.sv:234)       |
| O2    | PO   | Signed   | 32    | T15 - I2 (MODP_MONTYMUL_TOP.sv:239)      |
==============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[1].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| DP_OP_20J7_125_6899             |            |                            |
|                | DP_OP_20J7_125_6899 |       |                            |
| DP_OP_21J7_126_9330             |            |                            |
|                | DP_OP_21J7_126_9330 |       |                            |
| DP_OP_22J7_127_1285             |            |                            |
|                | DP_OP_22J7_127_1285 |       |                            |
=============================================================================

Datapath Report for DP_OP_20J7_125_6899
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_20J7_125_6899  | mult_228 (MODP_MONTYMUL_TOP.sv:228)                 |
|                      | mult_229 (MODP_MONTYMUL_TOP.sv:229)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T10   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:228)       |
| O2    | PO   | Unsigned | 31    | T10 * I3 (MODP_MONTYMUL_TOP.sv:229)      |
==============================================================================

Datapath Report for DP_OP_21J7_126_9330
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_21J7_126_9330  | mult_230 (MODP_MONTYMUL_TOP.sv:230)                 |
|                      | add_233 (MODP_MONTYMUL_TOP.sv:233)                  |
|                      | sub_238 (MODP_MONTYMUL_TOP.sv:238)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 16    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 47    |                                          |
| I4    | PI   | Unsigned | 17    |                                          |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.sv:230)       |
| T13   | IFO  | Signed   | 17    | O1[32:16]                                |
| O1    | PO   | Unsigned | 47    | I3 + T2 (MODP_MONTYMUL_TOP.sv:233)       |
| O2    | PO   | Signed   | 17    | T13 - I4 (MODP_MONTYMUL_TOP.sv:238)      |
==============================================================================

Datapath Report for DP_OP_22J7_127_1285
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_22J7_127_1285  | mult_231 (MODP_MONTYMUL_TOP.sv:231)                 |
|                      | add_234 (MODP_MONTYMUL_TOP.sv:234)                  |
|                      | sub_239 (MODP_MONTYMUL_TOP.sv:239)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 62    |                                          |
| T3    | IFO  | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:231)       |
| T15   | IFO  | Unsigned | 32    | O1[62:31]                                |
| O1    | PO   | Unsigned | 63    | I3 + T3 (MODP_MONTYMUL_TOP.sv:234)       |
| O2    | PO   | Signed   | 32    | T15 - I2 (MODP_MONTYMUL_TOP.sv:239)      |
==============================================================================


Resource Report for Ungrouped Hierarchy
        u_MODP_MONTYMUL_TOP/genblk1[0].u_MODP_MONTYMUL in file
        ../01_RTL/MODP_MONTYMUL_TOP.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| DP_OP_20J8_125_3895             |            |                            |
|                | DP_OP_20J8_125_3895 |       |                            |
| DP_OP_21J8_126_6575             |            |                            |
|                | DP_OP_21J8_126_6575 |       |                            |
| DP_OP_22J8_127_4289             |            |                            |
|                | DP_OP_22J8_127_4289 |       |                            |
=============================================================================

Datapath Report for DP_OP_20J8_125_3895
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_20J8_125_3895  | mult_228 (MODP_MONTYMUL_TOP.sv:228)                 |
|                      | mult_229 (MODP_MONTYMUL_TOP.sv:229)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| T10   | IFO  | Signed   | 31    | O1[30:0]                                 |
| O1    | PO   | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:228)       |
| O2    | PO   | Unsigned | 31    | T10 * I3 (MODP_MONTYMUL_TOP.sv:229)      |
==============================================================================

Datapath Report for DP_OP_21J8_126_6575
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_21J8_126_6575  | mult_230 (MODP_MONTYMUL_TOP.sv:230)                 |
|                      | add_233 (MODP_MONTYMUL_TOP.sv:233)                  |
|                      | sub_238 (MODP_MONTYMUL_TOP.sv:238)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 16    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 47    |                                          |
| I4    | PI   | Unsigned | 17    |                                          |
| T2    | IFO  | Unsigned | 47    | I1 * I2 (MODP_MONTYMUL_TOP.sv:230)       |
| T13   | IFO  | Signed   | 17    | O1[32:16]                                |
| O1    | PO   | Unsigned | 47    | I3 + T2 (MODP_MONTYMUL_TOP.sv:233)       |
| O2    | PO   | Signed   | 17    | T13 - I4 (MODP_MONTYMUL_TOP.sv:238)      |
==============================================================================

Datapath Report for DP_OP_22J8_127_4289
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_22J8_127_4289  | mult_231 (MODP_MONTYMUL_TOP.sv:231)                 |
|                      | add_234 (MODP_MONTYMUL_TOP.sv:234)                  |
|                      | sub_239 (MODP_MONTYMUL_TOP.sv:239)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 62    |                                          |
| T3    | IFO  | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL_TOP.sv:231)       |
| T15   | IFO  | Unsigned | 32    | O1[62:31]                                |
| O1    | PO   | Unsigned | 63    | I3 + T3 (MODP_MONTYMUL_TOP.sv:234)       |
| O2    | PO   | Signed   | 32    | T15 - I2 (MODP_MONTYMUL_TOP.sv:239)      |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'gte_173 (MAKE_FG.sv:173)' in design 'MAKE_FG' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'sll_173 (MAKE_FG.sv:173)'.  (HDL-120)

Information: Operator associated with resources 'add_190 (MAKE_FG.sv:190)' in design 'MAKE_FG' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'sll_117 (MAKE_FG.sv:117)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| ash_1              | DW_leftsh        | astr (area)        |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| add_x_10           | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | apparch (area)     |                |
| add_x_18           | DW01_add         | pparch (area,speed)                 |
| DP_OP_46J4_122_9807                   |                    |                |
|                    | DP_OP_46J4_122_9807 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_20J7_122_5124                   |                    |                |
|                    | DP_OP_20J7_122_5124 | str (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_22J7_124_3060                   |                    |                |
|                    | DP_OP_22J7_124_3060 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| DP_OP_20J8_122_9220                   |                    |                |
|                    | DP_OP_20J8_122_9220 | str (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_22J8_124_8931                   |                    |                |
|                    | DP_OP_22J8_124_8931 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| DP_OP_20J7_125_6899                   |                    |                |
|                    | DP_OP_20J7_125_6899 | str (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_22J7_127_1285                   |                    |                |
|                    | DP_OP_22J7_127_1285 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
| DP_OP_20J8_125_3895                   |                    |                |
|                    | DP_OP_20J8_125_3895 | str (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_22J8_127_4289                   |                    |                |
|                    | DP_OP_22J8_127_4289 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
