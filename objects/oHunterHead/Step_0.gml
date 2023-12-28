/// @description Insert description here
// You can write your code in this editor
var moveDir = sign(myBody.lastHsp);

if(myBody.isDodging)
{
	x = myBody.x - (moveDir * 6);
	y = myBody.y-116;
}
else 
{
	x = myBody.x + (moveDir * 10);
	y = myBody.y-152;
}
sinceBombed++;

var targDist = point_distance(x,y,oPlayer.x,oPlayer.y);
var targDir = point_direction(x,y,oPlayer.x,oPlayer.y);
var targLR = sign(lengthdir_x(targDist,targDir)); //-1 Left, +1 Right
var targUD = sign(lengthdir_y(targDist,targDir)); //-1 Up, +1 Down

if(targDist < vision && (moveDir - targLR) < 0.1 && (moveDir - targLR) > -0.1){
	if(targLR < 0.1) targDir += 180;
	
	
	image_angle += angle_difference(targDir, image_angle) * sharpLook;
	
	//clamps the image Angle
	if( image_angle > 75 && image_angle < 95) image_angle = 75;
	if( image_angle < 285 && image_angle > 265) image_angle = 285;
	
	if(targDist < 150 && oPlayer.sprite_index == sPlayerDive)
	{
		myBody.dodge();	
	}
} else {
	image_angle += angle_difference(0, image_angle) * casualLook;
}



if(moveDir > 0){
	image_xscale = 1;	
} else {
	image_xscale = -1;
}

if(x > 4180) || (x < -180){
	instance_destroy();	
}

audio_emitter_position(hunterEmitter,x,y,0);