#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
# DW Reference Version
#
#======================================================

#======================================================
# (A) Global Parameters
#======================================================
set DESIGN "FPC_TOP"
if {[info exists WN]} {
    set WORD_NUM $WN
} else {
    set WORD_NUM 4
}

if {[info exists PERIOD]} {
    set CYCLE $PERIOD
} else {
    set CYCLE 2
}

set INPUT_DLY [expr 0*$CYCLE]
set OUTPUT_DLY [expr 0*$CYCLE]

#======================================================
# (B) Read RTL Code
#======================================================
# (B-1) analyze + elaborate
set hdlin_auto_save_templates TRUE
analyze -f sverilog ../01_RTL/fpc_dw.v
elaborate $DESIGN

# (B-2) set current design
current_design $DESIGN
link

#======================================================
#  (C) Global Setting
#======================================================
set_wire_load_mode top

#======================================================
#  (D) Set Design Constraints
#======================================================

# (D-1) Setting Clock Constraints
create_clock -name clk -period $CYCLE [get_ports clk]
set_dont_touch_network             [get_clocks clk]

# (D-2) Setting in/out Constraints
set_input_delay   -max  $INPUT_DLY  -clock clk   [all_inputs] ;  # set_up time check
set_input_delay   -min  0           -clock clk   [all_inputs] ;  # hold   time check
set_output_delay  -max  $OUTPUT_DLY -clock clk   [all_outputs] ; # set_up time check
set_output_delay  -min  0           -clock clk   [all_outputs] ; # hold   time check
set_input_delay 0 -clock clk clk
set_input_delay 0 -clock clk rst_n

# (D-3) Setting Design Environment
set_load 0.05 [all_outputs]

# (D-4) Report Clock skew
report_clock -skew clk
check_timing

#======================================================
#  (E) Optimization
#======================================================
check_design > Report/fpc_dw\.check
set_fix_multiple_port_nets -all -buffer_constants
compile_ultra
set_fix_hold [all_clocks]
compile -incremental_mapping -only_hold_time

# # uniquify
# # compile

#======================================================
#  (F) Output Reports
#======================================================
report_design  >  Report/fpc_dw\.design
report_resource >  Report/fpc_dw\.resource
report_timing -max_paths 3 >  Report/fpc_dw\.timing
report_timing -delay_type min >  Report/fpc_dw\_hold.timing
report_area >  Report/fpc_dw\.area
report_area -hierarchy >  Report/fpc_dw\_hier.area
report_power > Report/fpc_dw\.power
report_clock > Report/fpc_dw\.clock
report_port >  Report/fpc_dw\.port
report_power > Report/fpc_dw\.power

#======================================================
#  (G) Change Naming Rule
#======================================================
set bus_inference_style "%s\[%d\]"
set bus_naming_style "%s\[%d\]"
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed "a-z A-Z 0-9 _" -max_length 255 -type cell
define_name_rules name_rule -allowed "a-z A-Z 0-9 _[]" -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
define_name_rules name_rule -case_insensitive
change_names -hierarchy -rules name_rule


#======================================================
#  (H) Output Results
#======================================================
set verilogout_higher_designs_first true
write -format verilog -output Netlist/fpc_dw_SYN.v -hierarchy
write -format ddc     -hierarchy -output fpc_dw_SYN.ddc
write_sdf -version 3.0 -context verilog -load_delay cell Netlist/fpc_dw_SYN.sdf -significant_digits 6
write_sdc Netlist/fpc_dw_SYN.sdc

#======================================================
#  (I) Finish and Quit
#======================================================
report_resource
report_area -hierarchy
report_timing -delay_type min
report_timing
exit
