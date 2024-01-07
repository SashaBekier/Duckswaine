/// @description Insert description here
// You can write your code in this editor

if(mySource != pointer_null)
{
	x = mySource.x;
	y = mySource.y - 300;
}
else 
{
	mySource = oCamera.x;
	y = 340;
}

//timer++;
if(RoomControl.frameCount - timer < 60)
{
	image_xscale = 1/(60-RoomControl.frameCount + timer);	
	image_yscale = 1/(60-RoomControl.frameCount + timer);
	image_angle += 12;
	if((RoomControl.frameCount - timer) == giggle_delay && giggle > 0)
	{
		audio_play_sound(DuckWak,3,0,random_range(0.7,0.9),0,random_range(.2,.4)+1);
		giggle--;
		giggle_delay += irandom_range(10,14)
	}
} 
else if (RoomControl.frameCount - timer < 120)
{
	image_xscale = 1;
	image_yscale = 1;
}
else if (RoomControl.frameCount - timer < 150)
{
	image_alpha -= 1/30;
	//image_xscale = 1 / (RoomControl.frameCount - timer-119);
	//image_yscale = 1 / (RoomControl.frameCount - timer-119);
	
}
else instance_destroy();







