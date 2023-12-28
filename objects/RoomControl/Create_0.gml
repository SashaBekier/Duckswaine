/// @description Insert description here
// You can write your code in this editor


activeHunters = 0;
grv = 0.1;
maxHunters = 2;
hunterLatency = 360;
hunterSpawned = 360;



audio_max_range = 2500;
audio_drop_off_start = 300;
audio_drop_off_rate = 1;
audio_falloff_set_model(audio_falloff_linear_distance);




function playSoundAt(emitter,xCoord,yCoord,sound,lowShift,highShift)
{
	var targDist = point_distance(xCoord,yCoord,oPlayer.x,oPlayer.y);
	audio_play_sound_on(emitter,sound,0,1,1-(targDist/2500),0,random_range(lowShift,highShift)+1);
}

