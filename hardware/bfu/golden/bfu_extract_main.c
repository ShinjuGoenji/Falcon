/*
 * bfu_extract_main.c — C-model extraction harness for the BFU.
 *
 * Initializes random polynomials and runs the (instrumented) reference
 * Zf(FFT) / Zf(iFFT) / Zf(poly_split_fft) / Zf(poly_merge_fft). The
 * instrumentation in software/fft.c dumps every butterfly's operands
 * (x, y, W) and results (X, Y) as raw 64-bit hex, tagged with the BFU mode
 * (0 = FFT/Merge, 1 = iFFT, 2 = Split).
 *
 * Build (run from hardware/bfu/golden/):
 *   gcc -O2 -std=gnu99 -I../../../software \
 *       -DFALCON_FPNATIVE=1 -DFALCON_FPEMU=0 -DFALCON_AVX2=0 \
 *       -DBFU_TRUNC -DBFU_EXTRACT \
 *       -o bfu_extract bfu_extract_main.c \
 *       ../../../software/fft.c ../../../software/fpr.c
 *
 * BFU_TRUNC  : route fpr_add/sub/mul through the truncating emulation that
 *              bit-matches the Verilog FP units (hardware/bfu, FPC.sv).
 * BFU_EXTRACT: enable the fprintf dumps in the non-AVX butterfly loops.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "inner.h"

/* Defined here, referenced by the instrumentation in fft.c */
FILE *bfu_fin  = NULL;
FILE *bfu_fout = NULL;
long  bfu_cnt  = 0;

/* Random IEEE-754 double in [-range, +range], a normal value (no subnormal) */
static fpr rnd_fpr(double range)
{
	return FPR(((double)rand() / RAND_MAX * 2.0 - 1.0) * range);
}

static uint64_t d2u(fpr x) { union { double f; uint64_t i; } u; u.f = x.v; return u.i; }

/*
 * Log one VECTOR-mode BFU operation (FMS / Vector ADD). Same hex layout as the
 * butterfly dumps in fft.c: 6 input words + mode, then 4 output words. Vector
 * ops have a single meaningful result (X); the Y slots are filled with X and
 * are ignored by the testbench for these modes.
 */
static void log_vec(int mode,
                    fpr xr, fpr xi, fpr yr, fpr yi, fpr wr, fpr wi,
                    fpr Xr, fpr Xi)
{
	fprintf(bfu_fin, "%016llx %016llx %016llx %016llx %016llx %016llx %d\n",
	        (unsigned long long)d2u(xr), (unsigned long long)d2u(xi),
	        (unsigned long long)d2u(yr), (unsigned long long)d2u(yi),
	        (unsigned long long)d2u(wr), (unsigned long long)d2u(wi), mode);
	fprintf(bfu_fout, "%016llx %016llx %016llx %016llx\n",
	        (unsigned long long)d2u(Xr), (unsigned long long)d2u(Xi),
	        (unsigned long long)d2u(Xr), (unsigned long long)d2u(Xi));
	bfu_cnt++;
}

