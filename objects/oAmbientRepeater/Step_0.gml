/// @description Insert description here
// You can write your code in this editor


delayCounter++;

if(delayCounter >= thisDelay)
{
	audio_play_sound_on(myEmitter,mySound,false,2,random(RoomControl.maxAmbientVolume),0,random_range(.9,1.1));
	delayCounter = 0;
	show_debug_message("Sound Triggered");
	if(random(1) < repeatProb)
	{
		thisDelay=irandom_range(minDelay,maxDelay);
	}
	else 
	{
		RoomControl.activeSounds--;
		instance_destroy(self);
	}
}







