//These will be set on spawn by the controller
controller = -1;
bounds = -1;

//Controls
function getInput()
{
	grab = gamepad_button_check_pressed(controller, gp_face1);
	release = gamepad_button_check_released(controller, gp_face1);
	
	joyH = gamepad_axis_value(controller, gp_axislh);
	joyV = gamepad_axis_value(controller, gp_axislv);
	
	neutral = abs(joyH) < DEADZONE && abs(joyV) < DEADZONE;
	
	moveDir = point_direction(0, 0, joyH, joyV);
}

//Movement
spd = 12;
hsp = 0;
vsp = 0;

//Graphics
enum frames
{
	idle,
	grab,
	hurt
}

function handMovement()
{	
	//This is ass :DDD
	if (neutral)
	{
		hsp = 0;
		vsp = 0;
	}
	else
	{
		hsp = lengthdir_x(abs(joyH*spd), moveDir);
		vsp = lengthdir_y(abs(joyV*spd), moveDir)
	}
	
	//Restrict to bounds
	x = clamp(x + hsp*delta, bounds[0], bounds[2]);
	y = clamp(y + vsp*delta, bounds[1], bounds[3]);
}

//Grabbing stuff
function handGrabbing()
{
	if (grab)
	{
		image_index = frames.grab;
	}
	else if (release)
	{
		image_index = frames.idle;
	}
}