int main(void)
{
	unsigned logn  = 9;            /* n = 512 */
	int      npoly = 2;            /* polynomials per operation */
	size_t   n     = (size_t)1 << logn;
	size_t   hn    = n >> 1;
	fpr     *f     = malloc(n * sizeof *f);
	fpr     *f0    = malloc(n * sizeof *f0);
	fpr     *f1    = malloc(n * sizeof *f1);
	/* Buffers for the ffSampling Phase-2/Phase-3 vector ops (sign.c ~L396) */
	fpr     *t0    = malloc(n * sizeof *t0);
	fpr     *t1    = malloc(n * sizeof *t1);
	fpr     *ell   = malloc(n * sizeof *ell);   /* multiplier  (w)         */
	fpr     *sub   = malloc(n * sizeof *sub);   /* subtrahend  (y)         */
	fpr     *z1    = malloc(n * sizeof *z1);    /* x - y                   */
	fpr     *snap  = malloc(n * sizeof *snap);  /* operand snapshot        */
	size_t   i, u;
	int      p;

	if (!f || !f0 || !f1 || !t0 || !t1 || !ell || !sub || !z1 || !snap) {
		perror("malloc"); return 1;
	}

	bfu_fin  = fopen("../00_TESTBED/input.txt",  "w");
	bfu_fout = fopen("../00_TESTBED/output.txt", "w");
	if (!bfu_fin || !bfu_fout) { perror("fopen"); return 1; }

	srand(12345);

	/* FFT vectors (mode 0) */
	for (p = 0; p < npoly; p++) {
		for (i = 0; i < n; i++)
			f[i] = rnd_fpr(10.0);
		Zf(FFT)(f, logn);
	}

	/* iFFT vectors (mode 1) */
	for (p = 0; p < npoly; p++) {
		for (i = 0; i < n; i++)
			f[i] = rnd_fpr(10.0);
		Zf(iFFT)(f, logn);
	}

	/* Split FFT vectors (mode 2): f -> (f0, f1) */
	for (p = 0; p < npoly; p++) {
		for (i = 0; i < n; i++)
			f[i] = rnd_fpr(10.0);
		Zf(poly_split_fft)(f0, f1, f, logn);
	}

	/* Merge FFT vectors (mode 0): (f0, f1) -> f */
	for (p = 0; p < npoly; p++) {
		for (i = 0; i < hn; i++) {
			f0[i]      = rnd_fpr(10.0);
			f0[i + hn] = rnd_fpr(10.0);   /* keep buffers fully defined */
			f1[i]      = rnd_fpr(10.0);
			f1[i + hn] = rnd_fpr(10.0);
		}
		Zf(poly_merge_fft)(f, f0, f1, logn);
	}

	/*
	 * Vector FMS (mode 3) + Vector ADD (mode 4) — mirrors the ffSampling
	 * Phase-2 / Phase-3 polynomial updates in sign.c (~L396):
	 *     memcpy(z1, t1);  poly_sub(z1, tmp2);     // z1 = t1 - tmp2
	 *     poly_mul_fft(tmp, z1);                   // tmp = tmp * z1
	 *     poly_add(t0, tmp);                       // t0  = t0 + tmp
	 * Per complex coefficient u this is exactly the two BFU vector ops:
	 *     FMS : X = (t1 - sub) * ell   (ell = the L-tree element / "tmp")
	 *     VADD: X = t0 + tmp_new
	 * All arithmetic runs under BFU_TRUNC, so it is bit-exact to the RTL.
	 */
	for (p = 0; p < npoly; p++) {
		for (i = 0; i < n; i++) {
			t0[i]  = rnd_fpr(10.0);
			t1[i]  = rnd_fpr(10.0);
			sub[i] = rnd_fpr(10.0);
			ell[i] = rnd_fpr(10.0);
		}

		/* Phase 2 (FMS): z1 = t1 - sub ; ell = ell * z1  (ell -> tmp_new) */
		memcpy(z1, t1, n * sizeof *z1);
		Zf(poly_sub)(z1, sub, logn);
		memcpy(snap, ell, n * sizeof *snap);          /* snapshot W (=ell) */
		Zf(poly_mul_fft)(ell, z1, logn);              /* ell = W*(t1-sub)  */
		for (u = 0; u < hn; u++)
			log_vec(3, t1[u], t1[u + hn], sub[u], sub[u + hn],
			        snap[u], snap[u + hn], ell[u], ell[u + hn]);

		/* Phase 3 (Vector ADD): t0 = t0 + tmp(=ell) */
		memcpy(snap, t0, n * sizeof *snap);           /* snapshot t0 (=x)  */
		Zf(poly_add)(t0, ell, logn);
		for (u = 0; u < hn; u++)
			log_vec(4, snap[u], snap[u + hn], ell[u], ell[u + hn],
			        FPR(0.0), FPR(0.0), t0[u], t0[u + hn]);
	}

	fclose(bfu_fin);
	fclose(bfu_fout);

	FILE *pn = fopen("../00_TESTBED/PATNUM.txt", "w");
	fprintf(pn, "%ld\n", bfu_cnt);
	fclose(pn);

	printf("Generated %ld BFU vectors (logn=%u, %d polys each of "
	       "FFT / iFFT / Split / Merge / FMS / VecADD)\n", bfu_cnt, logn, npoly);
	free(f);  free(f0);  free(f1);
	free(t0); free(t1);  free(ell); free(sub); free(z1); free(snap);
	return 0;
}
