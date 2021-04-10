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
	if (neutral)
	{
		hsp = 0;
		vsp = 0;
	}
	else
	{
		var finalSpd = spd;
		if (heldItem != noone)
		{
			finalSpd = spd / heldItem.weight;
		}
		
		hsp = lengthdir_x(abs(joyH*finalSpd), moveDir);
		vsp = lengthdir_y(abs(joyV*finalSpd), moveDir)
	}
	
	//Restrict movement to bounds
	x = clamp(x + hsp*delta, bounds[0], bounds[2]);
	y = clamp(y + vsp*delta, bounds[1], bounds[3]);
}

//Grabbing stuff
heldItem = noone;
throwMultiplier = 2;

function grabItem(item)
{
	heldItem = item;
	item.owner = id;
	item.hsp = 0;
	item.vsp = 0;
	item.grabOffsetX = item.x - x;
	item.grabOffsetY = item.y - y;
				
	if (item.reorient)
		{ item.image_angle = image_angle + 90; }
}

function handGrabbing()
{
	if (grab)
	{
		var item = instance_place(x, y, par_interactable);
		if (heldItem == noone && item != noone)
		{
			if (item.owner == noone || item.owner.object_index != obj_hand )
			{
				//If it was held by something else, update that
				if (item.owner != noone) item.owner.heldItem = noone;
				
				grabItem(item);
				
				heldItem.grabFunction();
			}
		}
		
		//Graphics
		image_index = frames.grab;
	}
	else if (release)
	{
		if (heldItem != noone)
		{
			//Let go of item and inherit speed
			heldItem.owner = noone;
			heldItem.hsp = hsp*throwMultiplier / heldItem.weight;
			heldItem.vsp = vsp*throwMultiplier / heldItem.weight;
			
			heldItem.releaseFunction();
			
			//Clear player reference to item
			heldItem = noone;
		}
		
		//Graphics
		image_index = frames.idle;
	}
}