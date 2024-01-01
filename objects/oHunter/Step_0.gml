/// @description Insert description here
// You can write your code in this editor


if(x > 4200) || (x < -200){
	instance_destroy();	
	RoomControl.activeHunters--;
}
if(life <= hits){
	isHunting = false;
}

dodgeCount++;
if(isHunting){
	if(dodgeCount >= dodgeDelay)
	{
		if(isDodging) hsp = lastHsp;
		hsp = currentSpeed * sign(hsp);
		isDodging = false;
		sprite_index = sHunter;
	}
} else {
	image_speed = 3;
	if (x > 2000) {
		hsp = 2 * maxSpeed;
	} else if (x <= 2000) {
		hsp = -2 * maxSpeed;
	}
}

if(place_meeting(x+hsp,y,oGround)){
	while(!place_meeting(x+sign(hsp),y,oGround)){
		x += sign(hsp);	
	}
	y--;
}

if(abs(hsp)> 0.1) lastHsp = hsp;
x += hsp;

vsp += RoomControl.grv*4;

if(place_meeting(x,y+vsp-13,oGround)){
	while(!place_meeting(x,y+sign(vsp)-13,oGround)){
		y += sign(vsp);	
	}
	vsp = 0;
} else {
	//y++;	
}

y += vsp;


if(sign(lastHsp) > 0){
	image_xscale = 1;	
} else {
	image_xscale = -1;
}


function pecked()
{
	currentSpeed = max(1,currentSpeed-0.1);	
	dodge();
	oPlayer.hunterPecks++;
}

function diveBombed()
{
	currentSpeed = max(0.5,currentSpeed+0.2);	
	if(!isDodging)
	{
		hsp *= -1;
		life--;
	} 
	else 
	{
		LastHsp *= -1;
		dodgeCount = -60;
	}
}

function dodge()
{
	dodgeCount = 0;	
	hsp = 0;
	isDodging = true;
	sprite_index = sHunterCrouch;
}

