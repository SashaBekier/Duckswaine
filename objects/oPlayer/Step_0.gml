//catch walking over a cliff.
if(onGround && !place_meeting(x, y+20,oGround)){
	onGround = false;
}
vsp += RoomControl.grv;
sinceFlap += 1;

//things that are the same in the air as on the ground
if(myInputs.doPassive)
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
		audio_play_sound(DuckWak,0,0,1,0,random_range(-.1,.1)+1);
	}
}

if(onGround)
{
	if( myInputs.move == 0) hsp *= 0.9;
	
	isHidden = place_meeting(x,y,oConcealment);
	
	if(myInputs.doAttack)pecking = true;
	if(pecking) myInputs.move = 0;
	
	//if(abs(hsp)<0.2) isIdle = true;
	if(!RoomControl.isNestSet && myInputs.doAlt)
	{
		instance_create_layer(x,y,"Nest",oNest);
		RoomControl.isNestSet = true;
	}
	hsp += myInputs.move * walkSpeed / 10;
	if(abs(hsp) > walkSpeed) hsp = walkSpeed * sign(hsp);
	
	if(!canFlap && sinceFlap > flapLatency && stamina >= baseFlapCost * 2) canFlap = true;
	if(myInputs.tryFlap && canFlap) onGround = false;
	
}
if(!onGround) 
{
	
	if( myInputs.move == 0) hsp *= 0.99;
	var flapCost = baseFlapCost;
	if(flapsSinceTakeOff < takeOffFlaps)
	{
		hsp += myInputs.move * walkSpeed / 10;
		if(abs(hsp) > walkSpeed) hsp = walkSpeed * sign(hsp);
		flapCost *= 2;
	}
	else 
	{
		if(abs(hsp)>flightSpeed) hsp = flightSpeed * sign(hsp);
		else 
		{
			var acc = accLatency;
			if(sign(hsp)!=sign( myInputs.move)) acc = 20;
			hsp +=  myInputs.move * flightSpeed / acc;
		}
	}
	
	isHidden = false;
	if(myInputs.doAttack && sincePoo > pooLatency)
	{
		sincePoo = 0;
		poosDone++;
		instance_create_layer(x-(8*sign(hsp)),y,"Poo",oPoo);
	} 
	else 
	{
		sincePoo++;
	}
	
	if(myInputs.goDive)
	{
		if(!isDiving)
		{
			bombY = y;
			isDiving = true;
		}
		if(abs(vsp)*2 < diveTerminalVelocity) vsp += (diveTerminalVelocity-vsp)/20;
		else vsp = diveTerminalVelocity;
	}
	else if(isDiving)
	{
		isDiving = false;
		bombY=2000;
	}
	
	if(!canFlap && sinceFlap > flapLatency && stamina >= flapCost) canFlap = true;
	if(myInputs.tryFlap && canFlap && !isDiving)
	{
		//taking off is hard
		if(flapsSinceTakeOff < takeOffFlaps)
		{
			vsp -= (flap / 2);
			stamina -= flapCost;
		} else 
		{
			vsp -= flap;
			stamina -= flapCost;
		}
		//allows for flap latency to prevent excessive flap
		sinceFlap = 0;
		canFlap = false;
	
		//tracks flaps since duck was on ground for take off animations
		flapsSinceTakeOff++;
		onGround = false;
	
		//turns off glide status as glide requires canflap
		isGlide = false;
		vsp = min(wingsTV,vsp);
		show_debug_message("Making it to try to flap");
	}

	if(canFlap && abs(hsp)>minGlideHsp && !isDiving) isGlide = true;
	else 
	{
		isGlide = false;
		myInputs.doAlt = true;
	}
	if(isGlide)
	{
		vsp = min(vsp,wingsTV);	
	}
	if(myInputs.doAlt && !isDiving)
	{
		vsp = min(vsp,noWingsTV);
		isGlide = false;
	}
	if(isDiving){
		if(vsp < diveTerminalVelocity) vsp += (diveTerminalVelocity-vsp)/20;
	}	
}

vsp = max(maxLift,vsp);

