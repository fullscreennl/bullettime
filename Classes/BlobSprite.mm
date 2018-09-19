//
//  BlobSprite.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 9/24/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "BlobSprite.h"
#import "Box2D.h"
#import "HeroSprite.h"

#define NSN(__X__) [NSNumber numberWithInt:__X__]

@implementation BlobSprite

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
		closeEyeName =  @"blob_eye_closed2.png";
		
	}
	return self;
}

-(void)drawElements{
	int offset= 20;
	left_eye_closed = [[CCSprite alloc] initWithSpriteFrameName:closeEyeName];
	left_eye_closed.position = ccp(20, 70+offset); 
	[self addChild:left_eye_closed];
    [left_eye_closed release];
	
	left_eye_open = [[CCSprite alloc] initWithSpriteFrameName:@"blob_eye_open2.png"];
	left_eye_open.position = ccp(20, 70+offset); 
	[self addChild:left_eye_open];
	left_eye_open.visible = NO;
    [left_eye_open release];
	
	right_eye_closed = [[CCSprite alloc] initWithSpriteFrameName:closeEyeName];
	right_eye_closed.position = ccp(120, 70+offset); 
	[self addChild:right_eye_closed];
    [right_eye_closed release];
	
	right_eye_open = [[CCSprite alloc] initWithSpriteFrameName:@"blob_eye_open2.png"];
	right_eye_open.position = ccp(120, 70+offset); 
	[self addChild:right_eye_open];
	right_eye_open.visible = NO;
    [right_eye_open release];
	
	mouth_open = [[CCSprite alloc] initWithSpriteFrameName:@"blob_mouth_open.png"];
	mouth_open.position = ccp(51, 43); 
	[self addChild:mouth_open];
    [mouth_open release];
	
	mouth_teeth = [[CCSprite alloc] initWithSpriteFrameName:@"blob_mouth_teeth.png"];
	mouth_teeth.position = ccp(51, 39); 
	[self addChild:mouth_teeth];
	mouth_teeth.visible = NO;
    [mouth_teeth release];
	
	mouth_closed = [[CCSprite alloc] initWithSpriteFrameName:@"blob_mouth_closed.png"];
	mouth_closed.position = ccp(51, 39); 
	[self addChild:mouth_closed];
	mouth_closed.visible = NO;
    [mouth_closed release];
	
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
        NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"sfx_absorbed", @"sound", nil];
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"onSoundEffect" 
                           object:nil 
                           userInfo:userinfo2]];

	}
	
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

-(float)getXImpulse{
	if (!hero) {
		return 0;
	}
	if (hero.position.x < self.position.x) {
		return -20;
	}else {
		return 20;
	}
	
}

-(void)clearDecals
{
	//NSLog(@"trying to clear decals in blob");
	mouth_closed.visible = NO;
	mouth_open.visible = NO;
	mouth_teeth.visible = NO;
	left_eye_open.visible = right_eye_open.visible = NO;
	left_eye_closed.visible = right_eye_closed.visible = NO;
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
	[self showTeeth];
}

-(void)onLose:(NSNotification *)note{
	hero = nil;
}

-(void)update{
	[super update];
	
	if (!defaultScaleX) {
		defaultScaleX = self.scaleX;
		[self drawElements];
	}
	
	frame_counter ++;
	if (frame_counter%120 == 0) {
		if ([self distanceToHero] <300 ) {
			b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
			b2Vec2 impulse([self getXImpulse],100);
			myBody->ApplyLinearImpulse(impulse,point);
			[self openEyes];
			[self openMouth];
		}
	}
	
	if (frame_counter%45 == 0) {
		self.scaleX = defaultScaleX*1.05;
		[self closeMouth];
	}
	
	if (frame_counter%91 == 0) {
		self.scaleX = defaultScaleX*1.0;
		[self closeEyes];
	}
	
	
}

-(void)dealloc{
    [bloodDecals release];
    [super dealloc];
}

@end
