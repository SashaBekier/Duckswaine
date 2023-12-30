/// @description Insert description here
// You can write your code in this editor

mySound = frog01;
minDelay = 30;
maxDelay = 120;
repeatProb = 0.5;


delayCounter = irandom_range(0,minDelay);
thisDelay = irandom_range(minDelay,maxDelay);

myEmitter = RoomControl.leftSound;
if(random(1)>0.5) myEmitter = RoomControl.rightSound;




