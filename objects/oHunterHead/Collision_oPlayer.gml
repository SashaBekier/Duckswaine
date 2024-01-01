/// @description Insert description here
// You can write your code in this editor

if(sinceBombed > bombedLatency && other.sprite_index == sPlayerDive)
{
	myBody.currentSpeed = max(1,myBody.currentSpeed+0.2);	
	if(x > 2000) //turns hunter towards nearest escape route
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
	oPlayer.bombCount++;
	var bombDrop = oPlayer.bombY - y;
	if(bombDrop > 300) 
	{
		oPlayer.longBombs++;
		if(bombDrop>oPlayer.longestBomb) oPlayer.longestBomb = bombDrop;
	}
}


