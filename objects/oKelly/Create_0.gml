/// @description Insert description here
// You can write your code in this editor
with(instance_create_layer(0,0,"GameComponents",motionController))
{
	myBody = other;
	gravMultiplier = 20;
	baseOffset = 0;
}



isHidden = false;
lastNest = 0;
hunterComplain = false;
patience = 1200; 
minPatience = 600;
waitCounter = 0;

humanCounter = 0;
humanLatency = 180;

kellyEmitter = audio_emitter_create();
kellyLowShift = 0.1;
kellyHighShift = 0.3;



function speak(say){
	RoomControl.playSoundAt(kellyEmitter,x,y,say,kellyLowShift,kellyHighShift);
}

function bubble(sprite){
	with(instance_create_layer(x-5,y-40,"HUD",oTalk))
	{
		sprite_index = sprite;
	}
}


speak(DuckHappy);
bubble(sBubbleHeart);
