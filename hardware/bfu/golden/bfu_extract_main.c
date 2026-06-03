/*
 * bfu_extract_main.c — C-model extraction harness for the BFU.
 *
 * Initializes random polynomials and runs the (instrumented) reference
 * Zf(FFT) / Zf(iFFT). The instrumentation in software/fft.c dumps every
 * butterfly's operands (x, y, W) and results (X, Y) as raw 64-bit hex.
 *
 * Build (run from hardware/BFU/golden/):
 *   gcc -O2 -I../../../software \
 *       -DFALCON_FPNATIVE=1 -DFALCON_FPEMU=0 -DFALCON_AVX2=0 \
 *       -DBFU_TRUNC -DBFU_EXTRACT \
 *       -o bfu_extract bfu_extract_main.c \
 *       ../../../software/fft.c ../../../software/fpr.c
 *
 * BFU_TRUNC  : route fpr_add/sub/mul through the truncating emulation that
 *              bit-matches the Verilog FP units (hardware/FPC_MUL).
 * BFU_EXTRACT: enable the fprintf dumps in the non-AVX butterfly loops.
 */
#include <stdio.h>
#include <stdlib.h>
#include "inner.h"

/* Defined here, referenced by the instrumentation in fft.c */
FILE *bfu_fin  = NULL;
FILE *bfu_fout = NULL;
long  bfu_cnt  = 0;

int main(void)
{
	unsigned logn  = 9;        /* n = 512 */
	int      npoly = 2;        /* FFT polys and iFFT polys */
	size_t   n     = (size_t)1 << logn;
	fpr     *f     = malloc(n * sizeof *f);
	size_t   i;
	int      p;

	bfu_fin  = fopen("../00_TESTBED/input.txt",  "w");
	bfu_fout = fopen("../00_TESTBED/output.txt", "w");
	if (!bfu_fin || !bfu_fout) { perror("fopen"); return 1; }

	srand(12345);

	/* FFT vectors (is_ifft = 0) */
	for (p = 0; p < npoly; p++) {
		for (i = 0; i < n; i++)
			f[i] = FPR(((double)rand() / RAND_MAX * 2.0 - 1.0) * 10.0);
		Zf(FFT)(f, logn);
	}

	/* iFFT vectors (is_ifft = 1) */
	for (p = 0; p < npoly; p++) {
		for (i = 0; i < n; i++)
			f[i] = FPR(((double)rand() / RAND_MAX * 2.0 - 1.0) * 10.0);
		Zf(iFFT)(f, logn);
	}

	fclose(bfu_fin);
	fclose(bfu_fout);

	FILE *pn = fopen("../00_TESTBED/PATNUM.txt", "w");
	fprintf(pn, "%ld\n", bfu_cnt);
	fclose(pn);

	printf("Generated %ld BFU vectors (logn=%u, %d FFT + %d iFFT polynomials)\n",
	       bfu_cnt, logn, npoly, npoly);
	free(f);
	return 0;
}
