/// @description Insert description here
// You can write your code in this editor

lifeCounter = 0;
mature = false;
growthLatency = 6000;
seedCounter = 0;
seedLatency = 3;
minSeeds = 1;
maxSeeds = 3;
deathCounter = 0;
deathLatency = 2;
myGrav = pointer_null;
with(instance_create_layer(0,0,"GameComponents",motionController))
{
	myBody = other;
	gravMultiplier = 20;
	baseOffset = -3;
	other.myGrav = self;
}





