//catch player inputs
var goRight = keyboard_check(vk_right)||keyboard_check(ord("D"));
var goLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
var goDive =  keyboard_check(vk_down) || keyboard_check(ord("S"));
var doGlide = (onGround > takeOffFlaps && keyboard_check(vk_shift));
var doPeck = (onGround == 0 && carrying == pointer_null && keyboard_check(vk_space));
var tryFlap = keyboard_check(vk_up) || keyboard_check(ord("W"));
var doPoo = (sincePoo >= pooLatency && onGround > 0 && keyboard_check(vk_space));
var doWak = (keyboard_check_pressed(vk_control));
var setNest = (keyboard_check(ord("N")) && !RoomControl.isNestSet && onGround == 0);

//combines horizontal inputs
var move = goRight - goLeft;

if(doPeck)pecking = true;
if(pecking) move = 0;

if (x + hsp >= 3968) {
	move = 0;
	hsp = 0.01;
	x = 3967;
} 
if (x + hsp <= 32) {
	move = 0;
	hsp = -0.01;
	x = 33;
} 


if(doPoo){
	sincePoo = 0;
	poosDone++;
	instance_create_layer(x-(8*sign(hsp)),y,"Poo",oPoo);
} else {
	sincePoo++;
}

if(goDive){
	if(!isDiving)
	{
		bombY = y;
		isDiving = true;
	}
	vsp += flightSpeed/3;
	if(terminalVelocity < diveTV){
		terminalVelocity += (diveTV-terminalVelocity)/20	;
	}
} else {
	if(isDiving)
	{
		isDiving = false;
		bombY=2000;
	}
	if(doGlide){
		
		if(terminalVelocity > wingsTV){
			terminalVelocity -= wingsTV/10;
		}
		if(canFlap && !isGlide){
			isGlide = true;
			if(terminalVelocity > wingsTV){
				terminalVelocity -= wingsTV/2;
				vsp = min(vsp,terminalVelocity);
			}
		}
	} else {
		isGlide = false;
		if(terminalVelocity < noWingsTV){
			terminalVelocity += noWingsTV/10	;
		}	
	}
}


if(onGround < takeOffFlaps){
	hsp += move * walkSpeed / 10;
	if(abs(hsp) > walkSpeed){
		hsp = walkSpeed * sign(hsp);
	}
} else {
	
	if(abs(hsp)>flightSpeed){
		hsp = flightSpeed * sign(hsp);
	} else {
		var acc = accLatency;
		if(sign(hsp)!=sign(move)){
			acc = 20;
		}
		hsp += move * flightSpeed / acc;
	}
}

if(move == 0){
	if(onGround == 0){
		hsp = hsp * 9 / 10;
	} else {
		hsp = hsp *199/200;
	}
}

if(place_meeting(x+hsp,y,oGround)){
	while(!place_meeting(x+sign(hsp),y,oGround)){
		x += sign(hsp);	
	}
	y--;
}


if(abs(hsp)>10)hsp = sign(hsp) * 10;
x += hsp;
if(hsp != 0){
	lastDirection = sign(hsp);	
}




vsp += RoomControl.grv;

sinceFlap += 1;
var flapCost = baseFlapCost;
if(onGround < takeOffFlaps) flapCost *= 2;
if(sinceFlap > flapLatency && stamina >= flapCost){
	canFlap = true;
}

if(tryFlap && canFlap){
	//taking off is hard
	if(onGround < takeOffFlaps){
		vsp -= (flap / 2);
		stamina -= flapCost;
	} else {
		vsp -= flap;
		stamina -= flapCost;
	}
	//allows for flap latency to prevent excessive flap
	sinceFlap = 0;
	canFlap = false;
	
	//tracks flaps since duck was on ground for take off animations
	onGround += 1;
	
	//turns off glide status as glide requires canflap
	isGlide = false;
}


if(vsp < maxLift){
	vsp = maxLift;
}




if(place_meeting(x,y+vsp,oGround)){
	if(vsp >0){
		while(!place_meeting(x,y+sign(vsp),oGround)){
			y += sign(vsp);	
		}
		vsp = 0;
		onGround = 0;
	}
}

if(vsp > terminalVelocity){
	vsp = terminalVelocity;
}

//keeps duck fully on the screen when at flight ceiling
if(y + vsp < 32){
	y = 32;
	vsp = 0;
} else {
	y += vsp;
}



isHidden = place_meeting(x,y,oConcealment);

if(setNest)
{
	instance_create_layer(x-30,y,"Nest",oNest);
	RoomControl.isNestSet = true;
}




if(abs(hsp) < 0.2 && move == 0){
	isIdle = true;
} else {
	isIdle = false;
}

if(pecking) isIdle = false;

