function total_height() = OVERRIDE_TOTAL_HEIGHT == 0 ? DEVICE_HEIGHT + 2 * FRAME_THICKNESS : OVERRIDE_TOTAL_HEIGHT;
function nose_notch_body_length(enlargement) = TOTAL_LENGTH_NOSE + enlargement;
function nose_notch_body_depth(enlargement) = DEPTH - 2 * NOSE_INSET_Y + enlargement;
function cutout_inset_x() = FRAME_THICKNESS + (DEVICE_WIDTH_WIDEST - DEVICE_WIDTH) / 2;
function cutout_offset_y(type) = type == "EVEN" ? (total_height() - DEVICE_HEIGHT) / 2 : (type == "EXTEND_BOTTOM" ? total_height() - FRAME_THICKNESS - DEVICE_HEIGHT : FRAME_THICKNESS);
