stepAmount = 3;
curStep = 0;
healPerTask = 60;

task = function()
{
	if (place_meeting(x, y, obj_knife))
	{
		incrementStep();
	}
};

function incrementStep()
{
	curStep++;
	image_index = curStep;
	if (curStep == stepAmount)
	{
		//Mark this as done somehow
		instance_destroy();
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
					var leech = instance_place(x, y, obj_leech);
					if (leech != noone)
					{
						leech.owner.releaseItem();
						instance_destroy(leech);
						incrementStep();
					}
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
				}
			}
		break;
	}
}


//Graphics
offset =
{
	x : 120,
	y : 30,
}