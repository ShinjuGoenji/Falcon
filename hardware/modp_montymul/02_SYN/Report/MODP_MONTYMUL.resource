 
****************************************
Report : resources
Design : MODP_MONTYMUL
Version: T-2022.03
Date   : Tue Apr 21 16:07:04 2026
****************************************


Resource Report for this hierarchy in file ../01_RTL/MODP_MONTYMUL.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| mult_x_1       | DW_mult_uns    | a_width=62 | mult_60 (MODP_MONTYMUL.sv:60) |
              |                | b_width=62 |                            |
| DP_OP_16J1_122_5909             |            |                            |
|                | DP_OP_16J1_122_5909 |       |                            |
=============================================================================

Datapath Report for DP_OP_16J1_122_5909
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_16J1_122_5909  | mult_58 (MODP_MONTYMUL.sv:58)                       |
|                      | mult_59 (MODP_MONTYMUL.sv:59)                       |
|                      | add_61 (MODP_MONTYMUL.sv:61)                        |
|                      | sub_65 (MODP_MONTYMUL.sv:65)                        |
|                      | sub_66 (MODP_MONTYMUL.sv:66)                        |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 62    |                                          |
| I2    | PI   | Unsigned | 62    |                                          |
| I3    | PI   | Unsigned | 62    |                                          |
| I4    | PI   | Unsigned | 124   |                                          |
| I5    | PI   | Unsigned | 17    |                                          |
| I6    | PI   | Unsigned | 62    |                                          |
| T0    | IFO  | Unsigned | 124   | I1 * I2 (MODP_MONTYMUL.sv:58)            |
| T8    | IFO  | Signed   | 62    | T0[61:0]                                 |
| T9    | IFO  | Signed   | 17    | O2[32:16]                                |
| T11   | IFO  | Unsigned | 63    | O2[124:62]                               |
| O1    | PO   | Unsigned | 62    | T8 * I3 (MODP_MONTYMUL.sv:59)            |
| O2    | PO   | Unsigned | 125   | T0 + I4 (MODP_MONTYMUL.sv:61)            |
| O3    | PO   | Signed   | 17    | T9 - I5 (MODP_MONTYMUL.sv:65)            |
| O4    | PO   | Signed   | 63    | T11 - I6 (MODP_MONTYMUL.sv:66)           |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'mult_59 (MODP_MONTYMUL.sv:59)' in design 'MODP_MONTYMUL' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'mult_60 (MODP_MONTYMUL.sv:60)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| mult_x_1           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix8              |
| DP_OP_16J1_122_5909                   |                    |                |
|                    | DP_OP_16J1_122_5909 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
===============================================================================

1
