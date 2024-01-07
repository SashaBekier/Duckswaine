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

isHidden = place_meeting(x,y,oConcealment);

 
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
	if(!hunterComplain && humanCounter > humanLatency) hunterComplain = true;
	
}
else
{
	if(waitCounter > patience)
	{
		speak(DuckCranky);
		bubble(sBubbleGrass);
		oPlayer.pScore -= 50;
		waitCounter = 0;
		patience = max(minPatience,patience - 60);
	}
}


if(hunterComplain)
{
	speak(DuckAlarm);
	bubble(sBubbleHuman);
	humanCounter = 0;
	hunterComplain = false;
}