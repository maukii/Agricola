function StartGame()
{
	var pati = new Patient(1);

	show_message(pati.activeSymptom);
	StartSymptom(pati.activeSymptom);
}

StartGame();