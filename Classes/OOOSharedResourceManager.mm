//
//  OOOSharedResourceManager.m
//  oneonone_stripped
//
//  Created by johan ten broeke on 9/23/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOSharedResourceManager.h"
#import "OOOConfig.h"
#import "OOOSharedLevelmapData.h"
#import "cocos2d.h"
#import "OOOGameViewDecorator.h"
#import "OOOSnapshot.h"


@implementation OOOSharedResourceManager

static OOOSharedResourceManager *OOOSharedResourceManager_=nil;

+ (OOOSharedResourceManager *)get
{
	if (!OOOSharedResourceManager_)
		OOOSharedResourceManager_ = [[OOOSharedResourceManager alloc] init];
	
	return OOOSharedResourceManager_;
}

-(id)init{
	if( (self=[super init])) {
		
		[self reset];
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onDamage:) 
													 name:@"onDamage" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onRefill:) 
													 name:@"onRefill" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onHealthBoost:) 
													 name:@"onHealthBoost" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onBulletTimeGained:) 
													 name:@"onBulletTimeGained" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onBulletTimeConsumed:) 
													 name:@"bulletTime" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onImmunityChanged:) 
													 name:@"onImmunityChanged" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onDeathByToxic:) 
													 name:@"onDeathByToxic" 
												   object:nil];
        [self sniffDeviceEnv];
		if ([[OOOSharedLevelmapData get] hasUpgraded]){
            UPGRADEDBULLETS = 1;
            
        }else{
            UPGRADEDBULLETS = 0;
        }
	}
	return self;
}


-(void)sniffDeviceEnv{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        ipad = YES;
    }else{
        ipad = NO;
    }
}

-(void)notify{
	
	NSNumber *h = [NSNumber numberWithInt:health];
	NSNumber *b = [NSNumber numberWithInt:numBullets];
	NSNumber *bt = [NSNumber numberWithInt:bulletTimes];
	
	NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:b,@"numBullets",h,@"health",bt,@"bulletTimes",nil];

	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onResourcesChanged" 
					   object:nil 
					   userInfo:userInfo]];
	
	//[self printState];
}

-(void)registerCrate{
	numCrates ++;
}

-(void)unRegisterCrate{
	numCrates --;
}

-(void)registerMedicKit{
	numMK ++;
}

-(void)unRegisterMedicKit{
	numMK --;
}

-(void)registerEnemy{
	numEnemies ++;
}

-(void)unRegisterEnemy{
	numEnemies --;
	//NSLog(@"num enemies %i",numEnemies);
	if (numEnemies <= 0) {
        
        NSDate *end_time = [NSDate date];
        int sec = round([end_time timeIntervalSinceDate:start_time]);
        scoreAcumulator += sec;
        
        //NSLog(@"seconds played %i",sec);
        //NSLog(@"acumulatedscore : %i",scoreAcumulator);
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onLevelCleared" 
						   object:nil 
						   userInfo:nil]];
        
      
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onStopCurrentLooped" 
						   object:nil 
						   userInfo:nil]];
        
		NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"happy_chime", @"sound",nil];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onSoundEffect" 
						   object:nil 
						   userInfo:userinfo]];
		
        
        [[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"displayExitAlert" 
						   object:nil 
						   userInfo:nil]];
        
		//victory zoom//
        NSDictionary *zoominfo;
        if(ipad){
            zoominfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:2.0f] ,@"zoomfact",nil];
        }else{
            zoominfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:1.3f] ,@"zoomfact",nil];
        }
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"zoom" 
						   object:nil 
						   userInfo:zoominfo]];
        
	}
}

-(int)bulletTimesLeft{
	return bulletTimes;
}

-(int)currentNumBullets{
	return numBullets;
}

-(int)currentHealth{
	return health;
}

+(BOOL)hasBulletTime{
	if ([OOOSharedResourceManager_ bulletTimesLeft] > 0){
		return YES;
	}else {
		return NO;
	}

}

+(BOOL)canAddBullets{
	if ([OOOSharedResourceManager_ currentNumBullets] >= MAX_NUM_BULLETS) {
		return NO;
	}else {
		return YES;
	}

}

+(BOOL)canAddHealth{
	if ([OOOSharedResourceManager_ currentHealth] >= MAX_HEALTH) {
		return NO;
	}else {
		return YES;
	}
}

-(void)onBulletTimeGained:(NSNotification *)note{
	bulletTimes ++;
    if(bulletTimes > 10){
        bulletTimes = 10;
    }
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"pickup_bullettime", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];
	
	//[self printState];
	[self notify];
}

-(void)onBulletTimeConsumed:(NSNotification *)note{
	bulletTimes --;
	if (bulletTimes <0) {
		bulletTimes = 0;
	}
	[self notify];
}

