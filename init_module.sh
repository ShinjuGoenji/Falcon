#!/bin/bash

#======================================================
# Module Initialization Script
# Usage: bash init_module.sh <MODULE_NAME>
#======================================================

set -e  # Exit on error

if [ -z "$1" ]; then
    echo "❌ Usage: bash init_module.sh <MODULE_NAME>"
    echo "   Example: bash init_module.sh modp_new_unit"
    exit 1
fi

MODULE_NAME=$1
TEMPLATE_PATH="hardware/template"
MODULE_PATH="hardware/${MODULE_NAME,,}"

# Check if module already exists
if [ -d "$MODULE_PATH" ]; then
    echo "❌ Module directory already exists: $MODULE_PATH"
    exit 1
fi

# Check if template exists
if [ ! -d "$TEMPLATE_PATH" ]; then
    echo "❌ Template directory not found: $TEMPLATE_PATH"
    exit 1
fi

echo "🔧 Initializing module: $MODULE_NAME"
echo ""

# Create module directory structure
echo "📁 Creating directory structure..."
mkdir -p "$MODULE_PATH"/{00_TESTBED,01_RTL,02_SYN,03_GATE,04_MEM,golden}

# Copy and customize files from template
echo "📋 Copying template files..."

# ========== 00_TESTBED ==========
cp "$TEMPLATE_PATH/00_TESTBED/makefile" "$MODULE_PATH/00_TESTBED/"
sed -i "s/MAKE_FG/${MODULE_NAME}/g" "$MODULE_PATH/00_TESTBED/makefile"

cp "$TEMPLATE_PATH/00_TESTBED/PATTERN.sv" "$MODULE_PATH/00_TESTBED/"
cp "$TEMPLATE_PATH/00_TESTBED/TESTBED.sv" "$MODULE_PATH/00_TESTBED/"
sed -i "s/MAKE_FG/${MODULE_NAME}/g" "$MODULE_PATH/00_TESTBED/TESTBED.sv"

# Create input/output files
touch "$MODULE_PATH/00_TESTBED/input.txt"
touch "$MODULE_PATH/00_TESTBED/output.txt"
touch "$MODULE_PATH/00_TESTBED/PATNUM.txt"

# Create filelist.f
cat > "$MODULE_PATH/00_TESTBED/filelist.f" << 'EOF'
TESTBED.sv
EOF

# ========== 01_RTL ==========
cp "$TEMPLATE_PATH/01_RTL/01_run_vcs_rtl" "$MODULE_PATH/01_RTL/"
cp "$TEMPLATE_PATH/01_RTL/04_verdi" "$MODULE_PATH/01_RTL/"
cp "$TEMPLATE_PATH/01_RTL/05_nWave" "$MODULE_PATH/01_RTL/"
cp "$TEMPLATE_PATH/01_RTL/09_clean_up" "$MODULE_PATH/01_RTL/"

# Create symlinks in 01_RTL
cd "$MODULE_PATH/01_RTL"
ln -sf ../00_TESTBED/filelist.f filelist.f
ln -sf ../00_TESTBED/PATTERN.sv PATTERN.sv
ln -sf ../00_TESTBED/TESTBED.sv TESTBED.sv
ln -sf ../00_TESTBED/makefile makefile
cd - > /dev/null

# Create placeholder RTL file
cat > "$MODULE_PATH/01_RTL/${MODULE_NAME}.sv" << 'EOF'
/*
 * TODO: Implement module logic
 */
module PLACEHOLDER (
  clk,
  rst_n,
  in_valid,
  out_valid
);

// Placeholder: replace with actual design

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                               clk;
input                               rst_n;
input                               in_valid;
output                              out_valid;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
// SUBMODULE #(.PARAM0(), .PARAM1() ) u_SUBMODULE(
//     .x(), 
//     .y(), 
//     .z());

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         out_valid <= 0;
//     end else begin
//         out_valid <= in_valid;
//     end
// end

endmodule
EOF
sed -i "s/PLACEHOLDER/${MODULE_NAME}/g" "$MODULE_PATH/01_RTL/${MODULE_NAME}.sv"

# ========== 02_SYN ==========
cp "$TEMPLATE_PATH/02_SYN/.synopsys_dc.setup" "$MODULE_PATH/02_SYN/"

# Create symlinks in 02_SYN
cd "$MODULE_PATH/02_SYN"
ln -sf ../00_TESTBED/makefile makefile
cd - > /dev/null

# Create syn.tcl from template
cp "$TEMPLATE_PATH/02_SYN/syn.tcl" "$MODULE_PATH/02_SYN/syn.tcl"
sed -i "s/MAKE_FG/${MODULE_NAME}/g" "$MODULE_PATH/02_SYN/syn.tcl"

# Create Netlist and Report directories
mkdir -p "$MODULE_PATH/02_SYN/Netlist"
mkdir -p "$MODULE_PATH/02_SYN/Report"

