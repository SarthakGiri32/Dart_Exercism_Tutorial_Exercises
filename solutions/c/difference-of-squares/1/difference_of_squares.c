#include "difference_of_squares.h"

unsigned int sum_of_squares(unsigned int number) {
    unsigned int sumOfSquares = 0;
    for (unsigned int i = 1; i <= number; i++) sumOfSquares += i * i;
    return sumOfSquares;
}

unsigned int square_of_sum(unsigned int number) {
    unsigned int total = 0;
    for (unsigned int i = 1; i <= number; i++) total += i;
    return total * total;
}

unsigned int difference_of_squares(unsigned int number) {
    return square_of_sum(number) - sum_of_squares(number);
}
