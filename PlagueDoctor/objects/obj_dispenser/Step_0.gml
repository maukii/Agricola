var hand = instance_place(x, y, obj_hand);

if (hand != noone && hand.grab && hand.heldItem == noone && !instance_exists(obj_leech))
{
	var itm = instance_create_layer(hand.x, hand.y, "Objects", objectToDispense);
	hand.grabItem(itm);
}