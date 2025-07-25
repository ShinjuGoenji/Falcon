###################################################################

# Created by write_sdc on Thu Jul 17 23:30:47 2025

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_wire_load_mode top
set_wire_load_model -name Small -library                                       \
sc9_cln40g_base_rvt_ss_typical_max_0p81v_125c
set_load -pin_load 0.05 [get_ports s_valid]
set_load -pin_load 0.05 [get_ports {s[20]}]
set_load -pin_load 0.05 [get_ports {s[19]}]
set_load -pin_load 0.05 [get_ports {s[18]}]
set_load -pin_load 0.05 [get_ports {s[17]}]
set_load -pin_load 0.05 [get_ports {s[16]}]
set_load -pin_load 0.05 [get_ports {s[15]}]
set_load -pin_load 0.05 [get_ports {s[14]}]
set_load -pin_load 0.05 [get_ports {s[13]}]
set_load -pin_load 0.05 [get_ports {s[12]}]
set_load -pin_load 0.05 [get_ports {s[11]}]
set_load -pin_load 0.05 [get_ports {s[10]}]
set_load -pin_load 0.05 [get_ports {s[9]}]
set_load -pin_load 0.05 [get_ports {s[8]}]
set_load -pin_load 0.05 [get_ports {s[7]}]
set_load -pin_load 0.05 [get_ports {s[6]}]
set_load -pin_load 0.05 [get_ports {s[5]}]
set_load -pin_load 0.05 [get_ports {s[4]}]
set_load -pin_load 0.05 [get_ports {s[3]}]
set_load -pin_load 0.05 [get_ports {s[2]}]
set_load -pin_load 0.05 [get_ports {s[1]}]
set_load -pin_load 0.05 [get_ports {s[0]}]
set_max_capacitance 0.15 [get_ports clk]
set_max_capacitance 0.15 [get_ports rst_n]
set_max_capacitance 0.15 [get_ports ena]
set_max_capacitance 0.15 [get_ports f_valid]
set_max_capacitance 0.15 [get_ports {f[6]}]
set_max_capacitance 0.15 [get_ports {f[5]}]
set_max_capacitance 0.15 [get_ports {f[4]}]
set_max_capacitance 0.15 [get_ports {f[3]}]
set_max_capacitance 0.15 [get_ports {f[2]}]
set_max_capacitance 0.15 [get_ports {f[1]}]
set_max_capacitance 0.15 [get_ports {f[0]}]
set_max_fanout 10 [get_ports clk]
set_max_fanout 10 [get_ports rst_n]
set_max_fanout 10 [get_ports ena]
set_max_fanout 10 [get_ports f_valid]
set_max_fanout 10 [get_ports {f[6]}]
set_max_fanout 10 [get_ports {f[5]}]
set_max_fanout 10 [get_ports {f[4]}]
set_max_fanout 10 [get_ports {f[3]}]
set_max_fanout 10 [get_ports {f[2]}]
set_max_fanout 10 [get_ports {f[1]}]
set_max_fanout 10 [get_ports {f[0]}]
set_max_transition 3 [get_ports clk]
set_max_transition 3 [get_ports rst_n]
set_max_transition 3 [get_ports ena]
set_max_transition 3 [get_ports f_valid]
set_max_transition 3 [get_ports {f[6]}]
set_max_transition 3 [get_ports {f[5]}]
set_max_transition 3 [get_ports {f[4]}]
set_max_transition 3 [get_ports {f[3]}]
set_max_transition 3 [get_ports {f[2]}]
set_max_transition 3 [get_ports {f[1]}]
set_max_transition 3 [get_ports {f[0]}]
create_clock [get_ports clk]  -period 2  -waveform {0 1}
set_clock_uncertainty 0.1  [get_clocks clk]
set_clock_transition -max -rise 0.1 [get_clocks clk]
set_clock_transition -max -fall 0.1 [get_clocks clk]
set_clock_transition -min -rise 0.1 [get_clocks clk]
set_clock_transition -min -fall 0.1 [get_clocks clk]
set_input_delay -clock clk  0  [get_ports clk]
set_input_delay -clock clk  0  [get_ports rst_n]
set_input_delay -clock clk  -max 1  [get_ports ena]
set_input_delay -clock clk  -min 0  [get_ports ena]
set_input_delay -clock clk  -max 1  [get_ports f_valid]
set_input_delay -clock clk  -min 0  [get_ports f_valid]
set_input_delay -clock clk  -max 1  [get_ports {f[6]}]
set_input_delay -clock clk  -min 0  [get_ports {f[6]}]
set_input_delay -clock clk  -max 1  [get_ports {f[5]}]
set_input_delay -clock clk  -min 0  [get_ports {f[5]}]
set_input_delay -clock clk  -max 1  [get_ports {f[4]}]
set_input_delay -clock clk  -min 0  [get_ports {f[4]}]
set_input_delay -clock clk  -max 1  [get_ports {f[3]}]
set_input_delay -clock clk  -min 0  [get_ports {f[3]}]
set_input_delay -clock clk  -max 1  [get_ports {f[2]}]
set_input_delay -clock clk  -min 0  [get_ports {f[2]}]
set_input_delay -clock clk  -max 1  [get_ports {f[1]}]
set_input_delay -clock clk  -min 0  [get_ports {f[1]}]
set_input_delay -clock clk  -max 1  [get_ports {f[0]}]
set_input_delay -clock clk  -min 0  [get_ports {f[0]}]
set_output_delay -clock clk  -max 1  [get_ports s_valid]
set_output_delay -clock clk  -min 0  [get_ports s_valid]
set_output_delay -clock clk  -max 1  [get_ports {s[20]}]
set_output_delay -clock clk  -min 0  [get_ports {s[20]}]
set_output_delay -clock clk  -max 1  [get_ports {s[19]}]
set_output_delay -clock clk  -min 0  [get_ports {s[19]}]
set_output_delay -clock clk  -max 1  [get_ports {s[18]}]
set_output_delay -clock clk  -min 0  [get_ports {s[18]}]
set_output_delay -clock clk  -max 1  [get_ports {s[17]}]
set_output_delay -clock clk  -min 0  [get_ports {s[17]}]
set_output_delay -clock clk  -max 1  [get_ports {s[16]}]
set_output_delay -clock clk  -min 0  [get_ports {s[16]}]
set_output_delay -clock clk  -max 1  [get_ports {s[15]}]
set_output_delay -clock clk  -min 0  [get_ports {s[15]}]
set_output_delay -clock clk  -max 1  [get_ports {s[14]}]
set_output_delay -clock clk  -min 0  [get_ports {s[14]}]
set_output_delay -clock clk  -max 1  [get_ports {s[13]}]
set_output_delay -clock clk  -min 0  [get_ports {s[13]}]
set_output_delay -clock clk  -max 1  [get_ports {s[12]}]
set_output_delay -clock clk  -min 0  [get_ports {s[12]}]
set_output_delay -clock clk  -max 1  [get_ports {s[11]}]
set_output_delay -clock clk  -min 0  [get_ports {s[11]}]
set_output_delay -clock clk  -max 1  [get_ports {s[10]}]
set_output_delay -clock clk  -min 0  [get_ports {s[10]}]
set_output_delay -clock clk  -max 1  [get_ports {s[9]}]
set_output_delay -clock clk  -min 0  [get_ports {s[9]}]
set_output_delay -clock clk  -max 1  [get_ports {s[8]}]
set_output_delay -clock clk  -min 0  [get_ports {s[8]}]
set_output_delay -clock clk  -max 1  [get_ports {s[7]}]
set_output_delay -clock clk  -min 0  [get_ports {s[7]}]
set_output_delay -clock clk  -max 1  [get_ports {s[6]}]
set_output_delay -clock clk  -min 0  [get_ports {s[6]}]
set_output_delay -clock clk  -max 1  [get_ports {s[5]}]
set_output_delay -clock clk  -min 0  [get_ports {s[5]}]
set_output_delay -clock clk  -max 1  [get_ports {s[4]}]
set_output_delay -clock clk  -min 0  [get_ports {s[4]}]
set_output_delay -clock clk  -max 1  [get_ports {s[3]}]
set_output_delay -clock clk  -min 0  [get_ports {s[3]}]
set_output_delay -clock clk  -max 1  [get_ports {s[2]}]
set_output_delay -clock clk  -min 0  [get_ports {s[2]}]
set_output_delay -clock clk  -max 1  [get_ports {s[1]}]
set_output_delay -clock clk  -min 0  [get_ports {s[1]}]
set_output_delay -clock clk  -max 1  [get_ports {s[0]}]
set_output_delay -clock clk  -min 0  [get_ports {s[0]}]
set_input_transition -max 0.5  [get_ports clk]
set_input_transition -min 0.5  [get_ports clk]
set_input_transition -max 0.5  [get_ports rst_n]
set_input_transition -min 0.5  [get_ports rst_n]
set_input_transition -max 0.5  [get_ports ena]
set_input_transition -min 0.5  [get_ports ena]
set_input_transition -max 0.5  [get_ports f_valid]
set_input_transition -min 0.5  [get_ports f_valid]
set_input_transition -max 0.5  [get_ports {f[6]}]
set_input_transition -min 0.5  [get_ports {f[6]}]
set_input_transition -max 0.5  [get_ports {f[5]}]
set_input_transition -min 0.5  [get_ports {f[5]}]
set_input_transition -max 0.5  [get_ports {f[4]}]
set_input_transition -min 0.5  [get_ports {f[4]}]
set_input_transition -max 0.5  [get_ports {f[3]}]
set_input_transition -min 0.5  [get_ports {f[3]}]
set_input_transition -max 0.5  [get_ports {f[2]}]
set_input_transition -min 0.5  [get_ports {f[2]}]
set_input_transition -max 0.5  [get_ports {f[1]}]
set_input_transition -min 0.5  [get_ports {f[1]}]
set_input_transition -max 0.5  [get_ports {f[0]}]
set_input_transition -min 0.5  [get_ports {f[0]}]