image_speed = 1;
if(onGround==0 && isIdle){
	sprite_index = sPlayerIdle;
	stamina += idleRegain/60;
} else if (pecking){
	sprite_index = sPlayerPeck;
} else if (onGround==0 && !pecking){
	sprite_index = sPlayerRun;
	stamina += walkRegain/60;
} else if (onGround == 1){ //first flap
	sprite_index = sPlayerTO1;
} else if (onGround > 0 && onGround<= takeOffFlaps){ //taking off
	image_speed = 2;
	sprite_index = sPlayerFly; 
} else if (isDiving) { //diving
	sprite_index = sPlayerDive;
} else if (!isGlide || (sinceFlap < 50)) { //flying sinceflap check ensures  
	if(vsp <= 3 * wingsTV || (sinceFlap < 50)) { //the full flap animation plays
		sprite_index = sPlayerFly;
	} else {
		sprite_index = sPlayerDesc;
		stamina += walkRegain/60;
	}
} else { //glide
	sprite_index = sPlayerFly;
	image_index = 0;
	image_speed = 0;
	stamina += glideRegain/60;
}//will need to think about a pulling up from the dive and landing anims at some time

if(sign(hsp) > 0){
	image_xscale = 1;	
} else {
	image_xscale = -1;
}

if(stamina>maxStamina) stamina = maxStamina;

sincePeck++;
if(pecking)
{
	if(image_index > 1.999 && image_index < 3 && sincePeck >= peckLatency) // the peck frame
	{
		if(place_meeting(x+(37*sign(lastDirection)),y+29,oPeckable)){
			if(carrying == pointer_null)
			{
				instance_place(x+(37*sign(lastDirection)), y+29,oPeckable).pecked();
				sincePeck =0;
			}
		}
		if(place_meeting(x+(37*sign(lastDirection)),y+29,oCarryable)){
			if(carrying == pointer_null)
			{
				carrying = instance_place(x+(37*sign(lastDirection)), y+29,oCarryable);
				carrying.isFalling = false;
				carrying.isCarried = true;
			}
		}
		if(place_meeting(x+(37*sign(lastDirection)),y+29,oHunter) ){
			if(carrying == pointer_null)
			{
				var targ = instance_place(x+(37*sign(lastDirection)), y+29,oHunter);
				if(sign(lastDirection) == sign(targ.hsp)){
					targ.pecked();
					sincePeck = 0;
				}
			}
		}
	}
	
	if(image_index >= 4.01) pecking = false;
}


if(carrying != pointer_null)
{
	carrying.image_angle = 0;
	if(sprite_index == sPlayerIdle)
	{
		if(image_index < 1)
		{
			carryXShift = -1;
			carryYShift = -10;
		} 
		else if (image_index < 2)
		{
			carryXShift = 5;
			carryYShift = -11;
		} 
		else if (image_index < 3)
		{
			carryXShift = 10;
			carryYShift = -9;
		} 
		else 
		{
			carryXShift = 5;
			carryYShift = -11;
		}	
	}
	else if (sprite_index == sPlayerDesc)
	{
		carryXShift = 27;
		carryYShift = -2;	
	} 
	else if (sprite_index == sPlayerDive)
	{
		carrying.image_angle = -135;
		carryXShift = 18;
		carryYShift = 16;
	}
	else if (sprite_index == sPlayerFly)
	{
		if(image_index < 1)
		{
			carryXShift = 27;
			carryYShift = -1;
		}
		else if (image_index < 2)
		{
			carryXShift = 28;
			carryYShift = 4;
		}
		else if (image_index < 3)
		{
			carryXShift = 27;
			carryYShift = -1;
		}
		else 
		{
			carryXShift = 27;
			carryYShift = -7;
		}	
	}
	else if (sprite_index == sPlayerRun)
	{
		if(image_index < 1)
		{
			carryXShift = 19;
			carryYShift = 4;
		}
		else if (image_index < 2)
		{
			carryXShift = 21;
			carryYShift = 6;
		}
		else if (image_index < 3)
		{
			carryXShift = 19;
			carryYShift = 4;
		}
		else 
		{
			carryXShift = 19;
			carryYShift = 6;
		}	
	}
	else if (sprite_index == sPlayerTO1)
	{
		while(image_index >= 5)
		{
			image_index -= 5;
		}
		if(image_index < 1)
		{
			carryXShift = 22;
			carryYShift = -16;
		}
		else if (image_index > 3.999 && image_index < 5)
		{
			carryXShift = 14;
			carryYShift = -22;
		}
		else 
		{
			carryXShift = 22;
			carryYShift = -22;
		}	
	} 
	else if (sprite_index == sPlayerPeck)
	{
		if(image_index < 3)
		{
			carryXShift = 27;
			carryYShift = 29;
		}
		else if (image_index < 4)
		{
			carryXShift = 25;
			carryYShift = 12;
		}
		else if(image_index < 5)
		{
			carryXShift = 20;
			carryYShift = 16;
		}
		
	}
	if(sign(lastDirection) < -0.1) carryXShift *= -1;	
	carrying.x = x + carryXShift;
	carrying.y = y + carryYShift;
}


if(doWak)
{
	if(carrying != pointer_null)
	{
		carrying.myGrav.isFalling = true;
		carrying.isCarried = false;
		carrying.myGrav.hsp = hsp;
		carrying.myGrav.vsp = vsp;
		carrying = pointer_null;
	} 
	else
	{
		//play wak sound
		audio_play_sound(DuckWak,0,0,1,0,random_range(-.1,.1)+1);
	}
}

audio_listener_position(x,y,0);
