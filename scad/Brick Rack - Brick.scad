////////////////////////////////////////////////////////////////////////////////
// ### CUSTOMIZABLE VARIABLES
////////////////////////////////////////////////////////////////////////////////
// Width of the widest device in the whole rack
DEVICE_WIDTH_WIDEST = 180;
// Width of the device
DEVICE_WIDTH = 168;
// Height of the device
DEVICE_HEIGHT = 30.5;
// Depth of the brick
DEPTH = 20;
// Total length of the brick
TOTAL_LENGTH = 50;
// Total length of the nose
TOTAL_LENGTH_NOSE = 36;

module __Customizer_Limit__() {}


////////////////////////////////////////////////////////////////////////////////
// ### OPENSCAD SPECIAL VARIABLES
////////////////////////////////////////////////////////////////////////////////
$fn = 24;


////////////////////////////////////////////////////////////////////////////////
// ### GLOBAL VARIABLES
////////////////////////////////////////////////////////////////////////////////
include <includes/Brick Rack Variables.scad>


////////////////////////////////////////////////////////////////////////////////
// ### UTILITY MODULES
////////////////////////////////////////////////////////////////////////////////
include <includes/Brick Rack Utilities.scad>


////////////////////////////////////////////////////////////////////////////////
// ### CALCULATION FUNCTIONS
////////////////////////////////////////////////////////////////////////////////
include <includes/Brick Rack Calculations.scad>


////////////////////////////////////////////////////////////////////////////////
// ### MAIN RENDERING
////////////////////////////////////////////////////////////////////////////////
main();


////////////////////////////////////////////////////////////////////////////////
// ### MODULES
////////////////////////////////////////////////////////////////////////////////
module main() {
    difference() {
        union() {
            body();
            nose();
        }
        notch();
        cutout();
    }
}

module body() {
    rounded_cube([TOTAL_LENGTH, total_height(), DEPTH], ROUNDING_RADIUS_BODY);
}

module nose() {
    nose_notch_body();
}

module notch() {
    translate([0, total_height() + RENDER_HELPER, 0])
        nose_notch_body(NOSE_NOTCH_SIZE_DIFF);
}

module nose_notch_body(enlargement = 0) {
    x_offset = NOSE_INSET_X;
    y_offset = (DEPTH - nose_notch_body_depth(enlargement)) / 2;
    translate([x_offset, 0, y_offset])
        rotate([90, 0, 0])
            linear_extrude(NOSE_NOTCH_HEIGHT + enlargement)
                rounded_square([nose_notch_body_length(enlargement), nose_notch_body_depth(enlargement)], ROUNDING_RADIUS_NOSE_NOTCH);
}

module cutout() {
    translate([cutout_inset_x(), FRAME_THICKNESS, - RENDER_HELPER])
        linear_extrude(DEPTH + 2 * RENDER_HELPER)
            rounded_square([TOTAL_LENGTH, DEVICE_HEIGHT], ROUNDING_RADIUS_CUTOUT);
}
