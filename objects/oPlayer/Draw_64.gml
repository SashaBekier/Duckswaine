/// @description Insert description here
// You can write your code in this editor
var fillPx = (oPlayer.stamina/oPlayer.maxStamina) * (guiStamBarWidth + 3) ;

if(guiStamPx > fillPx)
{
	guiStamPx -= 0.5;
} else if (guiStamPx < fillPx){
	guiStamPx += 0.5;	
}

draw_sprite(sStamBarOpac,0,20,20);

var bar = sStamBarFillBody;
if(stamina < takeOffFlaps * baseFlapCost * 2) bar = sStamBarFillBodyRed;

draw_sprite_part(bar,0,0,0,guiStamPx+5,50,20,20);

draw_sprite(sStamBarFrame,0,20,20);


draw_set_font(Curly);
draw_set_color(c_black);


draw_text(oCamera.viewWidth-268,22,"Score: " + string(pScore));



draw_sprite(sTimer,0,oCamera.viewWidth - 200,70);
draw_text(oCamera.viewWidth - 148,72,RoomControl.timeBonus);


draw_set_color(c_green);

draw_text(oCamera.viewWidth-270,20,"Score: " + string(pScore));
if(RoomControl.timeBonus < 0) draw_set_color(c_red);
draw_text(oCamera.viewWidth - 150,70,RoomControl.timeBonus);

with(RoomControl)
{
	if(frameCount%6 == 0)
	{
		timeBonus--;	
	}
	
}

