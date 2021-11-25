# Brick Rack

Brick Rack is a modular rack that is built with bricks.

It's a customizable OpenSCAD recreation of
jpoblocki's Mini Rack: https://www.thingiverse.com/thing:4214092

As there are so many devices and sizes, I only included one as an example and for the preview rendering.


# Usage

Download the "Brick Rack - Brick.scad" file and open it in OpenSCAD. Open the OpenSCAD customizer, or edit the customizable variables directly in the file. Only edit variables above the "module __Customizer_Limit__() {}" line.

You need to render one model for every device you put into the rack. Do the measurements as follows:

- *DEVICE_WIDTH_WIDEST:* Measure how wide the widest device of your final rack is in milimeters, and note that value. Use the same value for the "DEVICE_WIDTH_WIDEST" variable for every piece of your rack.
- *DEVICE_WIDTH:* Width of the device. This and the DEVICE_WIDTH_WIDEST variable define, how large the slot (inner cutout) is.
- *DEVICE_HEIGHT:* Height of the device.
- *DEPTH:* Depth/Thickness of the brick. You should use the same thickness for all pieces.
- *TOTAL_LENGTH:* Total length of the brick. You don't need to use the same length for all devices, as long as the lenght of nose and notch are short enough.
- *TOTAL_LENGTH_NOSE:* Length of the nose and notch. Choose the same for every piece of your rack.
- *FRAME_THICKNESS:* Define how thick the you want the frame/arms to be. 10 is a good choice.
- *INCLUDE_NOSE:* If you want to include a nose, that's the piece that sticks out on the bottom. For the lowermost piece you probably don't want a nose.
- *INCLUDE_NOTCH:* If you want to include a notch on top. For the topmost piece you probably don't want a notch.
- *OVERRIDE_TOTAL_HEIGHT:* The total height is calculated automatically to "DEVICE_HEIGHT + 2 * FRAME_THICKNESS". If you want to override it, you can do so here, if you want the top or bottom arm to be thicker. Set to 0 to reset to automatic height calculation.
- *OVERRIDE_TOTAL_HEIGHT_TYPE:* If you override the total height, you can set if the additional height is distributed evenly on top and bottom, or if you want to extend the height on the top arm or on the bottom arm.
