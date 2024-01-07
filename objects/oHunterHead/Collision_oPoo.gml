/// @description Insert description here
// You can write your code in this editor


if(other.isFlying){
	myBody.hits++;

	image_index = myBody.hits;
	myBody.hsp *= -1;
	instance_destroy(other);
	speak(HunterDisgust);
	bubble(sBubblePoo);
	
	oPlayer.headShots++;
	oPlayer.hitStreak++;
	oPlayer.pScore += 20;
	
	var pooFall = y - other.launchHeight;
	//show_debug_message(pooFall);
	if(pooFall > 300)
	{
		oPlayer.longDrops++;
		oPlayer.pScore += int64(pooFall/10);
		with(instance_create_layer(0,0,"HUD",oCallout))
		{
			mySource = other;	
		}
		
	}
	if(other.hsp > 1) oPlayer.pScore += int64(other.hsp * 5);
	if(pooFall > oPlayer.longestDrop) oPlayer.longestDrop = pooFall;
}




