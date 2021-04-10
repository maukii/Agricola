var width = 32;
var length = viewWidth/4;
var originX = viewWidth/2;
var originY = 128;

var x1 = originX - global.patientHealth/global.patientHealthMax * length;
var x2 = originX + global.patientHealth/global.patientHealthMax * length;

draw_line_width_color(x1, originY, x2, originY, width, c_red, c_red);