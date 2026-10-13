#include "darts.h"
#include <math.h>
#include <stdbool.h>

// My solution:
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

// Recommended by Exercism
/* const float INNER_RING_RADIUS = 1.0F;
const float MIDDLE_RING_RADIUS = 5.0F;
const float OUTER_RING_RADIUS = 10.0F;

static float dart_throw_location_radius(coordinate_t dart_throw_location) {
    return hypot(dart_throw_location.x, dart_throw_location.y); 
    // calculate the radius from x and y coordinates
}

static bool is_throw_within_ring(float throw_location_radius, float ring_radius) {
    return throw_location_radius <= ring_radius;
}

int score(coordinate_t dart_throw_location) {
    float dart_location_radius = dart_throw_location_radius(dart_throw_location);

    if (is_throw_within_ring(dart_location_radius, INNER_RING_RADIUS)) {
        return 10;
    } else if (is_throw_within_ring(dart_location_radius, MIDDLE_RING_RADIUS)) {
        return 5;
    } else if (is_throw_within_ring(dart_location_radius, OUTER_RING_RADIUS)) {
        return 1;
    } else {
        return 0;
    }
} */
