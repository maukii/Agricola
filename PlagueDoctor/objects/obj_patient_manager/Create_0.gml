function StartGame()
{
	var pati = new Patient(global.taskAmount);

	show_debug_message(pati.activeSymptom);
	StartSymptom(pati.activeSymptom);
	
	global.patientHealthMax = 1400;
	global.patientHealth = global.patientHealthMax;
}

StartGame();