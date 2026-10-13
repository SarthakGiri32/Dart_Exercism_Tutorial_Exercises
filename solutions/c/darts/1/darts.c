#include "darts.h"
#include <math.h>

int score(coordinate_t landing_position) {
    float distance_from_center_squared =
        landing_position.x * landing_position.x + landing_position.y * landing_position.y;
    
    if (distance_from_center_squared <= 1.0F) {
        return 10;
    } else if (distance_from_center_squared <= 25.0F) {
        return 5;
    } else if (distance_from_center_squared <= 100.0F) {
        return 1;
    } else {
        return 0;
    }
}
