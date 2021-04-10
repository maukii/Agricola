drawX = x + irandom(10*power((1 - healthState), 3));
drawY = y + irandom(10*power((1 - healthState), 3));

draw_sprite_ext(sprite_index, image_index, drawX, drawY, 1, 1, 0, image_blend, 1);