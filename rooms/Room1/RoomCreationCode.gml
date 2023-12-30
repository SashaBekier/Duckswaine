/// @description Insert description here
// You can write your code in this editor
//generate ground
makeGround(-200,4200,960,760,1,0.5);
makeGrass(50,50,3950);
var trees = [sTree01,sTree02,sTree03,sTree04,sTree05,sTree06,sTree07,sTree08,sTree09,sTree10];
distributeObjects(trees,oBlockLoS,"LoSTrees",500,1000,0,0,4000);
var shrubs = [sS01,sS02, sS03, sS04, sS05, sS06, sS07, sS08, sS09, sS10, sS11, sS12, sS13, sS14, sS15];
distributeObjects(shrubs,oConcealment,"LoSTrees",20,400,.5,0,4000);

//start is the beginning of the ground as x position
//end is the end of the ground as x position
//low is the highest value y position the ground can take
//high is the lowest value y position the ground can take
//step is the maximum change in y position from x -> x+1
//roughness is a value from 0-1 it effects the likelyhood of a y change
//      and the intensity of a y change. values near 1 will produce jagged
//		terrain while values near 0 will produce relatively flat terrain
function makeGround(start,stop,low,high,step,rough)
{
	randomise();
	var nextX = start;
	var lastY = mean(low,high)
	while(nextX <= stop)
	{
		var flatCount = 5; //will set x-scale factor
		var stepSize = 1; //will set the scale of change in y
		var change = 1; //will set the direction of change in y (-1 is up, +1 is down)
		
		var amplitude = 1 + rough;
		var period = (stop-start) / (20*(1-rough));
		var offset = sin((nextX/period)*pi) * amplitude;
		offset += sin((nextX/period)*pi/amplitude*2) * amplitude/2;
		
		
		while((random(1)-(flatCount/100))>rough && nextX+flatCount < stop) flatCount+=5;
		while(random(1)<rough && stepSize <=step) stepSize++;
		if(random(1) < (lastY-high)/(low-high)) change = -1;
		lastY += stepSize*change-offset;
		if(lastY < high) lastY = high;
		if(lastY > low) lastY = low;
		with(instance_create_layer(nextX,lastY,"GroundCollider",oGround))
		{
			image_xscale = flatCount;
		}
		nextX += flatCount;
	}
}



function makeGrass(count, leftX, rightX)
{
	while(count > 0)
	{
		with(instance_create_layer(irandom_range(leftX,rightX),759,"Poo",oPeckable))
		{
			sprite_index = sGrassYellow;
			image_yscale = random_range(1,3);
			if(x > 1800 && x < 2200) instance_destroy(self);
		}
		count--;
	}
	
}

function distributeObjects(pool,obj,onLayer,minGap, maxGap,clumping, startAt, endAfter)
{
	var last2 = 0;
	var last1 = 0;
	var doAt = startAt+minGap;
	while(doAt < endAfter)
	{
		var poolIndex = 0;
		while((poolIndex == last2 || poolIndex == last1) && array_length(pool) > 3)
		{
			poolIndex = irandom_range(0,array_length(pool)-1);	
		}
		last2 = last1;
		last1 = poolIndex;
		var spriteW = 0;
		with(instance_create_layer(doAt,759,onLayer,obj))
		{
			sprite_index = pool[poolIndex];
			image_yscale = random_range(.75,1.25);
			image_xscale = random_range(.9,1.1);
			if(random(1) > .5) image_xscale *= -1;
			spriteW = abs(sprite_width*image_xscale);
		}
		if(random(1) > clumping)
		{
			doAt += minGap + irandom_range(0,maxGap-minGap);
		} 
		else 
		{
			doAt += spriteW*random_range(0.3,0.6);
		}
	}
		
}

