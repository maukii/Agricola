hsp = 0;
vsp = 0;

function applyPhysics()
{
	vsp += GRV;

	x += hsp;
	y += vsp;
}