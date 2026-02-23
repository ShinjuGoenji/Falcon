#======================================================
#
# Synopsys SpyGlass Scripts
#
#======================================================

#======================================================
# (A) Initialize Project
#======================================================
new_project spyglass_run -force

#======================================================
# (B) Set Read Options
#======================================================
set_option top MAKE_FG

set_option incdir {../01_RTL}
set_option enableSV yes
set_option enableSV09 yes
set_option language_mode mixed
set_option stop {RF_2p_CRT_4x512 RF_2p_CRT_2x1024 RF_2p_CRT_TMP}

#======================================================
#  (C) Read Design
#======================================================
read_file -type verilog ../00_TESTBED/Usertype.sv
read_file -type verilog ../00_TESTBED/INF.sv
read_file -type verilog ../01_RTL/MAKE_FG.sv

read_file -type verilog ../04_MEM/RF_2p_CRT_2x1024.v
read_file -type verilog ../04_MEM/RF_2p_CRT_TMP.v
read_file -type verilog ../04_MEM/RF_2p_CRT_4x512.v

read_file -type sgdc ./lint.sgdc

#======================================================
#  (D) Run Goal
#======================================================
current_goal lint/lint_rtl
run_goal

#======================================================
#  (E) Output Results
#======================================================
write_report moresimple > lint.rpt
save_project
