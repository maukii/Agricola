event_inherited();

applyPhysics();
movementRotation();

if (owner != noone)
{
	x = owner.x;
	y = owner.y;
	image_angle = owner.image_angle;
}
