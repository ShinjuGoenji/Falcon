 
****************************************
Report : resources
Design : MODP_MONTYMUL
Version: T-2022.03
Date   : Thu Oct 23 11:02:08 2025
****************************************


Resource Report for this hierarchy in file ../01_RTL/MODP_MONTYMUL.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| mult_x_1       | DW_mult_uns    | a_width=31 | mult_64 (MODP_MONTYMUL.v:64) |
               |                | b_width=31 |                            |
| gte_x_2        | DW_cmp         | width=32   | gte_79 (MODP_MONTYMUL.v:79) |
| DP_OP_25_125_8177               |            |                            |
|                | DP_OP_25_125_8177 |         |                            |
=============================================================================

Datapath Report for DP_OP_25_125_8177
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_25_125_8177    | mult_61 (MODP_MONTYMUL.v:61)                        |
|                      | mult_62 (MODP_MONTYMUL.v:62)                        |
|                      | add_68 (MODP_MONTYMUL.v:68)                         |
|                      | mult_63 (MODP_MONTYMUL.v:63)                        |
|                      | sub_80 (MODP_MONTYMUL.v:80)                         |
|                      | add_69 (MODP_MONTYMUL.v:69)                         |
|                      | gte_85 (MODP_MONTYMUL.v:85)                         |
|                      | sub_86 (MODP_MONTYMUL.v:86)                         |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 31    |                                          |
| I2    | PI   | Unsigned | 31    |                                          |
| I3    | PI   | Unsigned | 31    |                                          |
| I4    | PI   | Unsigned | 16    |                                          |
| I5    | PI   | Unsigned | 31    |                                          |
| I6    | PI   | Unsigned | 62    |                                          |
| T0    | IFO  | Unsigned | 62    | I1 * I2 (MODP_MONTYMUL.v:61)             |
| T12   | IFO  | Signed   | 31    | T0[30:0]                                 |
| T14   | IFO  | Signed   | 48    | T0[47:0]                                 |
| T2    | IFO  | Unsigned | 47    | I4 * I5 (MODP_MONTYMUL.v:63)             |
| T17   | IFO  | Signed   | 31    | O2[46:16]                                |
| T15   | IFO  | Unsigned | 32    | O4[62:31]                                |
| T18   | IFO  | Signed   | 31    | O4[61:31]                                |
| O1    | PO   | Unsigned | 31    | T12 * I3 (MODP_MONTYMUL.v:62)            |
| O2    | PO   | Unsigned | 48    | T14 + T2 (MODP_MONTYMUL.v:68)            |
| O3    | PO   | Signed   | 31    | T17 - I5 (MODP_MONTYMUL.v:80)            |
| O4    | PO   | Unsigned | 63    | T0 + I6 (MODP_MONTYMUL.v:69)             |
| O5    | PO   | Unsigned | 1     | T15 >= I5 (MODP_MONTYMUL.v:85)           |
| O6    | PO   | Signed   | 31    | T18 - I5 (MODP_MONTYMUL.v:86)            |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'mult_62 (MODP_MONTYMUL.v:62)' in design 'MODP_MONTYMUL' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'mult_64 (MODP_MONTYMUL.v:64)'.  (HDL-120)

Information: Operator associated with resources 'gte_79 (MODP_MONTYMUL.v:79)' in design 'MODP_MONTYMUL' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'add_68 (MODP_MONTYMUL.v:68)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| mult_x_1           | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| gte_x_2            | DW_cmp           | pparch (area,speed)                 |
| DP_OP_25_125_8177  | DP_OP_25_125_8177 | str (speed)       |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix8              |
===============================================================================

1
