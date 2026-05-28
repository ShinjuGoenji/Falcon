# FPC Custom Implementation Debug Task

## 📋 Executive Summary

**Goal:** Fix the custom IEEE-754 FPC implementation to pass all 10,000 test cases (currently 0/10000 passing).

**Status:** Problem identified and isolated. DesignWare reference version verified working (10000/10000 ✅).

**Estimated effort:** 2-4 hours (implementation + iteration)

---

## 🎯 Current State

### Test Results

| Implementation | Tests | Status | Notes |
|---|---|---|---|
| **DW (DesignWare IP)** | 10000/10000 | ✅ ALL PASS | Reference implementation — correct |
| **Custom (IEEE-754)** | 0/10000 | ❌ ALL FAIL | Real part wrong, imaginary part correct |

### Problem Signature

```
Test 1: a=461+486j, b=197+228j
Expected: (-19991 + 200850j)
Got:      ( 75531.5 + 200850j)  ← Real part WRONG, imaginary part CORRECT

Test 2-5: Similar pattern (virtual component correct, real component incorrect)
```

### Root Cause Analysis

Since **imaginary part is correct** but **real part is wrong**, the bug is isolated to the real-number computation path in `FPC_MUL`:

- ✅ `fpr_mul` (scalar multiplication) appears to work — imaginary uses its outputs successfully
- ✅ `fpr_add` (scalar addition) appears to work — imaginary path (add two products) is correct
- ❌ Real path computation: `fpr_add(prod_re_re_r, prod_im_im_neg)` producing wrong results
  - Either: `prod_im_im_neg` (sign flip) has a bug
  - Or: Timing/pipeline issue causing real path to read wrong data
  - Or: Subtle IEEE-754 rounding/truncation error in real path

---

## 📁 Key Files & Structure

```
hardware/fpc_custom_opt/
├── 00_TESTBED/
│   ├── PATTERN.sv              ← Test harness (reads input.txt, output.txt, drives FPC)
│   ├── TESTBED.sv              ← Top module (instantiates FPC_TOP and PATTERN)
│   ├── input.txt               ← 10K test vectors (a_re, a_im, b_re, b_im, opcode)
│   ├── output.txt              ← 10K expected outputs (c_re, c_im)
│   ├── filelist.f              ← File list for VCS compilation
│   └── makefile                ← Simulation targets
├── 01_RTL/
│   ├── fpc_custom_opt.sv       ← Main RTL: FPC_ADD, FPC_SUB, FPC_MUL, fpr_add, fpr_mul, FPC_TOP
│   ├── fpc_dw.v                ← Reference DW version (already verified working)
│   └── makefile                ← Simulation & synthesis targets
└── DESIGN_NOTES.md             ← Design documentation (to be filled)
```

---

## 🔧 Available Tools

### 1. VCS Simulation (Primary)
```bash
cd hardware/fpc_custom_opt/01_RTL
make vcs_rtl              # Compile + run RTL simulation
make clean                # Clean build artifacts
```

**Output:**
- `vcs.log` — compilation log
- `fpc_custom_opt.fsdb` — waveform file (FSDB format)
- `simv` — executable
- Console output shows test results

**Current output example:**
```
Test 1: op=2, a_re=4.610000e+02 a_im=4.860000e+02, b_re=1.970000e+02 b_im=2.280000e+02
  Expected: (-1.999100e+04, 2.008500e+05)
  Got: (7.553150e+04, 2.008500e+05)
FAIL [1]
```

### 2. TraceWeave (Waveform Analysis MCP)
```bash
# Already configured and tested
# Can search signals and query values at any timestamp
```

**Example queries (via MCP):**
- `search_signals("a_re")` — find all signals matching pattern
- `get_value_at_time("TESTBED.a_re", time_ps)` — read signal value at timestamp
- `get_signals_around_time("TESTBED.prod_re_re_r", time_ps)` — see transitions around time

**Setup:** Already done
- TraceWeave @ `/tmp/TraceWeave-main/`
- FSDB wrapper compiled ✅
- MCP config @ `~/.claude/mcp_servers.json`

