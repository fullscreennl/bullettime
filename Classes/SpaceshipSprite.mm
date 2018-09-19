//
//  SpaceshipSprite.m
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 10/4/10.
//  Copyright 2010 none. All rights reserved.
//

#import "SpaceshipSprite.h"
#import "Box2D.h"

@implementation SpaceshipSprite
-(id)init{
	if( (self=[super init])) {
		frame_counter = 0;
		hero = [HeroSprite getSprite];
		
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLose:) 
													 name:@"onLose" 
												   object:nil];
		
		
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onDestroy:) 
													 name:@"onDestroy" 
												   object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onSpaceshipBombDestroyed:) 
													 name:@"onSpaceshipBombDestroyed" 
												   object:nil];
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
		
		kill_level = 20;
		soundFallofDistance = 900.0f;
		nrBullets = 0;
		[self buildCockpit];
	}
	return self;
}


-(void)buildAlien
{
	CCSprite *alien = [[CCSprite alloc] initWithSpriteFrameName:@"ms_monsterblob.png"];
	
	left_eye_closed = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_eye_closed2.png"];
	left_eye_closed.position = ccp(20, 70); 
	[alien addChild:left_eye_closed];
    [left_eye_closed release];
	
	left_eye_open = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_eye_open2.png"];
	left_eye_open.position = ccp(20, 70); 
	[alien addChild:left_eye_open];
	left_eye_open.visible = NO;
    [left_eye_open release];
	
	right_eye_closed = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_eye_closed2.png"];
	right_eye_closed.position = ccp(100, 70); 
	[alien addChild:right_eye_closed];
    [right_eye_closed release];
	
	right_eye_open = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_eye_open2.png"];
	right_eye_open.position = ccp(100, 70); 
	[alien addChild:right_eye_open];
    [right_eye_open release];
	right_eye_open.visible = NO;
	
	mouth_open = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_mouth_open.png"];
	mouth_open.position = ccp(51, 39); 
	[alien addChild:mouth_open];
    [mouth_open release];
	
	mouth_teeth = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_mouth_teeth.png"];
	mouth_teeth.position = ccp(51, 39); 
	[alien addChild:mouth_teeth];
	mouth_teeth.visible = NO;
    [mouth_teeth release];
	
	mouth_closed = [[CCSprite alloc] initWithSpriteFrameName:@"ms_blob_mouth_closed.png"];
	mouth_closed.position = ccp(51, 39); 
	[alien addChild:mouth_closed];
    [mouth_closed release];
	mouth_closed.visible = NO;
	alien.position = ccp(188,115);
	alien.scale=0.6;
	[self addChild:alien];
    [alien release];
	
	flameLeft = [[CCSprite alloc] initWithSpriteFrameName:@"exhaust_flame.png"];
	flameLeft.position = ccp(30,30);
	flameLeft.anchorPoint = ccp(0.5, 1.0);
	[self addChild:flameLeft];
    [flameLeft release];
    
	flameRight = [[CCSprite alloc] initWithSpriteFrameName:@"exhaust_flame.png"];
	flameRight.position = ccp(350,30);
	flameRight.anchorPoint = ccp(0.5, 1.0);
	[self addChild:flameRight];
    [flameRight release];
	
	
}

-(void)buildCockpit
{
	CCSprite *glassBulb = [[CCSprite alloc] initWithSpriteFrameName:@"glass_bulb.png"];
	glassBulb.position = ccp(188,115);
	glassBulb.visible = YES;
	[self buildAlien];
	[self addChild:glassBulb];
    [glassBulb release];
	
}




-(void)onFire{
	//NSLog(@"trying to fire enemy from spaceship!!!");
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:myBody->GetPosition().x * PTM_RATIO ], @"x",
							  [NSNumber numberWithFloat:( myBody->GetPosition().y-2.0) * PTM_RATIO ], @"y",
							  @"Enemy",@"name", nil];
	[userinfo retain];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSpaceshipShoot" 
					   object:nil 
					   userInfo:userinfo]];
	[userinfo release];
	//NSLog(@"distance to hero: %f",[self distanceToHero]);
	float distance = [self distanceToHero];
	float volume = MAX(0, - distance/soundFallofDistance + 1);
	NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"canon_shot", @"sound", [NSNumber numberWithFloat:volume], @"volume", nil];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo2]];
	
}
-(void) clearDecals
{
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onStopCurrentLooped" 
					   object:nil 
					   userInfo:nil]];
	NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"spaceship_exploded", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo2]];
	//should be overwritten in subclasses for clearing teeth eyes etc.
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

-(void)hideFlames:(id)sel{
	flameLeft.visible=NO;
	[flameLeft stopAllActions];
	flameRight.visible=NO;
	[flameRight stopAllActions];
}


-(void)showBoost{
	flameLeft.visible=YES;
	flameLeft.scale= 0.2f;
	flameRight.visible=YES;
	flameRight.scale=0.2f;
	
	id scaler = [CCScaleBy actionWithDuration:.3f scale:5.0f];
	id easer = [CCEaseIn actionWithAction:scaler rate:2];
	
	//id beetler5 = [CCRotateBy actionWithDuration:.4 angle:-31.8f];
	//id beetlem5 = [CCMoveBy actionWithDuration:6 position:ccp(0.0f,220.0f)];
	//id beetleEase5 = [CCEaseInOut actionWithAction:beetlem5 rate:2];
	CCCallFunc *funcCall = [CCCallFunc actionWithTarget:self selector:@selector(hideFlames:)];
	id sequence = [CCSequence actions:
						 easer,funcCall,
						 nil];
	[flameLeft runAction:sequence];
	[flameRight runAction:[[sequence copy] autorelease]];
}
						 

-(void)update{
	[super update];	
	self.rotation = -1 * CC_RADIANS_TO_DEGREES(myBody->GetAngle());
	frame_counter ++;
	if (frame_counter%32 == 0){
		b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
		b2Vec2 impulse(0.0f,1000.0f);
		myBody->ApplyLinearImpulse(impulse,point);
		[self showBoost];
	}
	if (frame_counter%120 == 0) {
			b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
			b2Vec2 impulse([self getXImpulse],-100.0f);
			myBody->ApplyLinearImpulse(impulse,point);
			[self openEyes];
			[self openMouth];
	}
	if (frame_counter%91 == 0) {
		float distance = [self distanceToHero];
		float volume = MAX(0.1, - distance/soundFallofDistance + 1);
		NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithFloat:volume], @"volume", nil];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onLoopedVolume" 
						   object:nil 
						   userInfo:userinfo]];
		
		if(distance<350.0f && nrBullets<4){
			nrBullets++;
			[self onFire];
			[self closeEyes];
			[self showTeeth];
		}
	}
	
	if (frame_counter%45 == 0) {
		[self closeMouth];
	}
	
}

-(void)onSpaceshipBombDestroyed:(NSNotification *)note
{
	nrBullets--;
}


-(float)getXImpulse
{
	if (!hero) {
		return 0.0f;
	}
	if (hero.position.x < self.position.x) {
		return -100.0f;
	}else {
		return 100.0f;
	}
	
}

@end
