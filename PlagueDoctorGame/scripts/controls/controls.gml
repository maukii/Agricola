global.controllers = [];
global.gp_num = gamepad_get_device_count();
#macro DEADZONE 0.2

function getControllers()
{
	//Cycle through USB ports
	for (var i = 0; i < global.gp_num; i++;)
	{
		//Select first available controller (prefers XInput devices)
		if (gamepad_is_connected(i))
		{
			if (!arrayContains(global.controllers, i))
			{ array_push(global.controllers, i); }
		} else
		{
			global.controller = -1;
		}
	}
}