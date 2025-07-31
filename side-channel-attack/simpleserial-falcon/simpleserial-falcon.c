#include "hal.h"
#include "simpleserial.h"
// #include <stdint.h>
// #include <stdlib.h>
// #include <string.h>

// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
// #include <time.h>
// #include <math.h>

// #include "inner.h"
#include "fft.c"

#define LOGN 4 // change this before compilation
#define DIM (1 << LOGN)

uint64_t pt0[DIM];

uint8_t read8bytes(uint8_t *pt, uint8_t len)
{
    uint8_t tmp[8];
    if (len != 10)
        return 0xFF; // Error: Ensure we have at least 10 bytes

    // Extract the index (idx) from the first two bytes
    uint16_t idx = ((uint16_t)pt[0] << 8) | pt[1];

    // Ensure idx is within bounds
    if (idx >= DIM)
        return 0xFE; // Error: Index out of range

    // Read the next 8 bytes and store in pt0[idx] (big-endian order)
    pt0[idx] = 0; // Clear storage before writing new data
    for (int i = 0; i < 8; i++)
    {
        pt0[idx] |= ((uint64_t)pt[i + 2] << (i * 8)); // Little-endian
        tmp[i] = pt[i + 2];                           // Copy into tmp for response
    }

    // Send back the 8 bytes read
    simpleserial_put('r', 8, tmp);
    return 0x00; // Success
}

uint8_t get_pt(uint8_t *pt, uint8_t len)
{
    if (len != 2)
        return 0xFF;

    uint16_t idx = ((uint16_t)pt[0] << 8) | pt[1];

    fpr f[DIM];
    fpr h[DIM] = {-1, 1, -1, -1, 1, -3, -11, 9, -2, 2, -8, -4, 2, 0, 1, -2};

    for (int i = 0; i < DIM; i++)
        f[i] = pt0[i];

    Zf(FFT)(h, LOGN);

    trigger_high();
    Zf(poly_mul_fft)(f, h, LOGN);
    trigger_low();

    uint8_t tmp[8];
    for (int i = 0; i < 8; i++)
    {
        tmp[i] = (pt0[idx] >> (i * 8)) & 0xFF;
    }

    simpleserial_put('r', 8, tmp);
    return 0x00;
}

int main(void)
{

    platform_init();
    init_uart();
    trigger_setup();

    simpleserial_init();
    simpleserial_addcmd('p', 2, get_pt);
    simpleserial_addcmd('k', 10, read8bytes);
    while (1)
        simpleserial_get();

    return 0;
}
