//
//  RobotSprite.mm
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 10/6/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import "RobotSprite.h"
#import "HeroSprite.h"

@implementation RobotSprite

-(id)init{
	if( (self=[super init])) {
		hero = [HeroSprite getSprite];
		NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"sfx_droning", @"sound", nil];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onPlayLooped" 
						   object:nil 
						   userInfo:userinfo2]];
		
		NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithFloat:0.1f], @"volume", nil];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onLoopedVolume" 
						   object:nil 
						   userInfo:userinfo]];
		
		//kill_level = 10;
		soundFallofDistance = 900.0f;
		//nrBullets = 0;
		frame_counter = 0;
		[self buildCockpit];
		
		scrollstr = [[OOOScrollStrategy alloc]init];
		[scrollstr setEnemySprite:self];
		
	}
	
	return self;
}

-(OOOGameSprite*)getHero{
	return hero;
}

-(void)buildAlien
{
	CCSprite *alien = [[CCSprite alloc] initWithSpriteFrameName:@"ms_monsterblob.png"];
	
	int offset = 20;
	left_eye_closed = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_eye_closed2.png"];
	left_eye_closed.position = ccp(20, 70+offset); 
	[alien addChild:left_eye_closed];
	
	left_eye_open = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_eye_open2.png"];
	left_eye_open.position = ccp(20, 70+offset); 
	[alien addChild:left_eye_open];
	left_eye_open.visible = NO;
	
	right_eye_closed = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_eye_closed2.png"];
	right_eye_closed.position = ccp(120, 70+offset); 
	[alien addChild:right_eye_closed];
	
	right_eye_open = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_eye_open2.png"];
	right_eye_open.position = ccp(120, 70+offset); 
	[alien addChild:right_eye_open];
	right_eye_open.visible = NO;
	
	mouth_open = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_mouth_open.png"];
	mouth_open.position = ccp(51, 43); 
	[alien addChild:mouth_open];
	
	mouth_teeth = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_mouth_teeth.png"];
	mouth_teeth.position = ccp(51, 39); 
	[alien addChild:mouth_teeth];
	mouth_teeth.visible = NO;
	
	mouth_closed = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_mouth_closed.png"];
	mouth_closed.position = ccp(51, 39); 
	[alien addChild:mouth_closed];
	mouth_closed.visible = NO;

	
	mouth_closed.visible = NO;
	alien.position = ccp(100,140);
	alien.scale=0.8;
	[self addChild:alien];
    
    [left_eye_closed release];
    [left_eye_open release];
    [right_eye_closed release];
    [right_eye_open release];
    [mouth_open release];
    [mouth_teeth release];
    [mouth_closed release];
    
    [alien release];
}

-(void)buildCockpit
{
	CCSprite *glassBulb = [[CCSprite alloc] initWithSpriteFrameName:@"glass_bulb_robot.png"];
	glassBulb.position = ccp(90,164);
	glassBulb.visible = YES;
	[self buildAlien];
	[self addChild:glassBulb];
	[glassBulb release];
}

-(void)closeEyes{
	left_eye_open.visible = right_eye_open.visible = NO;
	left_eye_closed.visible = right_eye_closed.visible = YES;
}

-(void)openEyes{
	left_eye_open.visible = right_eye_open.visible = YES;
	left_eye_closed.visible = right_eye_closed.visible = NO;
}

-(void)closeMouth{
	mouth_closed.visible = YES;
	mouth_open.visible = NO;
	mouth_teeth.visible = NO;
}

-(void)openMouth{
	mouth_closed.visible = NO;
	mouth_open.visible = YES;
	mouth_teeth.visible = NO;
}

-(void)showTeeth{
	mouth_closed.visible = NO;
	mouth_open.visible = NO;
	mouth_teeth.visible = YES;
}

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

-(void)update{
	[super update];	
	
	if (frame_counter%51 == 0) {
		float distance = [self distanceToHero];
		float volume = MAX(0.1, - distance/soundFallofDistance + 1.0);
		NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithFloat:volume], @"volume", nil];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onLoopedVolume" 
						   object:nil 
						   userInfo:userinfo]];
		if(distance<100.0){
			[self showTeeth];
			[self closeEyes];
		}
		
		
	}
	
	if(frame_counter%120 == 0){
		[self openEyes];
		[self openMouth];
	}
	
	if (frame_counter%45 == 0) {
		[self closeMouth];
	}
	
	[scrollstr execute];
	frame_counter ++;
}

-(void)dealloc{
	[scrollstr release];
	[super dealloc];
}

@end
