//
//  OOOFaceWithExpressions.mm
//  BulletTime
//
//  Created by johan ten broeke on 2/14/11.
//  Copyright 2011 fullscreen. All rights reserved.
//
// primes under 1000
/**
 2      3      5      7     11     13     17     19     23     29 
 31     37     41     43     47     53     59     61     67     71 
 73     79     83     89     97    101    103    107    109    113 
 127    131    137    139    149    151    157    163    167    173 
 179    181    191    193    197    199    211    223    227    229 
 233    239    241    251    257    263    269    271    277    281 
 283    293    307    311    313    317    331    337    347    349 
 353    359    367    373    379    383    389    397    401    409 
 419    421    431    433    439    443    449    457    461    463 
 467    479    487    491    499    503    509    521    523    541 
 547    557    563    569    571    577    587    593    599    601 
 607    613    617    619    631    641    643    647    653    659 
 661    673    677    683    691    701    709    719    727    733 
 739    743    751    757    761    769    773    787    797    809 
 811    821    823    827    829    839    853    857    859    863 
 877    881    883    887    907    911    919    929    937    941 
 947    953    967    971    977    983    991    997
 */

#import "OOOFaceWithExpressions.h"

int surprized_0[12]   = {0,0,1,1,0,0,1,0,0,1,0,0};
int surprized_1[12]   = {1,0,0,1,0,0,1,0,0,1,0,0};
int surprized_2[12]   = {0,0,1,1,0,0,0,1,0,1,0,0};

int shocked_0[12]     = {0,0,1,1,0,0,0,0,1,1,0,0};
int shocked_1[12]     = {1,1,0,0,0,0,0,0,1,1,1,1};
int shocked_2[12]     = {1,1,0,0,0,0,0,0,0,1,1,1};

int angry_0[12]		  = {1,1,0,0,0,0,0,0,1,0,1,0};
int angry_1[12]		  = {1,0,0,1,0,0,0,0,1,0,1,0};
int angry_2[12]		  = {0,1,1,0,0,0,0,0,1,0,1,0};

int happy_0[12]		  = {1,0,0,1,0,1,0,0,0,1,0,0};
int happy_1[12]		  = {1,0,0,1,0,1,0,0,0,1,0,0};
int happy_2[12]		  = {1,0,0,1,0,1,0,0,0,1,0,0};

int sad_0[12]		  = {1,1,0,0,1,0,0,0,0,0,1,1};
int sad_1[12]		  = {1,0,0,1,1,0,0,0,0,0,1,1};
int sad_2[12]		  = {1,1,0,0,0,0,1,0,0,1,1,1};

int neutral_0[12]	  = {0,0,1,1,0,0,1,0,0,0,0,0};
int neutral_1[12]	  = {1,1,0,0,0,0,1,0,0,0,0,0};
int neutral_2[12]	  = {1,1,0,0,0,0,0,1,0,0,0,0};

int faceless[12]	  = {0,0,0,0,0,0,0,0,0,0,0,0};

int dying[12]         = {1,1,0,0,0,0,0,1,0,0,1,1};

@implementation OOOFaceWithExpressions

