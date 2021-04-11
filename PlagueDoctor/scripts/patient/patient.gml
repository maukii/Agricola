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
		//taskIndex = irandom(Tasks.End - 1);
		taskIndex = 2;
		while(arrayContains(symptoms, taskIndex))
		{
			taskIndex = irandom(Tasks.End - 1);
		}
		
		symptoms[i] = taskIndex;
	}
	
	activeSymptom = symptoms[0];
	isCured = false;
}

function StartSymptom(index)
{
	switch (index)
	{
		case Tasks.BadBlood:
			show_debug_message("Starting: BadBlood");
			break;
		case Tasks.Amputate:
			show_debug_message("Starting: Amputate");
			break;
		case Tasks.Operate:
			show_debug_message("Starting: Operate");
			CreateWound();
			break;
		case Tasks.MixPotion:
			show_debug_message("Starting: MixPotion");
			break;
		case Tasks.Test1:
			show_debug_message("Starting: Test1");
			break;
		case Tasks.Test2:
			show_debug_message("Starting: Test2");
			break;
		case Tasks.Test3:
			show_debug_message("Starting: Test3");
			break;
	}
}

function CreateWound()
{
	var wound = instance_create_layer(x,y, "Patient", obj_wound);
	wound.depth = obj_patient.depth - 1;
}


global.patientHealthMax = 1080;
global.patientHealth = global.patientHealthMax;

function healPatient(amount)
{
	global.patientHealth = min(global.patientHealth + amount, global.patientHealthMax);
}