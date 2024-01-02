/// @description Insert description here
// You can write your code in this editor
function pecked()
{
	//var carryable = sGrassCarry;
	if(sprite_index == sGrassYellow)
	{
		if(image_yscale > .9)
		{
			with(instance_create_layer(x,y,"Hunters",oCarryable))
			{
					//sprite_index = carryable;
					x = other.x;
					y = other.y;
			
			}
		} 
		else 
		{
			oPlayer.maxStamina++;	
		}
		instance_destroy(self);
	} 
	else if (sprite_index == sSeed) 
	{
		oPlayer.maxStamina++;
		instance_destroy(self);
	}
}

