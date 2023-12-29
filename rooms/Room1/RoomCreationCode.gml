/// @description Insert description here
// You can write your code in this editor
//generate ground
makeGround(-200,4200,960,760,2,0.5);
makeGrass(50,50,3950);


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
		with(instance_create_layer(irandom_range(leftX,rightX),600,"Poo",oPeckable))
		{
			sprite_index = sGrassYellow;
			if(x > 1800 && x < 2200) instance_destroy(self);
		}
		count--;
	}
	with(instance_create_layer(1850,600,"LoSTrees",oBlockLoS))
		{
			sprite_index = sShrub01;
		}
	
}


