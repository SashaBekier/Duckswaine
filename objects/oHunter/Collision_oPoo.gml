/// @description Insert description here
// You can write your code in this editor

if(other.isFlying){
	//makes the poop bounce off.
	other.hsp = -hsp;
	speak(HunterMeh);
	//poop is motivational
	currentSpeed = min(currentSpeed + .1, maxSpeed);
	
	hsp = sign(hsp)*currentSpeed;
}

