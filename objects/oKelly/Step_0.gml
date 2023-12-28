/// @description Insert description here
// You can write your code in this editor
if(oNest.image_index < 6)
{
	waitCounter++	
} else 
{
	waitCounter = 0;	
}
humanCounter++;


if(isFalling)
{
	vsp += RoomControl.grv;
	
	if(place_meeting(x,y+vsp,oGround))
	{
		if(vsp >0)
		{
			while(!place_meeting(x,y+sign(vsp),oGround))
			{
				y += sign(vsp);	
			}
			vsp = 0;
			isFalling = false;
			audio_emitter_position(kellyEmitter,x,y,0);
		}
	}
	y += vsp;
}


 
if (lastNest < oNest.image_index) // Duckswaine delivers
{
	lastNest = oNest.image_index;
	waitCounter = 0;
	patience += 60;
	speak(DuckHappy);
	bubble(sBubbleHeart);	
	
}
else if(lastNest > oNest.image_index) //the nest has been damaged
{
	lastNest = oNest.image_index;
	patience = max(minPatience,patience - 120);
	
	
}
else
{
	if(waitCounter > patience)
	{
		speak(DuckCranky);
		bubble(sBubbleGrass);
		waitCounter = 0;
		patience = max(minPatience,patience - 60);
	}
}


