#include "grains.h"

uint64_t square(uint8_t index) {return (index == 0 || index > 64) ? 0 : 1ULL << (index - 1);}

uint64_t total(void) {return UINT64_MAX;}      // 2^64 - 1, the exact answer for n = 64
