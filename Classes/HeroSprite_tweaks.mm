//
//  HeroSprite.m
//  oneonone
//
//  Created by johan ten broeke on 3/12/10.
//  Copyright 2010 fullscreen. All rights reserved.
//


enum {
	kNeutralMode = 1,
	kWalkingMode = 2,
	kRunningMode= 3,
	kJumpingMode = 4,
	kFallingMode = 5,
	kTalkingMode= 6,
	kDeadMode = 7
};



#import "HeroSprite.h"
#import "Box2D.h"
#import "cocos2d.h"


@implementation HeroSprite

-(id)init{

	if( (self=[super init])) {
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLevelLoaded:) 
													 name:@"levelLoaded" 
												   object:nil];
		
		world_orientation = 0;
		[self createKeyFrames];
		canShoot = YES;
	}
	return self;
	
}

-(void)createKeyFrames{
	NSMutableArray *animFrames = [NSMutableArray array];
	[animFrames addObject:[NSString stringWithFormat:@"hero_neutral_frame_1.png",1]];
	[animFrames addObject:[NSString stringWithFormat:@"hero_shooting_frame_1.png",2]];
	[animFrames addObject:[NSString stringWithFormat:@"hero_shooting_frame_2.png",3]];
	[self setKeyFrames:animFrames];
}


-(void) setState: (int)_state {
	if(_state != state){
		state = _state;
		[self switchAnimation: state]; 
	}
}

-(void) switchAnimation: (int)_state{
	if(_state==kDeadMode){
		[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
					  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
	}else if (_state==kWalkingMode) {
		[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
						  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
	}
	

}

-(void) setB2Body: (b2Body *)body{
	myBody = body;
	myBody->SetFixedRotation(TRUE);
	//NSLog(@"pointer to b2Body : %p",myBody);
}

-(void)update{
	if (_obeyPhysics) {
		
		self.position = CGPointMake( myBody->GetPosition().x * PTM_RATIO, myBody->GetPosition().y * PTM_RATIO);
		
		//NSLog(@"myBody->GetLinearVelocity().x >> %f",myBody->GetLinearVelocity().x);
		//NSLog(@"myBody->GetLinearVelocity().y >> %f",myBody->GetLinearVelocity().y);
		
		if (myBody->GetLinearVelocity().x < -0.1) {
			self.scaleX = -defaultXscaleValue;
		}else if (myBody->GetLinearVelocity().x > 0.1) {
			self.scaleX = defaultXscaleValue;
		}

		
		NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:(myBody->GetPosition().x * PTM_RATIO)],@"xposition",
								 [NSNumber numberWithFloat:(myBody->GetPosition().y * PTM_RATIO)],@"yposition",
								 [NSNumber numberWithFloat:myBody->GetLinearVelocity().x] ,@"xspeed",nil];
		
		[userInfo retain];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onScroll" 
						   object:nil
						   userInfo:userInfo]];
		[userInfo release];
		
		self.visible = YES;
	}
}

-(BOOL)canJump{
	
	NSLog(@"Wat is touching what?");
	_canJump = NO;
	
	for (b2ContactEdge* ce = myBody->GetContactList(); ce; ce = ce->next)
		
	{

		b2Contact* c = ce->contact;
		
		b2Fixture* fixtureA = c->GetFixtureA();
		b2Fixture* fixtureB = c->GetFixtureB();

		NSString *ASensorName = (NSString *)fixtureA->GetUserData();
		NSString *BSensorName = (NSString *)fixtureB->GetUserData();
		
		//NSLog(@"A can jump %@",ASensorName);
		//NSLog(@"B can jump %@",BSensorName);
		//NSLog(@"- - - - - - - - -");
		
		if([ASensorName isEqualToString:@"feet_sensor"]){
			if (c->IsTouching()  && ![BSensorName isEqualToString:@"zoom_sensor"]) {
				_canJump = YES;
			}
		}
		
		if([BSensorName isEqualToString:@"feet_sensor"]){
			if (c->IsTouching() && ![ASensorName isEqualToString:@"zoom_sensor"]) {
				_canJump = YES;
			}
		}
		
		
	}
	//NSLog(@"");
	return _canJump;

}


