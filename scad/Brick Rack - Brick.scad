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
// Thickness of the top and bottom arm and minimum thickness of the left bar
FRAME_THICKNESS = 10;
// Include a nose on the bottom?
INCLUDE_NOSE = true;
// Include a notch on the top?
INCLUDE_NOTCH = true;
// The total height is calculated automatically to "DEVICE_HEIGHT + 2 * FRAME_THICKNESS". If you want to override it, you can do so here, if you want the top or bottom arm to be thicker. Set to 0 to reset to automatic height calculation.
OVERRIDE_TOTAL_HEIGHT = 0;
// If you override the total height, you can set if the additional height is distributed evenly on top and bottom, or if you want to extend the height on the top arm or on the bottom arm.
OVERRIDE_TOTAL_HEIGHT_TYPE = "EVEN"; // ["EVEN", "EXTEND_TOP", "EXTEND_BOTTOM"]

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
            if (INCLUDE_NOSE) nose();
        }
        if (INCLUDE_NOTCH) notch();
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
                rounded_square([nose_notch_body_length(enlargement), nose_notch_body_depth(enlargement)],
                ROUNDING_RADIUS_NOSE_NOTCH);
}

module cutout() {
    y_offset = OVERRIDE_TOTAL_HEIGHT == 0 ? FRAME_THICKNESS : cutout_offset_y(OVERRIDE_TOTAL_HEIGHT_TYPE);
    translate([cutout_inset_x(), y_offset, - RENDER_HELPER])
        linear_extrude(DEPTH + 2 * RENDER_HELPER)
            rounded_square([TOTAL_LENGTH, DEVICE_HEIGHT], ROUNDING_RADIUS_CUTOUT);
}
