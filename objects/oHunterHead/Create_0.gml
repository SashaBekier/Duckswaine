/// @description Insert description here
// You can write your code in this editor

image_speed = 0;
image_index = 0;

vision = 900;

casualLook = .03;
sharpLook = .15;

bombedLatency = 60;
sinceBombed = bombedLatency;

hunterEmitter = audio_emitter_create();
hunterLowShift = -0.1;
hunterHighShift = 0.1;


function speak(say){
	RoomControl.playSoundAt(hunterEmitter,x,y,say,hunterLowShift,hunterHighShift);
}
function bubble(sprite){
	with(instance_create_layer(x-5,y-8,"HUD",oTalk))
	{
		sprite_index = sprite;
		xOffset = -15;
		yOffset = -30;
		source = other;
	}
}