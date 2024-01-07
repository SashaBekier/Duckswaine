/// @description Insert description here
// You can write your code in this editor

if(sinceBombed > bombedLatency && other.sprite_index == sPlayerDive && y - oPlayer.bombY > 150)
{
	myBody.currentSpeed = max(1,myBody.currentSpeed+0.2);	
	if(x > RoomControl.roomWidth / 2) //turns hunter towards nearest escape route
	{
		myBody.hsp = abs(myBody.hsp);
		
	} 
	else 
	{
		myBody.hsp = abs(myBody.hsp) * -1;
	}
	
	sinceBombed = 0;
	speak(HunterPain);
	bubble(sBubbleWounded);
	oPlayer.pScore += 100;
	oPlayer.bombCount++;
	var bombDrop = y - oPlayer.bombY;
	if(bombDrop > 300) 
	{
		oPlayer.pScore += int64(bombDrop/5);
		oPlayer.longBombs++;
		if(bombDrop>oPlayer.longestBomb) oPlayer.longestBomb = bombDrop;
		with(instance_create_layer(0,0,"HUD",oCallout))
		{
			sprite_index = sDeepDive;
			mySource = other;	
		}
	}
}


