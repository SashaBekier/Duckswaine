/// @description Insert description here
// You can write your code in this editor



if(activeSounds < targSounds)
{
	with(instance_create_layer(0,0,"LoSTrees",oAmbientRepeater))
	{
		var choice = irandom_range(0,array_length(other.ambientSounds)-1);
		mySound = other.ambientSounds[choice][0];
		minDelay = other.ambientSounds[choice][1];
		maxDelay = other.ambientSounds[choice][2];
		repeatProb = other.ambientSounds[choice][3];
	}
	activeSounds++;
}
