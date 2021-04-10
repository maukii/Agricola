event_inherited();

hitFunction = function()
{
	
}

function checkForWound()
{
	if (place_meeting(x, y, obj_wound) && owner != noone)
	{
		image_index = 1;
	}
	else
	{
		image_index = 0;
	}
}

stepFunction = function()
{
	checkHangers();
	applyPhysics();
	checkForWound();
	
	//Insert interactions with other items and maybe patient?
}