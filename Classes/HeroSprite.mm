//
//  SuperHeroSprite.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 10/2/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
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
#import "OOOSharedResourceManager.h"
#import "OOOSharedLevelmapData.h"
#import "HeroLegs.h"
#import "HeroHead.h"
#import "HeroBody.h"
#import "OOOGameSprite.h"

@implementation HeroSprite
static OOOGameSprite *__sprite = nil;

+(OOOGameSprite *)getSprite{
	return __sprite;
}

+(void)setSprite:(OOOGameSprite *)spr{
	__sprite = spr;
}


-(id)init{
	self = [super init];
	if(self) {
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(stopJump:) 
													 name:@"onJumpingStopped" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onSwipe:) 
													 name:@"onSwipe" 
												   object:nil]; 
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onFire:) 
													 name:@"onFire" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onAccel:) 
													 name:@"onAccel" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLose:) 
													 name:@"onLose" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onDamage:) 
													 name:@"onDamage" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLevelCleared:) 
													 name:@"onLevelCleared" 
												   object:nil];
		
		world_orientation = 0;
		
		canShoot = YES;
		
		forceDirection = 0;
		state = kDeadMode;
		immune = NO;
		
		samples = [[NSMutableArray alloc] initWithCapacity:5]; 
		[samples addObject:[NSNumber numberWithInt:0]];
		[samples addObject:[NSNumber numberWithInt:0]];
		[samples addObject:[NSNumber numberWithInt:0]];
		[samples addObject:[NSNumber numberWithInt:0]];
		[samples addObject:[NSNumber numberWithInt:0]];
		
		[self createGraphics];
        
        [HeroSprite setSprite:self];
        [self setState:state];
		
	}
	
	return self;
	
}

-(void) setState: (int)_state {
	if(_state != state){
		state = _state;
		[self switchAnimation: state]; 
	}
}

-(void) onLevelCleared:(NSNotification*)note
{
	[head won];
}

-(void) switchAnimation: (int)_state{
	int yoffset = 6;
	if(gun1.visible == NO && gun2.visible == NO && state!=kNeutralMode){
		arm.visible = YES;
	}
	if(_state==kDeadMode){
		
	}else if (_state==kWalkingMode) {
		
		[legs walk];
		[head sideways];
		[body sideways];
		head.position = ccp(46,125-yoffset);
		body.position = ccp(40,74-yoffset);
	}else if (_state==kRunningMode) {
		[legs walk];
		[head sideways];
		[body running];
		
		head.position = ccp(46,125-yoffset);
		body.position = ccp(40,74-yoffset);
	}else if (_state==kNeutralMode) {
		[legs stand];
		[head frontal];
		[body frontal];
		arm.visible = false;
		head.position = ccp(40,125);
		body.position = ccp(40,70);
	}else if (_state==kJumpingMode) {
		[legs jump];
		[body sideways];
		body.position = ccp(40,74-yoffset);
		head.position = ccp(46,125-yoffset);
	}else if (_state==kTalkingMode) {
		
	}else if (_state==kFallingMode) {
		[legs stand];
		//[head frontal];
		[body sideways];
		head.position = ccp(46,125-yoffset);
		body.position = ccp(40,74-yoffset);
	}
}

-(void) setB2Body: (b2Body *)_body{
	myBody = _body;
	myBody->SetFixedRotation(TRUE);
	myBody->SetBullet(true);
}

-(void)createGraphics{
    if([[OOOSharedLevelmapData get] hasUpgraded]){
        gold = YES;
    }else{
        gold = NO;
    }
	//legs
	legs = [[HeroLegs alloc]init];
	legs.position = ccp(40,20);
	[self addChild:legs];
	
	//body 
	body = [[HeroBody alloc]init];
	body.position = ccp(40,70);
	[self addChild:body];
    
	
	//head 
	head = [[HeroHead alloc]init];
	//head.position = ccp(40,115);
	head.position = ccp(46,125);
	[self addChild:head];
	
	//da pistol
	//gun = [[CCSprite alloc] initWithSpriteFrameName:@"hero_gun.png"];
    NSString *suffix;
    if(gold==YES){
        suffix =@"_gold.png";
    }else{
        suffix =@".png";
    }
	arm = [[CCSprite alloc] initWithSpriteFrameName:[NSString stringWithFormat:@"hero_arm_side_neutral%@",suffix]];
	arm.position = ccp(57, 52); 
	[self addChild:arm];
	arm.visible = NO;
	
	gun1 = [[CCSprite alloc] initWithSpriteFrameName:[NSString stringWithFormat:@"hero_gun2%@",suffix ]];
	gun1.position = ccp(40, 56); 
	[self addChild:gun1];
	gun1.visible = NO;
	
	gun2 = [[CCSprite alloc] initWithSpriteFrameName:[NSString stringWithFormat:@"hero_arm_side_shoot%@",suffix ]];
	gun2.position = ccp(72, 68); 
	[self addChild:gun2];
	gun2.visible = NO;
	
	//da skull
	skull = [[CCSprite alloc] initWithSpriteFrameName:@"skull.png"];
	skull.position = ccp(40, 115); 
	skull.scale = 2.0;
	[self addChild:skull];
	skull.visible = NO;
	
	
}

