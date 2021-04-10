/// @description Generate array of Symptoms for players to cure
difficulty = 4;
pati = new Patient(difficulty);

for (var i = 0; i < array_length(pati.symptoms); i++)
{
	show_message(pati.symptoms[i]);
}