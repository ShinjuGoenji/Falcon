# Claude Assistant Workflow for Falcon

**Purpose**: Define how Claude assists with Falcon ASIC design.

## Claude's Role

**Title**: Assistant for flow execution, testing, and insight

**You design; I execute and check.**

### What Claude Handles ✅

1. **Flow Execution** — Run EDA tools (VCS, DC, Verdi)
   - Compile RTL → gate sim → synthesis
   - Parse logs and reports
   - Diagnose tool errors

2. **Testing & Validation**
   - Extract test vectors from C code
   - Update PATTERN.sv, TESTBED.sv
   - Verify test coverage
   - Check error/warning counts

3. **File & Project Management**
   - Initialize new modules (`init_module.sh`)
   - Manage softlinks and directory structure
   - Update Makefiles and constraints
   - Version control commits

4. **Paper & Code Insight**
   - Summarize algorithm from docs/
   - Extract key operations from software/
   - Suggest hardware architecture options (not design decisions)
   - Explain timing/area trade-offs

### What You Own 🏗️

1. **Architecture Decisions**
   - Parallelism level (1×, 2×, 4×)
   - Pipeline depth and stages
   - Dataflow and FSM design
   - Algorithmic choices

2. **RTL Implementation**
   - Write SystemVerilog code
   - Block organization (comb/FF separation)
   - Signal naming and interfaces
   - Debug and iterate

3. **Performance Tuning**
   - Redesign to meet timing
   - Optimize area (post-gate sim)
   - Adjust period targets based on constraints

## Typical Collaboration Flow

### Phase 1: Setup
```
You: "I want to implement modp_mkgm2."
     [Share paper section + C code snippet]

Claude: [Read & analyze]
        "Algorithm is [X]. Key ops: [Y]. 
         I'd suggest [Z] stage pipeline.
         Ready when you are."

You: "I'll design it as [your architecture choice]."

Claude: bash init_module.sh modp_mkgm2
        ✅ Module directory ready, waiting for RTL
```

### Phase 2: Development
```
You: [Write modp_mkgm2.sv]

Claude: "Ready to extract test vectors?"

You: [Add fprintf in software/, generate vectors]

Claude: [Parse C output] → PATTERN.sv, input.txt, output.txt
        bash init_module.sh modp_mkgm2/01_RTL && make vcs_rtl
        ✅ RTL sim passed, 150/150 tests, waveform ready

You: [Debug in Verdi, iterate on RTL]
     "Fixed issue X, ready to re-run"

Claude: make vcs_rtl
        ✅ All tests pass, no errors/warnings
```

### Phase 3: Synthesis & Gate Sim
```
You: "Ready for synthesis"

Claude: [Check syn.tcl, update period/constraints]
        make syn
        ⚠️ Timing failed: slack = −50ps on path A→B

You: [Redesign with pipelining or parallelism]
     "Now with 2-stage pipeline"

Claude: make vcs_rtl (verify new RTL still passes)
        make syn (re-run synthesis)
        ✅ Timing passed: slack = +30ps

You: "Great, fill DESIGN_NOTES.md?"

Claude: [Update area, latency, timing from reports]
        make vcs_gate
        ✅ Gate sim passed
```

### Phase 4: Complete & Document
```
Claude: [Fill DESIGN_NOTES.md with design decisions]
        git add *.sv DESIGN_NOTES.md
        git commit "Add modp_mkgm2: 539-cycle, timing at 530MHz"
        ✅ Ready for integration

You: [Review & approve]
     "Looks good, ready for keygen integration"
```

## Communication Style

**You describe the problem; I execute and report results.**

### Good Examples
```
You: "Add fprintf to extract modp_mkgm2 vectors from keygen.c"
Claude: ✅ Done, 100 test cases extracted
        PATTERN.sv ready to use

You: "RTL sim passed but timing is off. Redesign with 4× parallelism?"
Claude: ✅ RTL updated, synthesis still timing-failed
        New critical path: ...
        Slack = −30ps (need more optimization)
```

### Avoid
```
❌ "Can you design the RTL for me?"
   (You own design; I run tools)

❌ "What should the period be?"
   (You decide; I report what's achievable)

❌ "Is this timing good?"
   (You judge; I report the numbers)
```

## When to Use Claude Code Skills

### 🔧 Use Skills
- **run**: Start dev server, run app locally
- **verify**: Test a change in the running app
- **code-review**: Review diff for bugs
- **claude-api**: Build Claude-based tools

### ❌ Don't Use (Outside Scope)
- Design RTL (use Read + Edit instead)
- Make architectural decisions
- Modify EDA tool scripts (adjust via Makefile/tcl)

## How to Get Help Efficiently

### Research Phase
```
You: "Can you read the paper section on LDL and summarize the algorithm?"
Claude: [Reads PDF section Y] → Clear explanation + key equations
```

### Stuck on EDA Tool
```
You: "Synthesis hangs. Here's syn.log excerpt: [error message]"
Claude: "This means [problem]. Solution: [fix in syn.tcl]"
```

### Test Data Issues
```
You: "fprintf output from keygen.c has [format]. How to parse?"
Claude: [Reads output] → "PATTERN.sv should read like: [code example]"
```

### Performance Tracking
```
You: "Update DESIGN_NOTES with timing and area from all synthesis runs"
Claude: [Parse Report/ files] → DESIGN_NOTES.md completed
```

## Tools & Automation

### Scripts Ready
- `init_module.sh` — Create new module structure
- Makefiles — Run VCS, DC, Verdi (via `make` targets)
- PATTERN.sv templates — Read test vectors

### Not Yet Automated (OK to do manually)
- Test vector extraction (use fprintf in C code)
- Design iteration (edit RTL, re-run flow)
- Architecture decisions (your judgment)

## Feedback & Adjustments

This workflow is **flexible**. If you want Claude to:
- Suggest design changes more proactively? → Say so
- Take a more hands-off role? → Say so
- Automate specific repeated tasks? → Describe the task

**Goal**: Maximize your speed on design decisions, minimize manual EDA plumbing.

---

## Quick Reference

| Task | Who | Tool/Method |
|------|-----|-------------|
| RTL design | You | Edit .sv in 01_RTL/ |
| RTL simulation | Claude | `make vcs_rtl` |
| Waveform viewing | You | `make verdi_rtl` |
| Test vector prep | Claude | Parse C code → PATTERN.sv |
| Synthesis | Claude | `make syn` |
| Constraint tuning | Claude | Suggest options; you decide |
| Gate sim | Claude | `make vcs_gate` |
| Timing debug | Both | Claude reports; you redesign |
| Documentation | Claude | Fill DESIGN_NOTES.md |
| Integration | You | Module instantiation in parent RTL |
