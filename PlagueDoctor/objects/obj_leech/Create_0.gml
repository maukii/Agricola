event_inherited();

hitFunction = function()
{
	attachObject(self, obj_patient);
}

stepFunction = function()
{
	checkHangers();
	applyPhysics();
	
	//Insert interactions with other items and maybe patient?
}