//
//  BlobSprite.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 9/24/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "LoveAlienSprite.h"
#import "Box2D.h"
#import "HeroSprite.h"
#define NSN(__X__) [NSNumber numberWithInt:__X__]

@implementation LoveAlienSprite

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
		notRunning = YES;

		
		
	}
	return self;
}

-(void)drawElements{
	int i = 0;
	bloodDecals=[[NSMutableArray alloc] init];
	NSArray *xposses = [NSArray arrayWithObjects:NSN(20),NSN(50),NSN(80),NSN(30),NSN(100),nil];
	NSArray *yposses = [NSArray arrayWithObjects:NSN(90),NSN(60),NSN(85),NSN(35),NSN(38),nil];				   
	CCSprite *bloodSprite = nil;
	for (i=0; i<kill_level;i++){
		bloodSprite = [[CCSprite alloc] initWithSpriteFrameName:@"blood_decal.png"];
		bloodSprite.position = ccp([[xposses objectAtIndex:i] intValue],[[yposses objectAtIndex:i] intValue]);
		bloodSprite.visible = NO;
		[self addChild:bloodSprite];
		[bloodDecals addObject:bloodSprite];
        [bloodSprite release];
	}
	 
}


-(void)onBulletHit:(NSNotification *)note{

	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		//NSLog(@"onBulletHit in blob went off impact_count is: %i",impact_count);
		CCSprite *bloodSprite =[bloodDecals objectAtIndex:(impact_count)];
		bloodSprite.visible = YES;
		[super onBulletHit:note];
	}
	
}

/*
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
*/
-(float)getXImpulse{
	if (!hero) {
		return 0;
	}
	if (hero.position.x < self.position.x) {
		return -120;
	}else {
		return 120;
	}
	
}

-(void)clearDecals
{
	//NSLog(@"trying to clear decals in blob");
	/*
	mouth_closed.visible = NO;
	mouth_open.visible = NO;
	mouth_teeth.visible = NO;
	left_eye_open.visible = right_eye_open.visible = NO;
	left_eye_closed.visible = right_eye_closed.visible = NO;
	*/
	int i = 0;
	CCSprite *bloodSprite = nil;
	for (i=0; i<kill_level;i++){
		bloodSprite =[bloodDecals objectAtIndex:i];
		if(bloodSprite){
			bloodSprite.visible=NO;
		}
	}
	uint r1 = arc4random();
	int rnd1  = (r1 % 4)+1;
	NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"alien_dying%i",rnd1], @"sound", nil];
	[[NSNotificationCenter defaultCenter] 
				postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo2]];
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

-(void)onDamage:(NSNotification*)note{
	//[self showTeeth];
}

-(void)onLose:(NSNotification *)note{
	hero = nil;
}

-(void)enable
{
	notRunning = YES;
}

-(void)update{
	[super update];
	self.rotation = -1 * CC_RADIANS_TO_DEGREES(myBody->GetAngle());
	if (!defaultScaleX) {
		defaultScaleX = self.scaleX;
		[self drawElements];
	}
	
	frame_counter ++;
	
	if (frame_counter%37 == 1) {
		float distance = [self distanceToHero];
		if (distance < 300 && notRunning){
			notRunning = NO;
			b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y + 100);
			b2Vec2 impulse([self getXImpulse],0);
			myBody->ApplyLinearImpulse(impulse,point);
			NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"spinning_up", @"sound", nil];
			[[NSNotificationCenter defaultCenter] 
			 postNotification:[NSNotification 
							   notificationWithName:@"onSoundEffect" 
							   object:nil 
							   userInfo:userinfo2]];
			
			[self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:2.0f], [CCCallFunc actionWithTarget:self selector:@selector(enable)], nil]];
		}
		//[self openEyes];
		//[self openMouth];
	}
	
	if (frame_counter%45 == 0) {
		self.scaleX = defaultScaleX*1.05;
		//[self closeMouth];
	}
	
	if (frame_counter%91 == 0) {
		self.scaleX = defaultScaleX*1.0;
		//[self closeEyes];
	}
	
	
}

-(void)dealloc{
    [bloodDecals release];
    [super dealloc];
}

@end