-(void)onImmunityChanged:(NSNotification *)note{
	//NSNumber *im = [[note userInfo] objectForKey:@"imm"];
	immunity = 0;
}

-(void)resetButKeepBulletTimes{
	numBullets = DEFAULT_NUM_BULLETS;
	jumpPower = DEFAULT_JUMP_POWER;
	health = DEFAULT_HEALTH;
	immunity = 0;
	numEnemies = 0;
	numCrates = 0;
    numMK = 0;
	[self notify];
}

-(void)startTime{
    //NSLog(@"start time");
    [start_time release];
    start_time = [[NSDate date] retain];
}

-(int)scoreForLevel{
    return scoreAcumulator;
}

-(void)resetScore{
    scoreAcumulator = 0;
}

-(void)reset{
	bulletTimes = 0;
	[self resetButKeepBulletTimes];
}

-(void)onDamage:(NSNotification *)note{
	//NSLog(@"1. onDamage: immunity should be 0: %i",immunity);
	if(immunity == 0){
		immunity = 1;
		[self useHealth:20];
		[self notify];
		NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"hero_hurt", @"sound",nil];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onSoundEffect" 
						   object:nil 
						   userInfo:userinfo2]];
	}
}

						  
-(void)onRefill:(NSNotification *)note{
	if(numBullets >= MAX_NUM_BULLETS){
		return;
	}
	NSDictionary *userinfo =nil;
	if(numBullets<=0){
		userinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1], @"wasZero", [[note userInfo] objectForKey:@"sprite1"], @"sprite1",  [[note userInfo] objectForKey:@"sprite2"], @"sprite2", nil];
	}else{
		NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"pickup_bullettime", @"sound",nil];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onSoundEffect" 
						   object:nil 
						   userInfo:userinfo2]];
		userinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0], @"wasZero", [[note userInfo] objectForKey:@"sprite1"], @"sprite1",  [[note userInfo] objectForKey:@"sprite2"], @"sprite2", nil];
	}
	[self addBullets:BULLET_REFILL+UPGRADEDBULLETS];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onRefillDone" 
					   object:nil 
					   userInfo:userinfo]];
	
}

-(void)onHealthBoost:(NSNotification *)note{
	if (health >= MAX_HEALTH) {
		return;
	}
	[self addHealth:HEALTH_BOOST];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onHealthBoostDone" 
					   object:nil 
					   userInfo:[note userInfo]]];
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"pickup_bullettime", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];
	
}

-(void)printState{
	NSLog(@"* * * * * * * * * * * * * * *");
	NSLog(@"recources state:");
	NSLog(@"- - - - - - - - - - - - - - - ");
	NSLog(@"num bullets: %i",numBullets);
	NSLog(@"health: %i",health);
	NSLog(@"jump power: %i",jumpPower);
	NSLog(@"* * * * * * * * * * * * * * *");
	NSLog(@" ");
}

-(void)addBullets:(int)num{
	numBullets += num;
	[self notify];
}

-(void)useBullet{
	numBullets --;
	if (numBullets < 0) {
		numBullets = 0;
	}
	if (numCrates <= 0 && numBullets <= 0 && numEnemies > 0) {
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onNoBulletsLeftInScene" 
						   object:nil 
						   userInfo:nil]];
		//NSLog(@"no bullets!!");
	}
	[self notify];
}

-(int)bulletsLeft{
	return numBullets;
}

-(void)clearBullets{
    numBullets = 0;
    [self notify];
}

-(void)addHealth:(int)hp{
	health += hp;
	[self notify];
}

-(void)onDeathByToxic:(NSNotification*)note{
    [self useHealth:10000];
}

-(void)useHealth:(int)hp{
	health -= hp;
	if (health < 0) {
		
		//NSLog(@">>>>> 1");
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onStopCurrentLooped" 
						   object:nil 
						   userInfo:nil]];
        
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onLose" 
						   object:nil 
						   userInfo:nil]];
		
		//NSLog(@">>>>> 2");


		
		[self reset];
		
		//NSLog(@">>>>> 3");
		
		NSString *currentLevel = [[OOOSharedLevelmapData get]currentLevelEntryPoint];
		
		if(!currentLevel){
			[[NSNotificationCenter defaultCenter] 
			 postNotification:[NSNotification 
							   notificationWithName:@"onTestLevel" 
							   object:nil
							   userInfo:nil]];
			return;
		}
		
		NSDictionary *dict = [NSDictionary dictionaryWithObject:currentLevel forKey:@"level_id"];
		
		//NSLog(@">>>>> 5");
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onDrawLevel" 
						   object:nil
						   userInfo:dict]];
		
		//NSLog(@">>>>> 6");
		
		return;
	}
	[self notify];
}

-(void)dealloc{
	[super dealloc];
}

@end
