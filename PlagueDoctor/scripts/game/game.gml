#macro PLAYER_AMOUNT 3
#macro GRV 0.3

global.taskAmount = 1;
global.tasksCompleted = 0;

function checkCompletion()
{
	if (global.tasksCompleted == global.taskAmount)
	{
		global.patientHealth = global.patientHealthMax;
	}
}