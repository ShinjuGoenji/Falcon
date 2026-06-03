#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
# (A) Global Parameters
#======================================================
set DESIGN "FPC_TOP"
set CYCLE 1.2

# set INPUT_DLY [expr 0*$CYCLE]
set INPUT_DLY [expr 0.36]
set OUTPUT_DLY [expr 0*$CYCLE]

#======================================================
# (B) Read RTL Code
#======================================================
# (B-1) analyze + elaborate
set hdlin_auto_save_templates TRUE
analyze -f sverilog $DESIGN.sv
elaborate $DESIGN 

# (B-2) set current design
current_design $DESIGN
link

#======================================================
#  (C) Global Setting
#======================================================
set_svf -append Netlist/$DESIGN\_SYN.svf
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
check_design > Report/$DESIGN\.check
set_fix_multiple_port_nets -all -buffer_constants
###################################################################
# Adaptive retiming moves registers to improve worst negative slack
set_optimize_registers true -design *FPC_MUL*
# set_optimize_registers true -design *FPC_ADD*
# set_optimize_registers true -design *FPC_SUB*
set_dont_retime [get_cells {u_FPC_MUL/pipe_re_reg\[0\]*}] true
set_dont_retime [get_cells {u_FPC_MUL/pipe_im_reg\[0\]*}] true
# set_dont_retime [get_cells {u_FPC_ADD/pipe_re_reg\[0\]*}] true
# set_dont_retime [get_cells {u_FPC_ADD/pipe_im_reg\[0\]*}] true
# set_dont_retime [get_cells {u_FPC_SUB/pipe_re_reg\[0\]*}] true
# set_dont_retime [get_cells {u_FPC_SUB/pipe_im_reg\[0\]*}] true
###################################################################

# compile_ultra
compile_ultra -retime
set_fix_hold [all_clocks]
compile -incremental_mapping -only_hold_time

# uniquify
# compile

#======================================================
#  (F) Output Reports
#======================================================
report_design  >  Report/$DESIGN\.design
report_resource >  Report/$DESIGN\.resource
report_timing -max_paths 3 >  Report/$DESIGN\.timing
report_timing -delay_type min >  Report/$DESIGN\_hold.timing
report_area >  Report/$DESIGN\.area
report_area -hierarchy >  Report/$DESIGN\_hier.area
report_power > Report/$DESIGN\.power
report_clock > Report/$DESIGN\.clock
report_port >  Report/$DESIGN\.port
report_power >  Report/$DESIGN\.power

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
write -format verilog -output Netlist/$DESIGN\_SYN.v -hierarchy
write -format ddc     -hierarchy -output $DESIGN\_SYN.ddc
write_sdf -version 3.0 -context verilog -load_delay cell Netlist/$DESIGN\_SYN.sdf -significant_digits 6
write_sdc Netlist/$DESIGN\_SYN.sdc

#======================================================
#  (I) Finish and Quit
#======================================================
report_resource
report_area -hierarchy
report_timing -delay_type min
report_timing 
exit
