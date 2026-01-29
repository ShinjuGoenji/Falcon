 
****************************************
Report : resources
Design : MAKE_FG
Version: T-2022.03
Date   : Thu Jan 29 18:21:29 2026
****************************************


Resource Report for this hierarchy in file ../01_RTL/MAKE_FG.sv
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| ash_1          | DW_leftsh      | A_width=9  | sll_116 (MAKE_FG.sv:116)   |
|                |                | SH_width=4 |                            |
| add_x_2        | DW01_inc       | width=10   | add_142 (MAKE_FG.sv:142)   |
| add_x_7        | DW01_add       | width=10   | add_184 (MAKE_FG.sv:184)   |
| add_x_13       | DW01_inc       | width=12   | add_255 (MAKE_FG.sv:255)   |
| add_x_15       | DW01_add       | width=10   | add_261 (MAKE_FG.sv:261)   |
| DP_OP_41J4_122_9807             |            |                            |
|                | DP_OP_41J4_122_9807 |       |                            |
=============================================================================

Datapath Report for DP_OP_41J4_122_9807
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_41J4_122_9807  | mult_246 (MAKE_FG.sv:246) sub_246 (MAKE_FG.sv:246)  |
|                      | eq_246 (MAKE_FG.sv:246)                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 9     |                                          |
| I2    | PI   | Unsigned | 9     |                                          |
| I3    | PI   | Unsigned | 12    |                                          |
| T10   | IFO  | Unsigned | 18    | I1 * I2 (MAKE_FG.sv:246)                 |
| T11   | IFO  | Signed   | 19    | T10 - $unsigned(1'b1) (MAKE_FG.sv:246)   |
| T30   | IFO  | Signed   | 32    | T11                                      |
| O1    | PO   | Unsigned | 1     | I3 == $unsigned(T30) (MAKE_FG.sv:246)    |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'add_184 (MAKE_FG.sv:184)' in design 'MAKE_FG' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'sll_116 (MAKE_FG.sv:116)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| ash_1              | DW_leftsh        | astr (area)        |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| add_x_7            | DW01_add         | apparch (area)     |                |
| add_x_13           | DW01_inc         | apparch (area)     |                |
| add_x_15           | DW01_add         | apparch (area)     |                |
| DP_OP_41J4_122_9807                   |                    |                |
|                    | DP_OP_41J4_122_9807 | str (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
===============================================================================

1
