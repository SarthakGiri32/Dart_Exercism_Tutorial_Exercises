#include "resistor_color.h"

int color_code(resistor_band_t color) {
    return color;
}

/* reads as: “colors is a function that takes no arguments 
and returns a pointer to a const resistor_band_t.” */
const resistor_band_t *colors(void) {
    static const resistor_band_t all_colors[] = {
        BLACK, BROWN, RED, ORANGE, YELLOW,
        GREEN, BLUE, VIOLET, GREY, WHITE
    };
    return all_colors;
    /* 
    When you use an array’s name in an expression like return all_colors;, it “decays” 
    into a pointer to its first element. So the function returns the address of BLACK, the start of the array.
    The caller gets that pointer and can walk through the array with indexing, since consecutive elements sit 
    next to each other in memory.
    */
}
