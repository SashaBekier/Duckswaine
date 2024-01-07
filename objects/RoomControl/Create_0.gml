/// @description Insert description here
// You can write your code in this editor
level = 1;
isNestSet = false;
sinceNestSet = 0;

frameCount = 0;

activeHunters = 0;
grv = 0.1;
maxHunters = 2;
hunterLatency = 120;
hunterSpawned = hunterLatency;
roomWidth = 6000; //there must be a way to dynamically generate this


activeSounds = 0;
targSounds = 10;
maxAmbientVolume = 0.4;


ambientSounds = [ 
					[chirp01,60,360,.8],
					[chirp02,60,600,.5],
					[chirp03,60,360,.5],
					[chirp04,60,360,.5],
					[chirp05,60,360,.5],
					[chirp06,60,360,.5],
					[chirp07,60,360,.5],
					[chirp08,60,360,.5],
					[chirp09,60,360,.5],
					[chirp10,60,360,.5],
					[chirp11,60,360,.5],
					[chirp12,60,360,.5],
					[chirp13,60,360,.5],
					[chirp14,60,360,.5],
					[chirp15,60,360,.75],
					[chirp16,60,360,.75],
					[chirp17,60,360,.75],
					[chirp18,60,360,.75],
					[chirp19,60,360,.75],
					[chirp20,60,360,.75],
					[magpie,600,6000,0.5],
					[df1,15,30,.9],
					[df2,15,30,.9],
					[df3,15,30,.9],
					[frog01,60,360,.8],
					[frog02,60,360,.8],
					[frog03,60,360,.8],
					[frog04,60,360,.8],
					[frog05,60,360,.8],
					[frog06,60,360,.8],
					[frog08,60,360,.8],
					[frog09,60,360,.8],
					[frog10,60,360,.8],
					[frog11,60,360,.8],
					[frog12,60,360,.8],
					[frog13,60,360,.8],
					[frog14,60,360,.8],
					[frog15,60,360,.8],
					[frog16,60,360,.8],
					[frog17,60,360,.8],
					[frog18,60,360,.8],
					[frog19,60,360,.8],
					[frog20,60,360,.8],
					[frog21,60,360,.8],
					[frog22,60,360,.8],
					[frog23,60,360,.8],
					[frog24,60,360,.8],
					[frog25,60,360,.8],
					[frog26,60,360,.8],
					[frog27,60,360,.8]
				];
					
					


audio_max_range = 2500;
audio_drop_off_start = 300;
audio_drop_off_rate = 1;
audio_falloff_set_model(audio_falloff_linear_distance);

leftSound = audio_emitter_create();
audio_emitter_position(leftSound,-1,0,0);
rightSound = audio_emitter_create();
audio_emitter_position(rightSound,4001,0,0);


function playSoundAt(emitter,xCoord,yCoord,sound,lowShift,highShift)
{
	var targDist = point_distance(xCoord,yCoord,oPlayer.x,oPlayer.y);
	audio_play_sound_on(emitter,sound,0,100,1-(targDist/2500),targDist/1000,random_range(lowShift,highShift)+1);
}

screenWidth = view_get_wport(0);