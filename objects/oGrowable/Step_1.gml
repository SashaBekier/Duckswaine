/// @description Insert description here
// You can write your code in this editor


lifeCounter++;

if(sprite_index == sGrassYellow && lifeCounter % growthLatency == 0 )
{
	if(image_yscale < 3) image_yscale += 0.1;
	else if (mature == false)
	{
		mature = true;
	} 
	else 
	{
		if(seedCounter < seedLatency)
		{
			seedCounter++;
			if(seedCounter == seedLatency)
			{
				var seedCount = irandom_range(minSeeds,maxSeeds-1);
				var i = 0;
				while(i<seedCount)
				{
					with(instance_create_layer(x,y-sprite_height,"Hunters",oGrowable))
					{
						sprite_index = sSeed;
						image_xscale = 0.4;
						image_yscale = 0.4;
						myGrav.gravMultiplier = 1;
						myGrav.hsp = random_range(1,3);
						if(random(1) > 0.5) myGrav.hsp *= -1;
						myGrav.vsp = random_range(-4,-1);
						deathLatency = 1200;
						
					}
					i++;
				}
			}
		} 
		else 
		{
			if(deathCounter < deathLatency) deathCounter++;
			else 
			{
				with(instance_create_layer(x,y,"Hunters",oCarryable))
				{
						sprite_index = sGrassCarry;
						x = other.x;
						y = other.y;
			
				}
				instance_destroy(self);
			}
		}
	}
}

if(sprite_index == sSeed)
{
	if(lifeCounter > deathLatency)
	{
		with(instance_create_layer(x,y,"Hunters",oGrowable))
				{
						sprite_index = sGrassYellow;
						image_yscale = 0.3;
						x = other.x;
						y = other.y;
			
				}
				instance_destroy(self);
	}
}











