function freezeObject(object_id)
{
	with (object_id)
	{
		if (owner == noone)
		{
			var pos = 
			{
				x : x,
				y : y,
				image_angle : image_angle,
				object_index : -1,
				heldItem : other.id
			}
	
			owner = pos;
		}
	}
}

function attachObject(object_to_attach, attach_to)
{
	if (owner == noone)
	{
		var att = object_to_attach;
		var to = attach_to;
	
		att.owner = to;
		att.grabOffsetX = att.x - to.x;
		att.grabOffsetY = att.y - to.y;
	
		att.hsp = 0;
		att.vsp = 0;
	}
}