/// @description Insert description here
// You can write your code in this editor

if(other.sprite_index == sGrassCarry && !other.isCarried){
	if(image_index < 6) 
	{ 
		image_index++;
		instance_destroy(other);
		oPlayer.pScore += 500;
	}
}




