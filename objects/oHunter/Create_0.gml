/// @description Insert description here
// You can write your code in this editor

currentSpeed = random_range(1,2);
maxSpeed = 2.5;

hsp = 0;
vsp = 0;
isHunting = true;

isDodging = false;
dodgeDelay = 120;
dodgeCount = dodgeDelay;

if(x < 0)
{
	hsp = currentSpeed;
} 
else
{
	hsp = currentSpeed * -1;	
}

lastHsp = hsp;
life = irandom_range(1,3);
hits = 0;

with(instance_create_layer(x,y,"Hunters",oHunterHead)){
	myBody = other;
	other.myHead = self;
}




function speak(say){
	RoomControl.playSoundAt(myHead.hunterEmitter,myHead.x,myHead.y,say,myHead.hunterLowShift,myHead.hunterHighShift);
}