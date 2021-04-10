event_inherited();
owner = noone;
grabOffsetX = 0;
grabOffsetY = 0;

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

hitFunction = function()
{
	//ASD
};

grabFunction = function() 
{
	//ASD
};

releaseFunction = function()
{
	
};

stepFunction = function()
{
	checkHangers();
};