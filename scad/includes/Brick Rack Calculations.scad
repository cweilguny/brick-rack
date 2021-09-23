function total_height() = DEVICE_HEIGHT + 2 * FRAME_THICKNESS;
function nose_notch_body_length(enlargement) = TOTAL_LENGTH - 2 * NOSE_INSET_X + enlargement;
function nose_notch_body_depth(enlargement) = DEPTH - 2 * NOSE_INSET_Y + enlargement;
function cutout_inset_x() = FRAME_THICKNESS + (DEVICE_WIDTH_WIDEST - DEVICE_WIDTH) / 2;