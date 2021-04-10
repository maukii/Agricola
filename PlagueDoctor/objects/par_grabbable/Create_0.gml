event_inherited();

function checkHangers()
{
	if (owner == noone)
	{
		var hanger = instance_place(x, y, obj_hanger)
		if (hanger != noone && hanger.heldItem == noone)
		{
			owner = hanger;
			hanger.heldItem = id;
			hsp = 0;
			vsp = 0;
		}
	}	
}

stepFunction = function()
{
	checkHangers();
	applyPhysics();
};

function movementRotation()
{
	//This is for teh funny hee-haws
	image_angle -= hsp;
}
