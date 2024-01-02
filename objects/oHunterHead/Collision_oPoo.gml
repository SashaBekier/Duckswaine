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
	
	var pooFall = other.launchHeight - y;
	if(pooFall > 400) oPlayer.longDrops++;
	if(pooFall > oPlayer.longestDrop) oPlayer.longestDrop = pooFall;
}