-(id)init{
	self = [super init];
	if(self){
		stateDuration = 120; //approx 1 sec
		NSDictionary *imd = [self performSelector:@selector(faceDefinition)];
		[imd retain];

        soundArr = [self performSelector:@selector(soundDefinition)];
		[soundArr retain];
        
		int *tr = (int*)[[self performSelector:@selector(triangle)] bytes];
		
		left_eye_closed = [[CCSprite alloc] initWithSpriteFrameName:[imd objectForKey:@"eye_closed"]];
		left_eye_closed.position = ccp(tr[0], tr[1]); 
		[self addChild:left_eye_closed];
		left_eye_closed.visible = NO;
		
		//NSLog(@"1 %@",left_eye_closed);
		
		left_eye_open = [[CCSprite alloc] initWithSpriteFrameName:[imd objectForKey:@"eye_open"]];
		left_eye_open.position = ccp(tr[0],tr[1]); 
		[self addChild:left_eye_open];
		left_eye_open.visible = NO;
		
		//NSLog(@"2 %@",left_eye_open);
		
		right_eye_closed = [[CCSprite alloc] initWithSpriteFrameName:[imd objectForKey:@"eye_closed"]];
		right_eye_closed.position = ccp(tr[2], tr[3]); 
		[self addChild:right_eye_closed];
		right_eye_closed.visible = NO;
		
		//NSLog(@"3 %@",right_eye_closed);
		
		right_eye_open = [[CCSprite alloc] initWithSpriteFrameName:[imd objectForKey:@"eye_open"]];
		right_eye_open.position = ccp(tr[2], tr[3]); 
		[self addChild:right_eye_open];
		right_eye_open.visible = NO;
		
		//NSLog(@"4 %@",right_eye_open);
		
		mouth_open = [[CCSprite alloc] initWithSpriteFrameName:[imd objectForKey:@"mouth_open"]];
		mouth_open.position = ccp(tr[4], tr[5]); 
		[self addChild:mouth_open];
		mouth_open.visible = NO;
		
		//NSLog(@"5 %@",mouth_open);
		
		mouth_teeth = [[CCSprite alloc] initWithSpriteFrameName:[imd objectForKey:@"mouth_teeth"]];
		mouth_teeth.position = ccp(tr[4], tr[5]);  
		[self addChild:mouth_teeth];
		mouth_teeth.visible = NO;
		
		//NSLog(@"6 %@",mouth_teeth);
		
		mouth_closed = [[CCSprite alloc] initWithSpriteFrameName:[imd objectForKey:@"mouth_closed"]];
		mouth_closed.position = ccp(tr[4], tr[5]); 
		[self addChild:mouth_closed];
		mouth_closed.visible = NO;
		
		//NSLog(@"7 %@",mouth_closed);
		
		mouth_happy = [[CCSprite alloc] initWithSpriteFrameName:[imd objectForKey:@"mouth_happy"]];
		mouth_happy.position = ccp(tr[4], tr[5]); 
		[self addChild:mouth_happy];
		mouth_happy.visible = NO;
		
		//NSLog(@"8 %@",mouth_happy);
		
		mouth_sad = [[CCSprite alloc] initWithSpriteFrameName:[imd objectForKey:@"mouth_sad"]];
		mouth_sad.position = ccp(tr[4], tr[5]);  
		[self addChild:mouth_sad];
		mouth_sad.visible = NO;
		
		//NSLog(@"9 %@",mouth_sad);
		
		myFrameCounter = 1;
		
		durationCounter = 0;
		
		[self neutral];
		isNeutral = YES;
        jitter = YES;
		defaultSelector = @selector(doNeutral);
		sound= YES;
		[imd release];
		
		isDying = NO;
		
	}
	return self;
}


-(NSArray*)soundDefinition{	
	return [NSArray arrayWithObjects:@"alien_happy", @"alien_angry", @"alien_sad", nil ];
}

-(void)playSound:(NSString*)_sound
{
    if(sound){
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:_sound, @"sound", nil];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onSoundEffect" 
                       object:nil 
                       userInfo:userinfo]];
   
    }
     isNeutral = NO;
}

-(BOOL)getNeutral
{
    return isNeutral;
}

#pragma mark EXPRESSION STATES
#pragma mark -

#pragma mark dying
-(void)dying{
    if(!isDying){
        [self playSound:[soundArr objectAtIndex:2]];
    }
	[self setState:dying];
	currentStateSelector = @selector(doDying);
	isDying = YES;
}

-(void)doDying{
	//NSLog(@"dying!!!!");
}

-(void)allowJitter:(BOOL)_allow
{
    jitter = _allow;
}

#pragma mark neutral
-(void)neutral{
	durationCounter = 0;
	currentStateSelector = @selector(doNeutral);
}

-(void)doNeutral{
	if (myFrameCounter%127 == 0) {
		[self setState:neutral_1];
	}
	if (myFrameCounter%127 == 2) {
		[self setState:neutral_0];
	}
	if (myFrameCounter%127 == 8) {
		[self setState:neutral_1];
	}
	if (myFrameCounter%127 == 10) {
		[self setState:neutral_0];
	}
	if (myFrameCounter%331 == 0) {
		[self setState:neutral_2];
	}
	if (myFrameCounter%331 == 7) {
		[self setState:neutral_0];
	}
}

#pragma mark happy
-(void)happy{
    if(isNeutral){
        [self playSound:[soundArr objectAtIndex:0]];
    }
	durationCounter = 0;
	[self setState:happy_0];
	currentStateSelector = @selector(doHappy);
}

-(void)doHappy{
	if (myFrameCounter%127 == 0) {
		[self setState:happy_1];
	}
	if (myFrameCounter%127 == 43) {
		[self setState:happy_0];
	}
	if (myFrameCounter%127 == 101) {
		[self setState:happy_1];
	}
	if (myFrameCounter%127 == 149) {
		[self setState:happy_0];
	}
	if (myFrameCounter%331 == 0) {
		[self setState:happy_2];
	}
	if (myFrameCounter%331 == 7) {
		[self setState:happy_0];
	}
}

-(void)noSound{
    sound = NO;
}


#pragma mark happy
-(void)shocked{
	durationCounter = 0;
	[self setState:shocked_0];
	currentStateSelector = @selector(doShocked);
}