/**
-(BOOL)getContacts{
	for (b2ContactEdge* ce = myBody->GetContactList(); ce; ce = ce->next)
		
	{
		b2Contact* c = ce->contact;
		
		b2Fixture* fixtureA = c->GetFixtureA();
		OOOGameSprite* sprite = (OOOGameSprite*)fixtureA->GetBody()->GetUserData();
		
		b2Fixture* fixtureB = c->GetFixtureB();
		OOOGameSprite* sprite2 = (OOOGameSprite*)fixtureB->GetBody()->GetUserData();

		if([[sprite getName] isEqualToString:@"GroundSensor"] or [[sprite2 getName]isEqualToString:@"GroundSensor"]){
			if (c->IsTouching()) {
				return YES;
			}
		}
	}
	return NO;
}
 */

-(void) onAccel:(NSNotification *) note{
	b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
	//NSLog(@"userinfo %@",[note userInfo]);
	//if (world_orientation == 0) {
		b2Vec2 impulse(-[[[note userInfo] objectForKey:@"dy"] floatValue] / 30.0 ,0);
		myBody->ApplyLinearImpulse(impulse,point);
	//}else{
	//	b2Vec2 impulse([[[note userInfo] objectForKey:@"dy"] floatValue] / 30.0 ,0);
	//	myBody->ApplyLinearImpulse(impulse,point);
	//}
		
}


-(void) onLevelLoaded:(NSNotification *) note{
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onSwipe:) 
												 name:@"onSwipe" 
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onFire:) 
												 name:@"onFire" 
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onFlip:) 
												 name:@"onFlip" 
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onAccel:) 
												 name:@"onAccel" 
											   object:nil];
	
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onLose:) 
												 name:@"onLose" 
											   object:nil];
	myBody->SetBullet(true);

}

-(void) onLose:(NSNotification *) note{
	canShoot=NO;
	NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"hero_eaten", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo2]];
	[self destroyPhysics];
	[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
					  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
	
	
}

-(void)clear: (id)sel{
	NSLog(@"Hero will clenaup!!!!!!!"); 
	[[self parent] removeChild:self cleanup:YES];
}

-(void) onFire:(NSNotification *) note{
	if (canShoot) {
		
	NSString *_name;
	int offset;
	if(myBody->GetLinearVelocity().x >= 0){
		offset = 10;
		_name = @"r"; //right bullet
	}else{
		offset = -10;
		_name = @"l"; //left bullet
	}
	
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:myBody->GetPosition().x * PTM_RATIO + offset], @"x",
																		[NSNumber numberWithFloat:myBody->GetPosition().y * PTM_RATIO ], @"y",
																		_name,@"name", nil];
	[userinfo retain];

	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSpawnEnemy2" 
					   object:nil 
					   userInfo:userinfo]];

	[userinfo release];
	NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"gun_shot", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo2]];	
	[self gotoAndPlay:@"hero_shooting_frame_1.png" target:self callback:@selector(didFinishShooting:)];
	}
}

-(void)didFinishShooting:(id)sel{
	[self gotoAndStop:@"hero_neutral_frame_1.png"];
}

-(void) onSwipe:(NSNotification *) note{
	if([self canJump]){
		b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
		b2Vec2 impulse(0,40);
		myBody->ApplyLinearImpulse(impulse,point);
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onJump" 
						   object:nil 
						   userInfo:nil]];
	}
}

-(void) onFlip:(NSNotification *) note{
	world_orientation = [[[note userInfo] objectForKey:@"orientation"]intValue];	
}


- (void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[super dealloc];
}

@end