### 3. Reference Implementation (DW Version)
```bash
# Temporarily switch TESTBED to use DW instead of custom
# File: hardware/fpc_custom_opt/00_TESTBED/TESTBED.sv line 4
# Change: `#include "fpc_custom_opt.sv"`  →  `#include "fpc_dw.v"`
```

Use this to verify test vectors are correct and understand expected behavior.

---

## 🔍 Debugging Strategy

### Phase 1: Isolate the Bug (30 min)

1. **Check if it's a data-flow issue:**
   - In `FPC_MUL` line 85: `prod_im_im_neg = {~prod_im_im_r[63], prod_im_im_r[62:0]}`
   - Verify the sign-flip logic is correct (flip MSB, keep other 63 bits)
   - Check if `prod_im_im_r` actually has the right value

2. **Check if it's a pipeline issue:**
   - PATTERN waits 2 cycles for MUL result
   - But what if real path is reading from a different cycle than imaginary?
   - Use TraceWeave to check `prod_re_re_r` and `prod_im_im_r` values at each cycle

3. **Check IEEE-754 truncation:**
   - In `fpr_add` line 118: `wire [10:0] exp_diff_raw = ...`
   - In `fpr_add` line 133: `wire [51:0] final_frac = mant_result[52:1]`
   - Verify rounding/truncation is consistent

### Phase 2: Fix & Validate (1 hour)

1. Once bug is found, make minimal fix
2. Run simulation: `make vcs_rtl`
3. Check output for first 5 tests to see if fix helped
4. Iterate until all 10000 pass

### Phase 3: Documentation (30 min)

1. Update `DESIGN_NOTES.md` with:
   - What was wrong
   - How it was fixed
   - Why that fix works
   - Any trade-offs made

---

## 📊 Success Criteria

**Test passes when:**
```
=== FPC Test Results ===
Total tests:       10000
Passed:            10000
Failed:                0
✅ All tests PASSED!
```

**Acceptable tolerance for floating-point errors:**
- Relative error < 1e-9 (current tolerance in PATTERN.sv line 31)
- If needed, can be relaxed to 1e-8 (but try to keep it tight)

---

## 🗂️ File Reference

### RTL Files (in `01_RTL/fpc_custom_opt.sv`)

- **FPC_ADD** (lines 4-19): Complex addition (combinational)
  - Uses two `fpr_add` instances for real and imaginary parts
  - No issues detected

- **FPC_SUB** (lines 24-39): Complex subtraction (combinational)
  - Sign-flips imaginary component, then adds
  - No issues detected

- **FPC_MUL** (lines 44-100): Complex multiplication (2-stage pipeline)
  - Stage 1: 4 fpr_mul operations (a_re×b_re, a_im×b_im, a_re×b_im, a_im×b_re)
  - Registered in: prod_*_r
  - Stage 2: Real = prod_re_re_r - prod_im_im_r; Imag = prod_re_im_r + prod_im_re_r
  - **⚠️ Real path bug likely here**

- **fpr_add** (lines 105-142): IEEE-754 64-bit floating-point adder
  - Exponent alignment
  - Mantissa addition/subtraction
  - Normalization
  - Truncate rounding (bit 0 discarded)

- **fpr_mul** (lines 143-164): IEEE-754 64-bit floating-point multiplier
  - Mantissa multiplication (53×53 → 106 bits)
  - Exponent calculation
  - Result truncation

- **FPC_TOP** (lines 169-205): Multiplexer wrapper
  - Selects ADD/SUB/MUL based on `op` signal
  - Handles latency for MUL (mult_valid signal)

### Testbench Files (in `00_TESTBED/`)

- **PATTERN.sv** (lines 3-138): Test harness
  - Reads test vectors from input.txt and output.txt
  - Applies them to FPC
  - Compares outputs with tolerance (1e-9)
  - Reports pass/fail counts

- **TESTBED.sv**: Top-level module
  - Clock and reset generation
  - Waveform dumping
  - FPC_TOP and PATTERN instantiation

- **input.txt / output.txt**: Test vectors
  - Format: 10K lines, each with (a_re, a_im, b_re, b_im, opcode) and (c_re, c_im)
  - All test cases are MUL (opcode=2)

---

## ⏱️ Typical Workflow

```bash
# 1. Edit RTL
vim hardware/fpc_custom_opt/01_RTL/fpc_custom_opt.sv

# 2. Compile and run
cd hardware/fpc_custom_opt/01_RTL
make vcs_rtl

# 3. Check output
# Look at first 5 test results in console output
# If still failing, use TraceWeave to inspect waveform

# 4. Iterate until all tests pass
# Then commit
git add -A
git commit -m "Fix: FPC real-part computation in fpr_mul/fpr_add"
```

---

## 📝 Important Notes

1. **DW version is the reference:**
   - All 10,000 tests pass with DW IP
   - Test vectors themselves are correct
   - Custom implementation has the bug, not the tests

2. **Imaginary path works:**
   - This means fpr_mul and fpr_add are fundamentally sound
   - The bug is likely in real-specific logic (sign flip, input order, etc.)

3. **Use TraceWeave for deep debugging:**
   - If local analysis doesn't find the bug
   - Query prod_re_re_r, prod_im_im_r, prod_im_im_neg values at key cycles
   - Verify they match expectations from manual calculation

4. **Makefile change for lib extensions:**
   - Already fixed: `+libext+.v+.sv` (supports both .v and .sv files for DW library)

---

## 🎓 Learning Resources

- **WORKFLOW.md** — Project collaboration model
- **ENVIRONMENT.md** — Tool setup and common commands
- **CLAUDE.md** — Project goals and architecture
- **hardware/fft/01_RTL/FPC.v** — Working DW reference (for comparison)

---

## Summary for Opus

**What to do:**
1. Identify why real part of FPC_MUL is wrong (imaginary is correct)
2. Make a targeted fix
3. Verify all 10,000 tests pass
4. Document what was wrong and how it was fixed

**Tools available:**
- VCS simulation (primary debug tool)
- TraceWeave for waveform analysis
- DW reference implementation for comparison

**Success metric:**
- 10000/10000 tests passing (currently 0/10000)

**Time estimate:**
- 2-4 hours total

---

**Prepared:** 2026-05-28 by Haiku 4.5
**Status:** Ready for Opus to take over