-(void)update{
	if (_obeyPhysics) {
		//NSLog(@"current hero state: %i", state);
		float walkingTreshold = 1.0;
		float runningTreshold = 7.0;
		float neutralTreshold = 1.0;
		
		self.position = CGPointMake( myBody->GetPosition().x * PTM_RATIO, myBody->GetPosition().y * PTM_RATIO);
		
		float  absxspeed = [self calcAverage:myBody->GetLinearVelocity().x];
		float  yspeed = myBody->GetLinearVelocity().y;
		float  xspeed = myBody->GetLinearVelocity().x;
		
		
		
		if(state != kJumpingMode){
			if(absxspeed > runningTreshold){
				[self setState:kRunningMode];
			}else if (absxspeed > walkingTreshold){
				[self setState:kWalkingMode];
			}else if (absxspeed < neutralTreshold){
				[self setState:kNeutralMode];
			}
		}
		
		if (yspeed < -0.3) {
			[self setState:kFallingMode];
		}
		
		if (forceDirection< -0.2) {
			self.scaleX = -defaultXscaleValue;
		}else if (forceDirection > 0.2) {
			self.scaleX = defaultXscaleValue;
		}
		
		if ((forceDirection * xspeed) < 0 && [self canJump] && absxspeed > neutralTreshold) {
			[self showdust];
		}
		
		[legs update:absxspeed];
		[head update];
		[body update];
		
		NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:(myBody->GetPosition().x * PTM_RATIO)],@"xposition",
								  [NSNumber numberWithFloat:(myBody->GetPosition().y * PTM_RATIO)],@"yposition",
								  [NSNumber numberWithFloat:myBody->GetLinearVelocity().x] ,@"xspeed",
                                  @"hero",@"id",nil];
		
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
			if (c->IsTouching()  && !fixtureB->IsSensor()) {
				_canJump = YES;
			}
		}
		
		if([BSensorName isEqualToString:@"feet_sensor"]){
			if (c->IsTouching() && !fixtureA->IsSensor()) {
				_canJump = YES;
			}
		}
		
		
	}
	//NSLog(@"");
	return _canJump;
	
}

-(void) onAccel:(NSNotification *) note{
	forceDirection = -[[[note userInfo] objectForKey:@"dy"] floatValue];
	if (( (myBody->GetLinearVelocity().x) > 10.0f) && ([[[note userInfo] objectForKey:@"dy"] floatValue] < 0 ) ){	
		return;
	}	
	if (( (myBody->GetLinearVelocity().x) < -10.0f) && ([[[note userInfo] objectForKey:@"dy"] floatValue] > 0 ) ){	
		return;
	}	
	b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
	b2Vec2 impulse(-[[[note userInfo] objectForKey:@"dy"] floatValue] / 30.0 ,0);
	myBody->ApplyLinearImpulse(impulse,point);
}


-(void)showdust{
	NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:self.position.x], @"x",
							  [NSNumber numberWithFloat:self.position.y - 35], @"y",
							  @"clouds0004.png",@"msg",nil];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"fadeAwayImageAlert" 
					   object:nil 
					   userInfo:userInfo]];
}

-(void)blam{
	NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:self.position.x], @"x",
							  [NSNumber numberWithFloat:self.position.y], @"y",
							  @"blam2.png",@"msg",nil];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"imageAlert" 
					   object:nil 
					   userInfo:userInfo]];
}

-(void)pow{
	NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:self.position.x], @"x",
							  [NSNumber numberWithFloat:self.position.y], @"y",
							  @"pow.png",@"msg",nil];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"imageAlert" 
					   object:nil 
					   userInfo:userInfo]];
}

