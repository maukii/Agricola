#macro view view_camera[0]
#macro viewWidth 1920
#macro viewHeight 1080
global.windowScale = 1;

function initCamera()
{
	//Setup camera variables
	window_set_size(viewWidth * global.windowScale, viewHeight * global.windowScale);

	//Apply camera
	camera_set_view_size(view, viewWidth, viewHeight);

	//Limit GUI draw resolution
	display_set_gui_size(viewWidth, viewHeight);

	//Enforce pixel perfect camera
	surface_resize(application_surface, viewWidth, viewHeight);
}

function shakeCamera(panAmount, rotAmount, duration)
{
	if (panAmount > obj_camera.shakeAmount)
	{
		obj_camera.shakeAmount = panAmount*global.cameraShakeScale;
		obj_camera.shakeDuration = duration;
	}
	
	if (rotAmount > abs(obj_camera.rot))
		{ obj_camera.rot = choose(rotAmount, -rotAmount)*global.cameraShakeScale; }
}

function directionShakeCamera(amount, duration, direction, frequency)
{
	if (amount > obj_camera.dirShakeAmount)
	{
		obj_camera.dirShakeFrequency = frequency;
		obj_camera.dirShakeAmount = amount*global.cameraShakeScale;
		obj_camera.dirShakeDuration = duration;
		obj_camera.dirShakeDirection = direction;
	}
}

function directionShakeCameraTest(amount, duration, direction, frequency)
{
	if (amount > obj_camera_menu.dirShakeAmount)
	{
		obj_camera_menu.dirShakeFrequency = frequency;
		obj_camera_menu.dirShakeAmount = amount*global.cameraShakeScale;
		obj_camera_menu.dirShakeDuration = duration;
		obj_camera_menu.dirShakeDirection = direction;
	}
}

function rotateCamera(amount, rng)
{
	if (rng)	{ obj_camera.rotTo = choose(amount, -amount)*global.cameraShakeScale; }
	else		{ obj_camera.rotTo = amount*global.cameraShakeScale; }
}
 
function pushCamera(amount, direction)
{
	obj_camera.pushX = lengthdir_x(amount, direction)*global.cameraShakeScale;
	obj_camera.pushY = lengthdir_y(amount, direction)*global.cameraShakeScale;
}

function zoomCamera(amount)
{
	obj_camera.zoomMultiplier -= amount;
}

function setCameraZoom(amount)
{
	obj_camera.zoomTarget = amount;
}

function addCameraFocus(object_id)
{
	array_push(obj_camera.focusArray, object_id);
}

function removeCameraFocus(object_id)
{
	removeFromArray(obj_camera.focusArray, object_id);
}

function resetCameraFocus()
{
	array_resize(obj_camera.focusArray, 0);
		
	//Reset object focus states
	with (par_object_of_interest) { inFocus = false; }
}