#macro PLAYER_AMOUNT 1
#macro GRV 0.3

global.taskAmount = 1;
global.tasksCompleted = 0;

function checkCompletion()
{
	if (global.tasksCompleted == global.taskAmount)
	{
		show_message("ayo, you won my dude");
	}
}