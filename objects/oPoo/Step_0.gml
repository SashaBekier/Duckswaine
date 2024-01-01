/// @description Insert description here
// You can write your code in this editor

vsp += RoomControl.grv;

x += hsp;

if(place_meeting(x,y+vsp,oGround)){
	while(!place_meeting(x,y+sign(vsp),oGround)){
		y += sign(vsp);	
	}
	vsp = 0;
	sprite_index = sPooGround;
	isFlying = false;
	hsp = 0;
	if(oPlayer.hitStreak > oPlayer.bestStreak) oPlayer.bestStreak = oPlayer.hitStreak;
	oPlayer.hitStreak = 0;
}

y += vsp;




if(sign(hsp) > 0){
	image_xscale = 1;	
} else {
	image_xscale = -1;
}


