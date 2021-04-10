event_inherited();

hasThread = false;

function checkForThread()
{
	var thread = instance_place(x, y, obj_thread);
	if (thread != noone && thread.owner != noone)
	{
		thread.owner.releaseItem();
		instance_destroy(obj_thread);
		image_index = 1;
		hasThread = true;
	}
}

hitFunction = function()
{

}

stepFunction = function()
{
	checkHangers();
	checkForThread();
	applyPhysics();
	
	//Insert interactions with other items and maybe patient?
}