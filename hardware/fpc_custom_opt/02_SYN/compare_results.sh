#!/bin/bash

echo "================================"
echo "FPC Synthesis Results Comparison"
echo "================================"
echo

if [ ! -f Report/fpc_custom_opt.area ]; then
    echo "ERROR: Custom area report not found"
    exit 1
fi

if [ ! -f Report/fpc_dw.area ]; then
    echo "ERROR: DW area report not found"
    exit 1
fi

echo "=== AREA COMPARISON ==="
echo
echo "Custom Implementation:"
grep -E "^Total cell area|^Total|Combinational|Noncombinational" Report/fpc_custom_opt.area | tail -10
echo
echo "DesignWare Reference:"
grep -E "^Total cell area|^Total|Combinational|Noncombinational" Report/fpc_dw.area | tail -10
echo

if [ -f Report/fpc_custom_opt.timing ]; then
    echo "=== TIMING COMPARISON ==="
    echo
    echo "Custom Implementation (slack, ns):"
    grep "slack" Report/fpc_custom_opt.timing | head -5
    echo
fi

if [ -f Report/fpc_dw.timing ]; then
    echo "DesignWare Reference (slack, ns):"
    grep "slack" Report/fpc_dw.timing | head -5
    echo
fi

echo "=== POWER COMPARISON ==="
echo
if [ -f Report/fpc_custom_opt.power ]; then
    echo "Custom Implementation:"
    grep -E "Total|leakage|dynamic" Report/fpc_custom_opt.power | head -5
    echo
fi

if [ -f Report/fpc_dw.power ]; then
    echo "DesignWare Reference:"
    grep -E "Total|leakage|dynamic" Report/fpc_dw.power | head -5
fi
