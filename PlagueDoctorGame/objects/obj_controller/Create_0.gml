//Spawn players
var sideBoundWidth = 360;
var bottomBoundHeight = 360;
var playerBounds =
[
	[0, 0, sideBoundWidth, viewHeight],
	[viewWidth - sideBoundWidth, 0, viewWidth, viewHeight],
	[0, viewHeight - bottomBoundHeight, viewWidth, viewHeight]
];

for (var i = 0; i < PLAYER_AMOUNT; ++i)
{
	var bnd = playerBounds[i];
	var spawnX = (bnd[0] + bnd[2]) / 2;
	var spawnY = (bnd[1] + bnd[3]) / 2;
		
	var plr = instance_create_layer(spawnX, spawnY, "Players", obj_hand);
		
	plr.controller = global.controllers[i];
	plr.bounds = playerBounds[i];
}