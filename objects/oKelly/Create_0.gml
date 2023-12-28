/// @description Insert description here
// You can write your code in this editor
vsp = 0;
isFalling = true;


lastNest = 0;
patience = 1200; 
minPatience = 600;
waitCounter = 0;

humanCounter = 0;


kellyEmitter = audio_emitter_create();
kellyLowShift = 0.1;
kellyHighShift = 0.3;


function speak(say){
	RoomControl.playSoundAt(kellyEmitter,x,y,say,kellyLowShift,kellyHighShift);
}

function bubble(sprite){
	with(instance_create_layer(x-5,y-8,"HUD",oTalk))
	{
		sprite_index = sprite;
		xOffset = -5;
		yOffset = -8;
		source = other;
	}
}