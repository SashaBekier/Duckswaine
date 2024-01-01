hsp = 0;
vsp = 0;

walkSpeed = 1.5;
flightSpeed =8;
flap = 5;
maxLift = -flap;
accLatency = 120;

pooLatency = 40;

flapLatency = 20;
canFlap = true;
onGround = 1;
takeOffFlaps = 3;

wingsTV = .5;
noWingsTV = 3;
diveTV = noWingsTV * 3;

terminalVelocity  = noWingsTV;
sinceFlap = flapLatency;
sincePoo = pooLatency;
isIdle = true;
isDiving = false;
isGlide = false;

maxStamina = 30;
stamina = maxStamina;
idleRegain = 3;
walkRegain = 2;
glideRegain = 2;
baseFlapCost = 1;

carrying = pointer_null;
carryXShift = 0;
carryYShift = 0;


lastDirection = -1; // used by pick up to choose which side if idle.
pecking = false;
peckLatency = 10;
sincePeck = peckLatency;


guiStamBarWidth = 218;
guiStamBarX = 20;
guiStamBarY = 20;
guiStamBarFillXOffset = 6;

guiStamPx = guiStamBarWidth + 3;

guiStamBarInstance = pointer_null;

isHidden = false;


poosDone = 0;
headShots = 0;
longestDrop = 0;
longDrops = 0;
hitStreak = 0;
bestStreak = 0;

hunterPecks = 0;

bombCount = 0;
longBombs = 0;
longestBomb = 0;

bombY = 1000;