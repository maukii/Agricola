event_inherited();

//Health
healthState = global.patientHealth/global.patientHealthMax;
image_blend = merge_color(c_red, c_white, healthState);

