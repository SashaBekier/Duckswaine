/// @description Insert description here
// You can write your code in this editor

if(sinceKicked > kickLatency)
{
	if(image_index > 0) oPlayer.pScore -= 500;
	image_index = max(0, image_index - 1);
	sinceKicked = 0;
}


