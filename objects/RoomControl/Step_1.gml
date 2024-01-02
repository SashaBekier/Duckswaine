/// @description Insert description here
// You can write your code in this editor

var nestCheck = 2;
if(RoomControl.isNestSet)
{
	nestCheck = oNest.image_index;
	sinceNestSet++;
}

frameCount++;

if (activeHunters < max(maxHunters,nestCheck)) && (hunterSpawned > hunterLatency){
	var side = irandom_range(0,1);
	var xtarg = -100;
	if(side == 1){
		xtarg = roomWidth + 100;
	}
	instance_create_layer(xtarg,500,"Hunters",oHunter);
	activeHunters++;
	hunterSpawned = 0;
}
hunterSpawned++


audio_listener_position(oPlayer.x,oPlayer.y,0);
audio_listener_orientation(0, 0, 1, 0, -1, 0);