cp "$TEMPLATE_PATH/02_SYN/01_run_dc_shell" "$MODULE_PATH/02_SYN/"
cp "$TEMPLATE_PATH/02_SYN/08_check" "$MODULE_PATH/02_SYN/"
sed -i "s/MAKE_FG/${MODULE_NAME}/g" "$MODULE_PATH/02_SYN/08_check"
cp "$TEMPLATE_PATH/02_SYN/09_clean_up" "$MODULE_PATH/02_SYN/"

# ========== 03_GATE ==========
cp "$TEMPLATE_PATH/03_GATE/01_run_vcs_gate" "$MODULE_PATH/03_GATE/"
cp "$TEMPLATE_PATH/03_GATE/04_verdi" "$MODULE_PATH/03_GATE/"
cp "$TEMPLATE_PATH/03_GATE/05_nWave" "$MODULE_PATH/03_GATE/"
cp "$TEMPLATE_PATH/03_GATE/08_check" "$MODULE_PATH/03_GATE/"
cp "$TEMPLATE_PATH/03_GATE/09_clean_up" "$MODULE_PATH/03_GATE/"

# Create symlinks in 03_GATE
cd "$MODULE_PATH/03_GATE"
ln -sf ../00_TESTBED/filelist.f filelist.f
ln -sf ../00_TESTBED/PATTERN.sv PATTERN.sv
ln -sf ../00_TESTBED/TESTBED.sv TESTBED.sv
ln -sf ../00_TESTBED/makefile makefile
cd - > /dev/null

# ========== 04_MEM ==========
# Copy memory models (optional; link from template if needed)
# For now, just create empty directory—user can symlink or add custom models later
echo "# Memory compiler outputs go here" > "$MODULE_PATH/04_MEM/README.md"

# ========== golden/ ==========
echo "# Golden reference outputs from software" > "$MODULE_PATH/golden/README.md"

# ========== Create DESIGN_NOTES.md template ==========
cat > "$MODULE_PATH/DESIGN_NOTES.md" << 'EOF'
# MODULE_NAME Design Notes

## Overview
[Brief description of module purpose and functionality (1–3 sentences)]
Link to corresponding C code function: `software/file.c: Zf(function_name)`

## Design Decisions
- **Parallelism**: [description], controlled by parameter `PARALLELISM = X`
- **Pipeline**: [Y] stages, latency = [Z] cycles
- **Key optimization**: [e.g., "merged multiply-add to reduce latency"]
- Tradeoffs considered and rejected

## Performance Summary

| Metric | Value | Notes |
|--------|-------|-------|
| **Throughput** | X cycles/iteration | |
| **Latency** | Y cycles | Clock cycles from input valid to output valid |
| **Pipeline Stages** | Z | |
| **Area** | ~A mm² (gate) | From synthesis report |
| **Power** | ~B mW @ C MHz | From synthesis report |
| **Critical Path** | D ns | From timing report |

## Interface & Timing

| Signal | Direction | Bits | Timing | Notes |
|--------|-----------|------|--------|-------|
| `clk` | in | 1 | — | System clock |
| `rst_n` | in | 1 | async | Active-low reset |
| `in_valid` | in | 1 | combinational | Strobe |
| `out_valid` | out | 1 | registered | Latency [Z] cycles |

## Design Parameters

```systemverilog
parameter PARALLELISM = 4;
parameter LOGN = 9;
```

Performance vs. Parameters:
- [Table of synthesis results for key parameter combinations]

## Test Coverage
- [ ] Functional correctness (RTL sim vs. C reference)
- [ ] Timing closure at [frequency] MHz
- [ ] Gate-level simulation (vs. RTL golden)

## Known Issues & Limitations
- None currently.

## References
- Paper: doc/FalconSign (section X.Y.Z)
- C reference: software/file.c, function `Zf(...)` (lines X–Y)
EOF
sed -i "s/MODULE_NAME/${MODULE_NAME}/g" "$MODULE_PATH/DESIGN_NOTES.md"

# Make shell scripts executable
chmod +x "$MODULE_PATH"/{01_RTL,02_SYN,03_GATE}/*_run_* || true
chmod +x "$MODULE_PATH"/{01_RTL,02_SYN,03_GATE}/{0,}*_* || true

echo ""
echo "✅ Module '$MODULE_NAME' initialized successfully!"
echo ""
echo "📍 Module path: $MODULE_PATH"
echo ""
echo "🚀 Next steps:"
echo "   1. Add RTL design to: $MODULE_PATH/01_RTL/${MODULE_NAME}.sv"
echo "   2. Add test vectors to: $MODULE_PATH/00_TESTBED/input.txt and output.txt"
echo "   3. Update PATTERN.sv in: $MODULE_PATH/00_TESTBED/"
echo "   4. Run RTL simulation: cd $MODULE_PATH/01_RTL && make vcs_rtl"
echo "   5. Update DESIGN_NOTES.md: $MODULE_PATH/DESIGN_NOTES.md"
echo ""
echo "ℹ️  Remember to adjust parameters in Makefiles (period, word_num, etc.)"
echo ""