-(void)doShocked{
	if (myFrameCounter%127 == 0) {
		[self setState:shocked_1];
	}
	if (myFrameCounter%127 == 43) {
		[self setState:shocked_0];
	}
	if (myFrameCounter%127 == 101) {
		[self setState:shocked_1];
	}
	if (myFrameCounter%127 == 149) {
		[self setState:shocked_0];
	}
	if (myFrameCounter%331 == 0) {
		[self setState:shocked_2];
	}
	if (myFrameCounter%331 == 7) {
		[self setState:shocked_0];
	}
}

#pragma mark angry
-(void)angry{
    //NSLog(@"!!!angry!!!");
    if(isNeutral){
        [self playSound:[soundArr objectAtIndex:1]];
    }
	durationCounter = 0;
	[self setState:angry_0];
	currentStateSelector = @selector(doAngry);
}

-(void)doAngry{
	if (myFrameCounter%127 == 0) {
		[self setState:angry_1];
	}
	if (myFrameCounter%127 == 2) {
		[self setState:angry_0];
	}
	if (myFrameCounter%127 == 8) {
		[self setState:angry_1];
	}
	if (myFrameCounter%127 == 10) {
		[self setState:angry_0];
	}
	if (myFrameCounter%331 == 0) {
		[self setState:angry_2];
	}
	if (myFrameCounter%331 == 7) {
		[self setState:angry_0];
	}
}

#pragma mark angry
-(void)sad{
	durationCounter = 0;
	[self setState:sad_1];
	currentStateSelector = @selector(doSad);
}

-(void)doSad{
	if (myFrameCounter%127 == 0) {
		[self setState:sad_1];
	}
	if (myFrameCounter%127 == 2) {
		[self setState:sad_0];
	}
	if (myFrameCounter%127 == 8) {
		[self setState:sad_1];
	}
	if (myFrameCounter%127 == 10) {
		[self setState:sad_0];
	}
	if (myFrameCounter%331 == 0) {
		[self setState:sad_2];
	}
	if (myFrameCounter%331 == 7) {
		[self setState:sad_0];
	}
}

#pragma mark -
-(void)setState:(int [12])arr{
	
	if (isDying) {
		return;
	}
	//{1,1,0,0,0,0,0,0,1,0,1,0};
	left_eye_closed.visible = *arr++;
	right_eye_closed.visible = *arr++;
	left_eye_open.visible = *arr++;
	right_eye_open.visible = *arr++;
	mouth_sad.visible = *arr++;
	mouth_happy.visible = *arr++;
	mouth_closed.visible = *arr++;
	mouth_open.visible = *arr++;
	mouth_teeth.visible = *arr++;
	
	// sprite tweaks //
	BOOL big_eyes = *arr++;
	BOOL rotate_eyes = *arr++;
	BOOL sad_eyes = *arr;
	int mp;
	
	if (sad_eyes) {
		mp = 1;
	}else {
		mp = -1;
	}

	if (big_eyes) {
		left_eye_closed.scale = 1.5f;
		right_eye_closed.scale = 1.5f;
		left_eye_open.scale = 1.5f;
		right_eye_open.scale = 1.5f;
	}else{
		left_eye_closed.scale = 1.0f;
		right_eye_closed.scale = 1.0f;
		left_eye_open.scale = 1.0f;
		right_eye_open.scale = 1.0f;
	}
	
	if (rotate_eyes) {
		left_eye_closed.rotation = -20.0f*mp;
		left_eye_open.rotation = -20.0f*mp;
		right_eye_closed.rotation = 20.0f*mp;;
		right_eye_open.rotation = 20.0f*mp;
	}else{
		left_eye_closed.rotation = 0;
		left_eye_open.rotation = 0;
		right_eye_closed.rotation = 0;
		right_eye_open.rotation = 0;
	}
}

-(void)animate{
	
	myFrameCounter++;
	if (myFrameCounter > 1000) {
		myFrameCounter = 1;
	}
	
	durationCounter ++;
	if (durationCounter > stateDuration && isDying == NO) {
		currentStateSelector = defaultSelector;
        isNeutral = YES;
	}
	
	[self performSelector:currentStateSelector];
	
	if (myFrameCounter%13 == 0 && jitter) {
		uint r1 = arc4random();
		int rnd1  = (r1 % 8);
		uint r2 = arc4random();
		int rnd2  = (r2 % 6);
		self.position = ccp(rnd1,rnd2);
	}

}

-(void)dealloc{
    [soundArr release];
	[mouth_happy release];
	[mouth_sad release];
	[left_eye_open release];
	[left_eye_closed release];;
	[right_eye_open release];
	[right_eye_closed release];
	[mouth_open release];
	[mouth_closed release];
	[mouth_teeth release];
	[super dealloc];
}

@end