if(place_meeting(x,y+vsp,oGround))
{
	if(vsp >0)
	{
		while(!place_meeting(x,y+sign(vsp),oGround)) y += sign(vsp);	
		vsp = 0;
		onGround = true;
		isLanding = false;
		flapsSinceTakeOff = 0;
	}
}

if(place_meeting(x+hsp,y-maxUpStep,oGround)) hsp = 0;
else if(place_meeting(x+hsp,y,oGround))
{
	while(!place_meeting(x+sign(hsp),y,oGround)) x += sign(hsp);
	y--;
} 
x += hsp;

if(hsp != 0) lastDirection = sign(hsp);	

//keeps duck fully on the screen when at flight ceiling
if(y + vsp < 32)
{
	y = 32;
	vsp = 0;
} 
else 
{
	y += vsp;
}

if (x + hsp >= 5968) 
{
	myInputs.move = 0;
	hsp = 0.01;
	x = 5967;
} 
else if (x + hsp <= 32) 
{
	myInputs.move = 0;
	hsp = -0.01;
	x = 33;
} 


//move stuff ends here - x and y are now known
audio_listener_position(x,y,0);

if(abs(hsp) < 0.2 &&  myInputs.move == 0){
	isIdle = true;
} else {
	isIdle = false;
}

if(pecking) isIdle = false;

image_speed = 1;
if(onGround)
{
	if(isIdle)
	{
		sprite_index = sPlayerIdle;
		stamina += idleRegain/60;
	}
	else if (pecking) sprite_index = sPlayerPeck;
    else 
	{
		sprite_index = sPlayerRun;
		stamina += walkRegain/60;
	}
} 
else if (flapsSinceTakeOff == 1) sprite_index = sPlayerTO1;
else if (flapsSinceTakeOff <= takeOffFlaps)
{ //taking off
	image_speed = 2;
	sprite_index = sPlayerFly; 
} 
else if (place_meeting(x, y+30,oGround))
{
	sprite_index = sPlayerTO1;
	if(!isLanding) image_index = 4;
	isLanding = true;
	if(vsp > 2) vsp *= 0.5;
	else vsp *=0.99;
	vsp = max(vsp,0.01);
	hsp *= .99;
	
}
else if (isDiving) sprite_index = sPlayerDive;
else if (!isGlide) 
{												 
	//flying sinceflap check ensures flap animation is finished  
	if(!canFlap) 
	{ 
		sprite_index = sPlayerFly;
	} 
	else 
	{
		sprite_index = sPlayerDesc;
		stamina += walkRegain/60;
	}
} 
else 
{ //glide
	sprite_index = sPlayerFly;
	image_index = 0;
	image_speed = 0;
	stamina += glideRegain/60;
}



if(stamina>maxStamina) stamina = maxStamina;

sincePeck++;
if(pecking)
{
	if(image_index > 1.999 && image_index < 3 && sincePeck >= peckLatency && carrying == pointer_null) // the peck frame
	{
		var peckX = x+(37*sign(lastDirection));
		var peckY = y+29;
		if(place_meeting(peckX,peckY,oPeckable))
		{
			instance_place(peckX,peckY,oPeckable).pecked();
			sincePeck =0;
		}
		if(place_meeting(peckX,peckY,oCarryable))
		{
			carrying = instance_place(peckX,peckY,oCarryable);
			carrying.isFalling = false;
			carrying.isCarried = true;
		}
		if(place_meeting(peckX,peckY,oHunter) )
		{
			var targ = instance_place(peckX,peckY,oHunter);
			if(sign(lastDirection) == sign(targ.hsp))
			{
				targ.pecked();
				sincePeck = 0;
			}
		}
	}
	
	if(image_index >= 4.5) pecking = false;
}

if(sign(hsp) > 0){
	image_xscale = 1;	
} else {
	image_xscale = -1;
}


//setting the carry point based on the sprite and animation frame - this goes on and on my friend.
//there is nothing south of this  - I'm sure there is a clever way to do this with arrays.
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
	if(sign(lastDirection) < -0.1) carryXShift *= -1;	//uses last direction to catch move = 0
	carrying.x = x + carryXShift;
	carrying.y = y + carryYShift;
}





