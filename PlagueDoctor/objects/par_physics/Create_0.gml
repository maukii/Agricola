hsp = 0;
vsp = 0;
weight = 1;
bounceMultiplier = -0.5;
bounceThreshold = 1;
bounceFrictionMultiplier = 0.7;
bounceFunction = function() {};

function applyPhysics()
{
	vsp += GRV;
	
	//Constrain to screen
	if (x + hsp < 0 || x + hsp > viewWidth)
	{
		hsp *= bounceMultiplier;
		vsp *= bounceFrictionMultiplier;
		
		bounceFunction();
	}
		
	if (y + vsp > viewHeight - 64)
	{
		if (vsp > bounceThreshold)
		{
			vsp *= bounceMultiplier;
			hsp *= bounceFrictionMultiplier;
			
			bounceFunction();
		}
		else
		{
			vsp = 0;
			hsp = 0;
			
			bounceFunction();
		}
	}

	x += hsp;
	y += vsp;
}