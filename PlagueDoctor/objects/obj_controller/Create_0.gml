//Spawn players
var sideBoundWidth = 360;
var bottomBoundHeight = 360;
var playerBounds =
[
	[0, 0, sideBoundWidth, viewHeight],
	[0, viewHeight - bottomBoundHeight, viewWidth, viewHeight],
	[viewWidth - sideBoundWidth, 0, viewWidth, viewHeight]
];

var hands = [spr_hand_01, spr_hand_02, spr_hand_03];

for (var i = 0; i < PLAYER_AMOUNT; ++i)
{
	var bnd = playerBounds[i];
	var spawnX = (bnd[0] + bnd[2]) / 2;
	var spawnY = (bnd[1] + bnd[3]) / 2;
		
	var plr = instance_create_layer(spawnX, spawnY, "Players", obj_hand);
		
	plr.controller = global.controllers[i];
	plr.bounds = playerBounds[i];
	plr.image_angle = 90*i;
	plr.sprite_index = hands[i];
}