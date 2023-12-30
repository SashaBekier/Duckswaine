/// @description Insert description here
// You can write your code in this editor

function pecked()
{
	//var carryable = sGrassCarry;
	//if(sprite_index == sGrassYellow) carryable = sGrassCarry;
	with(instance_create_layer(x,y,"Hunters",oCarryable))
	{
			//sprite_index = carryable;
			x = other.x;
			y = other.y;
			
	}
	instance_destroy(self);
}


