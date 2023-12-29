/// @description Insert description here
// You can write your code in this editor


if(other.isFlying){
	myBody.hits++;

	image_index = myBody.hits;
	if(myBody.hits + 1 >= myBody.life) myBody.hsp *= -1;
	instance_destroy(other);
	speak(HunterDisgust);
	bubble(sBubblePoo);
}