-(void)onDamage:(NSNotification *)note{
	if(!immune){
		[self pow];
		immune = YES;
		CCBlink *blink = [[CCBlink alloc] initWithDuration:0.8 blinks:8];
		CCCallFunc *funcCall = [CCCallFunc actionWithTarget:self selector:@selector(deImmune:)];
		[skull runAction:[CCSequence actions:blink,funcCall,nil]];
		[blink release];
	}
}

-(float) absolute: (float) input{
	if(input > 0.0){
		return input;
	}else{
		return -input;
	}
}

-(float) calcAverage:(float)input{
	[samples insertObject:[NSNumber numberWithFloat:input] atIndex:0];
	[samples removeLastObject];
	float sum = 0;
	int i = 0;
	float sub = 0;
	for (i = 0; i < 5 ;i = i + 1){
		//NSLog(@"%i",i);
		//NSLog(@"%@",[samples objectAtIndex:0]);
		sub = [[samples objectAtIndex:i] floatValue];
		sum = sum + sub;
		
		//NSLog(@"array value %i: %f",i,sub);
	}
	float avg = (sum / 5.0f);
	avg = [self absolute:avg];
	return avg;
}

-(void)deImmune:(id)sel{
	immune = NO;
	
	NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0], @"imm",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onImmunityChanged" 
					   object:nil 
					   userInfo:userInfo]];
	
}

-(void) onLose:(NSNotification *) note{
	/*
    [[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onStopCurrentLooped" 
					   object:nil 
					   userInfo:nil]];*/
	canShoot=NO;
	
	//NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"hero_dying1", @"sound",nil];
	uint r1 = arc4random();
    int rnd1  = (r1 % 6)+1;
    NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"hero_dying%i",rnd1], @"sound", nil];

	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo2]];
	
	[self destroyPhysics];
	[self setState:kDeadMode];
	
}

-(void)clear: (id)sel{
	[[self parent] removeChild:self cleanup:YES];
}

-(void) onFire:(NSNotification *) note{
	OOOSharedResourceManager *rm = [OOOSharedResourceManager get];
	
	if (canShoot && [rm bulletsLeft]) {
		
		[self blam];
		
		[rm useBullet];
		//[rm printState];
		
		NSString *_name;
		int offset;
		if(forceDirection >= 0){
			offset = 10;
			_name = @"rbullet"; //right bullet
		}else{
			offset = -10;
			_name = @"lbullet"; //left bullet
		}
		
		NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:myBody->GetPosition().x * PTM_RATIO + offset], @"x",
								  [NSNumber numberWithFloat:myBody->GetPosition().y * PTM_RATIO ], @"y",
								  _name,@"name", nil];
		[userinfo retain];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onShoot" 
						   object:nil 
						   userInfo:userinfo]];
		
		[userinfo release];
		
		NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"gun_shot", @"sound",nil];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onSoundEffect" 
						   object:nil 
						   userInfo:userinfo2]];
		
		CCSprite *gun = nil;
		if(state == kNeutralMode){
			gun = gun1;
		}else{
			gun = gun2;
		}
		
		if(gun.visible==NO){
			arm.visible=NO;
			gun.visible = YES;
			CCDelayTime *interval = [CCDelayTime actionWithDuration:0.4f ];
			CCCallFunc *funcCall = [CCCallFunc actionWithTarget:self selector:@selector(cleanGun:)];
			id seq = [CCSequence actions:interval, funcCall, nil];
			[self runAction:seq];
            [head shoot];
		}	
		
	}else{
		NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"gun_empty", @"sound",nil];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onSoundEffect" 
						   object:nil 
						   userInfo:userinfo2]];
	}
}

-(void)cleanGun: (id) sel {
	gun1.visible = NO;
	gun2.visible = NO;
	if(state!=kNeutralMode){
		arm.visible = YES;
	}
}

-(void)didFinishShooting:(id)sel{
	//[self gotoAndStop:@"hero_neutral_frame_1.png"];
}

//for clasic mario bros style jump controll
-(void)stopJump:(NSNotification *)note{
	float v = myBody->GetLinearVelocity().y;
	if(v >0){
		b2Vec2 impulse(0,-v*2);
		b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
		myBody->ApplyLinearImpulse(impulse,point);
	}
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
		[self setState:kJumpingMode];
	}
}

- (void) dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    [samples release];
    [HeroSprite setSprite:nil];
	[body release];
	[head release];
	[legs release];
	[gun1 release];
	[gun2 release];
	[skull release];
    [arm release];
	[super dealloc];
}
@end
