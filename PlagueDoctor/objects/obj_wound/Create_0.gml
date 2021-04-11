stepAmount = 3;
curStep = 0;
healPerTask = 60;

image_xscale = 0.5;
image_yscale = 0.5;

task = function()
{
	if (place_meeting(x, y, obj_knife))
	{
		incrementStep();
		image_index = 1;
	}
};

function incrementStep()
{
	curStep++;
	image_index = curStep;
	if (curStep == stepAmount)
	{
		//Mark this as done somehow
		global.tasksCompleted++;
		checkCompletion();
	}
	
	healPatient(healPerTask);
	
	switch (curStep)
	{
		case 1:
			task = function()
			{
				var tunkki = instance_place(x, y, obj_tunkki);
				if (tunkki != noone && tunkki.owner != noone)
				{
					image_index = 2;
					var leech = instance_place(x, y, obj_leech);
					if (leech != noone)
					{
						leech.owner.releaseItem();
						instance_destroy(leech);
						incrementStep();
						image_index = 2;
					}
				}
				else
				{
					image_index = 1;
				}
			}
		break;
		
		case 2:
			task = function()
			{
				var needle = instance_place(x, y, obj_needle);
				if (needle != noone && needle.hasThread)
				{
					incrementStep();
					
					needle.hasThread = false;
					needle.image_index = 0;
					
					image_index = 3;
				}
			}
		break;
	}
}


//Graphics
offset =
{
	x : 140,
	y : 40,
}