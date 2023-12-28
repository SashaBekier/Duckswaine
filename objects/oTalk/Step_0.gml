/// @description Insert description here
// You can write your code in this editor

if(tickCount < fadeIn)
{
	image_alpha += 1/fadeIn;	
}
else if (tickCount > persist)
{
	image_alpha -= 1/(fadeOut-persist);
}
else if (tickCount > fadeOut)
{
	instance_destroy(self);
}

tickCount++;

if(source!=pointer_null)
{
	x = source.x+xOffset;
	y = source.y+yOffset;
}



