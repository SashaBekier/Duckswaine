/// @description Insert description here
// You can write your code in this editor

lifeCounter = 0;
mature = false;
growthLatency = irandom_range(400,800);
seedCounter = 0;
seedLatency = irandom_range(400,800);
minSeeds = 1;
maxSeeds = 3;
deathCounter = 0;
deathLatency = irandom_range(50,200);
myGrav = pointer_null;
maxSize = random_range(2.5,3.5);

with(instance_create_layer(0,0,"GameComponents",motionController))
{
	myBody = other;
	gravMultiplier = 20;
	baseOffset = -3;
	other.myGrav = self;
}





