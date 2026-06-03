#!/usr/bin/env python3
"""
Generate BFU test vectors for RTL simulation.

FFT  mode (is_ifft=0): X = x + W*y,   Y = x - W*y
iFFT mode (is_ifft=1): X = x + y,     Y = (x - y) * W

Operands are bounded integers (|v| <= COEF_MAX), matching the FPC_MUL test
methodology. This guarantees every intermediate product/sum is EXACTLY
representable in the 52-bit mantissa, so:
  - no exponent underflow/overflow (the custom FP units have ieee_compliance=0
    and do NOT handle subnormals/overflow), and
  - the custom (truncating) FP units agree bit-for-bit with Python (rounding),
    because exact integer results need no rounding.
This is a STRUCTURAL test of the BFU datapath; FP-arithmetic correctness for
real-valued operands is covered by the FPC_MUL standalone module.

Bound check: |coef| <= 1024 -> product <= 2^20, complex re/im (sum of two
products) <= 2^21, butterfly add/sub <= 2^22, all < 2^52. Exact.
"""

import random

random.seed(42)

N_FFT  = 500
N_IFFT = 500
N_TOTAL = N_FFT + N_IFFT

COEF_MAX = 1024   # operand magnitude bound (keeps all intermediates exact)

OUT_INPUT  = "../00_TESTBED/input.txt"
OUT_OUTPUT = "../00_TESTBED/output.txt"
OUT_PATNUM = "../00_TESTBED/PATNUM.txt"


def rand_coef():
    """Random integer-valued double in [-COEF_MAX, COEF_MAX]."""
    return float(random.randint(-COEF_MAX, COEF_MAX))


def fft_butterfly(x, y, w):
    """FFT butterfly: X = x + W*y,  Y = x - W*y"""
    wy = w * y
    return x + wy, x - wy


def ifft_butterfly(x, y, w):
    """iFFT butterfly (DIF form): X = x + y,  Y = (x - y) * W"""
    s = x + y
    d = x - y
    return s, d * w


patterns_in  = []
patterns_out = []

for _ in range(N_FFT):
    x = complex(rand_coef(), rand_coef())
    y = complex(rand_coef(), rand_coef())
    w = complex(rand_coef(), rand_coef())
    X, Y = fft_butterfly(x, y, w)
    patterns_in.append((x, y, w, 0))
    patterns_out.append((X, Y))

for _ in range(N_IFFT):
    x = complex(rand_coef(), rand_coef())
    y = complex(rand_coef(), rand_coef())
    w = complex(rand_coef(), rand_coef())
    X, Y = ifft_butterfly(x, y, w)
    patterns_in.append((x, y, w, 1))
    patterns_out.append((X, Y))

# Shuffle so FFT and iFFT are interleaved
combined = list(zip(patterns_in, patterns_out))
random.shuffle(combined)
patterns_in, patterns_out = zip(*combined)

with open(OUT_INPUT, "w") as f:
    for (x, y, w, mode) in patterns_in:
        f.write(f"{x.real:e} {x.imag:e} "
                f"{y.real:e} {y.imag:e} "
                f"{w.real:e} {w.imag:e} "
                f"{mode}\n")

with open(OUT_OUTPUT, "w") as f:
    for (X, Y) in patterns_out:
        f.write(f"{X.real:e} {X.imag:e} "
                f"{Y.real:e} {Y.imag:e}\n")

with open(OUT_PATNUM, "w") as f:
    f.write(f"{N_TOTAL}\n")

print(f"Generated {N_TOTAL} patterns ({N_FFT} FFT + {N_IFFT} iFFT)")
print(f"  {OUT_INPUT}")
print(f"  {OUT_OUTPUT}")
print(f"  {OUT_PATNUM}")
