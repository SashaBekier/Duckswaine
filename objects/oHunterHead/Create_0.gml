/// @description Insert description here
// You can write your code in this editor

image_speed = 0;
image_index = 0;

vision = 900;

casualLook = .03;
sharpLook = .15;
lookAt = pointer_null;

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

function canSeeThis(inst, moveDir)
{
	if(abs(x-inst.x)< 5) return false;
	if (variable_instance_exists(inst,"isHidden"))
	{
		if(inst.isHidden) return false;
	}
	
	var targDist = point_distance(x,y,inst.x,inst.y);
	var targDir = point_direction(x,y,inst.x,inst.y);
	var targLR = sign(lengthdir_x(targDist,targDir)); //-1 Left, +1 Right
	var targUD = sign(lengthdir_y(targDist,targDir)); //-1 Up, +1 Down

	var canSee = false;

	if(targDist < vision && (moveDir - targLR) < 0.1 && (moveDir - targLR) > -0.1)
	{
		canSee = true;
		var checkingX = x;
		var checkingY = y;
		var xStep = lengthdir_x(5,targDir);
		var yStep = lengthdir_y(5,targDir);
		var done = false;
	
	
		while(!done)
		{
			checkingX += xStep;
			checkingY += yStep;
		
			if(place_meeting(checkingX,checkingY,oBlockLoS))
			{
				done = true;
				canSee = false;
			}
			if(targLR >= 0)
			{
				if(checkingX > inst.x) done = true;
				//show_debug_message("(" + string(checkingX) + "," + string(checkingY) + ") greater than player");
			} 
			else 
			{
				if(checkingX < inst.x) done = true;
			}
			if(checkingX < 0 || checkingX > 4000 || checkingY < 0 || checkingY > 1080)  done = true;
		}
	}
	return canSee;
}