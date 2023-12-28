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





