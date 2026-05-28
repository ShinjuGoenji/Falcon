# TraceWeave MCP Server Setup

## Status: ✅ CONFIGURED & TESTED

### What is TraceWeave?
TraceWeave is an MCP (Model Context Protocol) server for debugging simulation failures through waveform analysis and log parsing. It works with FSDB and VCD formats.

### Installation & Configuration

**Location:** `/tmp/TraceWeave-main/`

**Dependencies (installed):**
- ✅ Python 3.11: `~/.local/miniconda3/envs/py311/bin/python3`
- ✅ mcp 1.27.1
- ✅ pyyaml 6.0.3
- ✅ Verdi 2022.06 @ `/usr/cad/synopsys/verdi/2022.06`

**FSDB Support:**
- ✅ libfsdb_wrapper.so compiled at `/tmp/TraceWeave-main/libfsdb_wrapper.so`
- ✅ Can read Verdi FSDB waveform files

### Verification

**Tested with FPC waveform:**
```
File: /home/daniel_kuo/Falcon/hardware/fpc_custom_opt/01_RTL/fpc_custom_opt.fsdb
Status: ✅ Successfully read and parsed
```

**Capabilities verified:**
- ✅ Signal search (found clk, a_re, c_re, rst, valid, etc.)
- ✅ Value-at-time queries (can read signal values at any timestamp)
- ✅ Transition detection
- ✅ Waveform window analysis

### MCP Configuration

**File:** `~/.claude/mcp_servers.json`

```json
{
  "traceweave": {
    "command": "/home/daniel_kuo/.local/miniconda3/envs/py311/bin/python3",
    "args": ["/tmp/TraceWeave-main/server.py"],
    "env": {
      "VERDI_HOME": "/usr/cad/synopsys/verdi/2022.06",
      "PYTHONPATH": "/tmp/TraceWeave-main"
    }
  }
}
```

### Usage

To enable TraceWeave in Claude Code:
1. The MCP config is already set up at `~/.claude/mcp_servers.json`
2. Restart Claude Code to load the new MCP server
3. Once loaded, TraceWeave will be available for waveform analysis queries

### Available Tools (via MCP)

Once connected, TraceWeave provides:
- `discover_sim_paths` — Auto-discover test logs, compile logs, waveforms
- `parse_sim_log` — Parse simulation logs, group failures, compute hints
- `search_signals` — Find signals by name/pattern in waveform
- `get_value_at_time` — Query signal value at specific timestamp
- `get_signals_around_time` — Get transitions around a time window
- `analyze_assertion_failures` — Root-cause analysis of test failures

### Example Usage

To debug FPC test failures:
1. Point TraceWeave to the test directory
2. It will auto-discover: vcs.log, fpc_custom_opt.fsdb, compile logs
3. Analyze failure patterns in logs
4. Cross-reference with waveform signal values
5. Get structured recommendations for root causes

### Performance Note

Analysis of 10K test vectors in FSDB typically completes in seconds.

---

**Set up date:** 2026-05-28
**Last verified:** TraceWeave server startup ✅
