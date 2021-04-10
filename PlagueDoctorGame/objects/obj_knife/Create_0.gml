event_inherited();

function freezeObject()
{
	var pos = 
	{
		x : x,
		y : y,
		image_angle : image_angle,
		heldItem : other.id
	}
	
	owner = pos;
}

hitFunction = function()
{
	freezeObject();
}

stepFunction = function()
{
	checkHangers();
	
	//Insert interactions with other items and maybe patient?
}