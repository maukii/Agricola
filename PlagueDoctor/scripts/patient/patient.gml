enum Tasks 
{
	BadBlood,
	Amputate,
	Operate,
	MixPotion,
	RetachLimb,
	Test1,
	Test2,
	Test3,
	End,
}

randomize();

function Patient(difficulty) constructor
{
	//hair = spr_hair;
	//eyes = spr_eyes;
	//head = spr_hair;
	//mouth = spr_mouth;
	//body = spr_body;
	symptoms = array_create(difficulty);
	for (var i = 0; i < array_length(symptoms); i++)
	{
		taskIndex = irandom(Tasks.End - 1);
		while(arrayContains(symptoms, taskIndex))
		{
			taskIndex = irandom(Tasks.End - 1);
		}
		
		symptoms[i] = taskIndex;
	}
	
	activeSymptom = symptoms[0];
	isCured = false;
}