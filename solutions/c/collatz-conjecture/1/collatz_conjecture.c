#include "collatz_conjecture.h"

int steps(int start) {
    if (start > 0) {
        int collatzConjectureSteps = 0, collatzConjectureSum = start;
        while (collatzConjectureSum != 1 && collatzConjectureSum > 1) {
            if (collatzConjectureSum % 2 == 0) {
                collatzConjectureSum /= 2;
            } else {
                collatzConjectureSum = 3 * collatzConjectureSum + 1;
            }
            collatzConjectureSteps++;
        }
        return collatzConjectureSteps;
    } else {
        return ERROR_VALUE;
    }
}
