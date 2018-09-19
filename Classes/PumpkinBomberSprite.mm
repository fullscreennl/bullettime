//
//  PumpkinBomberSprite.m
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 9/26/10.
//  Copyright 2010 none. All rights reserved.
//

#import "PumpkinBomberSprite.h"
#import "Box2D.h"
#import "HeroSprite.h"
#include <math.h>

@implementation PumpkinBomberSprite
-(id)init{
	if( (self=[super init])) {
		frame_counter = 0;
		hero = [HeroSprite getSprite];
		
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLose:) 
													 name:@"onLose" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onDamage:) 
													 name:@"onDamage" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onDestroy:) 
													 name:@"onDestroy" 
												   object:nil];
        
		fireburstSrpite = [[CCSprite alloc] initWithSpriteFrameName:@"fireburst.png"];
		fireburstSrpite.visible = false;
		fireburstSrpite.anchorPoint = ccp(0.5, 0.0);
		[self addChild:fireburstSrpite];
        [fireburstSrpite release];
		fireburstSrpite.position =ccp(118.0, 100.0);
		kill_level = 20;
		canonSoundFallofDistance = 900.0f;
		
	}
	return self;
}

-(void)onFire{
	//NSLog(@"trying to fire enemy from bomber!!!");
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:myBody->GetPosition().x * PTM_RATIO ], @"x",
							  [NSNumber numberWithFloat:( myBody->GetPosition().y+2.0) * PTM_RATIO ], @"y",
							  @"EnemyBullet",@"name", nil];
	[userinfo retain];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onPumpkinBomberShoot" 
					   object:nil 
					   userInfo:userinfo]];
    
    [userinfo release];
    
	//NSLog(@"distance to hero: %f",[self distanceToHero]);
	float distance = [self distanceToHero];
	float volume = MAX(0, - distance/canonSoundFallofDistance + 1);
	NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"canon_shot", @"sound", [NSNumber numberWithFloat:volume], @"volume", nil];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo2]];
	//fireburstSrpite.visible=YES;
	
	fireburstSrpite.visible=YES;
	fireburstSrpite.scale=0.2f;
	
	id scaler = [CCScaleBy actionWithDuration:.2f scale:5.0f];
	id easer = [CCEaseIn actionWithAction:scaler rate:2];
	
	CCCallFunc *funcCall = [CCCallFunc actionWithTarget:self selector:@selector(hideFlames:)];
	id sequence = [CCSequence actions:
				   easer,funcCall,
				   nil];
	[fireburstSrpite runAction:sequence];
	
}

-(void)hideFlames:(id)sel{
	fireburstSrpite.visible=NO;
	[fireburstSrpite stopAllActions];
}


-(void)update{
	[super update];	
	frame_counter ++;
	if (frame_counter%220 == 0) {
		float distance = [self distanceToHero];
		if (distance<600) {
			b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
			b2Vec2 impulse([self getXImpulse],0.0f);
			myBody->ApplyLinearImpulse(impulse,point);
		}
	}
	if (frame_counter%181 == 0) {
		float distance = [self distanceToHero];
		if (distance<canonSoundFallofDistance) {
			[self onFire];
		}
	}
}

-(void) onDestroy:(NSNotification *) note{
	//[(CPPProxy*)[note object] getObject]->deactivate();
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		//NSLog(@"onDestroy %@",self);
		[[NSNotificationCenter defaultCenter] removeObserver:self];
		
		[self destroyPhysics];
		[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
						  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
	}
	
}

/**
-(void)clear: (id)sel{
	//NSLog(@"callbak!!!");
	[[self parent] removeChild:self cleanup:NO];
}
*/

-(float)distanceToHero
{
	if (!hero) {
		return 1000.0f;
	}
	float xDiff = hero.position.x - self.position.x;
	float yDiff = hero.position.y - self.position.y;
	//NSLog(@"xdiif %f",xDiff);
	//NSLog(@"ydiif %f",yDiff);
	//xDiff = 5.0;
	//yDiff= 12.0;
	float prod =  sqrtf((xDiff*xDiff) + (yDiff*yDiff));
	//NSLog(@"prod %f",prod);
	return prod;
}


-(float)getXImpulse
{
	if (!hero) {
		return 0.0f;
	}
	if (hero.position.x < self.position.x) {
		return -150.0f;
	}else {
		return 150.0f;
	}
	
}

-(void)onLose:(NSNotification *)note{
	hero = nil;
}

-(void)onDamage:(NSNotification*)note{
	//[self showTeeth];
}

@end
