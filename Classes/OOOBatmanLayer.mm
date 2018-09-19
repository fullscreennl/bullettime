//
//  BatmanLayer.m
//  oneonone_stripped
//
//  Created by johan ten broeke on 9/23/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOBatmanLayer.h"
#import "OOOMiniAlert.h"
#import "OOOGameViewDecorator.h"
#import "OOOConfig.h"
#import "OOOBatmanAlert.h"
#import "HeroSprite.h"

#import "AnimatedSpeachBubble.h"



@implementation OOOBatmanLayer

static OOOBatmanLayer *layer=nil;

+(id) layer
{
	layer = [OOOBatmanLayer node];
	return layer;
}

-(id) init
{
	if( (self=[super init])) {
		
		self.isTouchEnabled = YES;

		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(miniFadeOutAlert:) 
													 name:@"miniAlert" 
												   object:nil];

		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(imageAlert:) 
													 name:@"imageAlert" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(fadeAwayImageAlert:) 
													 name:@"fadeAwayImageAlert" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(speachBubbleAlert:) 
													 name:@"onSpeak" 
												   object:nil];
	}
	return self;
}

-(void)speachBubbleAlert:(NSNotification *)note{
	[self sync];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(talkingPulse:) 
                                                 name:@"talkingPulse" 
                                               object:nil];
	
	HeroSprite *hero;
	OOOGameSprite *speachHitZone;
	
	OOOGameSprite *sprite1 = [[note userInfo] objectForKey:@"sprite1"];
	OOOGameSprite *sprite2 = [[note userInfo] objectForKey:@"sprite2"];
	
	if([sprite1 isMemberOfClass:[HeroSprite class]]){
		hero = (HeroSprite*)sprite1;
		speachHitZone = sprite2;
	}else{
		hero = (HeroSprite*)sprite2;
		speachHitZone = sprite1;
	}
	
	AnimatedSpeachBubble *sb = [[AnimatedSpeachBubble alloc]initWithMessage:[speachHitZone getSpriteData]];
	[sb setDelegate:self];
	
	//NSLog(@"gameview x: %f y %f",self.position.x,self.position.y);
    //NSLog(@"hero x: %f y %f",hero.position.x,hero.position.y);
    
    sb.position = ccp(hero.position.x,hero.position.y+120);
	[self addChild:sb];
	[sb release];
	
	[speachHitZone destroy];
    
    NSDictionary *si = [NSDictionary dictionaryWithObjectsAndKeys:hero,@"hero",sb,@"bubble", nil];
    [si retain];
    [syncinfo release];
    syncinfo = si;
}

-(void)talkingPulse:(NSNotification*)note{
    AnimatedSpeachBubble *sb = [syncinfo objectForKey:@"bubble"];
    HeroSprite *hero = [syncinfo objectForKey:@"hero"];
    sb.position = ccp(hero.position.x,hero.position.y+120);
    [self sync];
}

-(void)speachCompleted{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"talkingPulse" object:nil];
     
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"speachCompleted" 
					   object:nil 
					   userInfo:nil]];
}

-(void)sync{
	OOOGameView *gv = [OOOGameViewDecorator getGameView];
	self.scale = gv.scale;
	self.position = gv.position;
}

-(int)getRandomNr
{
	//returns random value between 0 and 1 in thousand steps
	uint r = arc4random();
	int rnd  = (r % 360);
	return rnd;
	//return 1;
}

-(void)fadeAwayImageAlert:(NSNotification*)note{
	dustShowcount++;
	if (dustShowcount%7 != 0) {
		return;
	}
	
	[self sync];
	float _x = [[[note userInfo] objectForKey:@"x"]floatValue];
	float _y = [[[note userInfo] objectForKey:@"y"]floatValue];
	NSString *png = [[note userInfo] objectForKey:@"msg"];
	OOOBatmanAlert *alert = [[OOOBatmanAlert alloc]initWithPNGName:png];
	alert.position = ccp(_x,_y);
	alert.rotation = (float)[self getRandomNr];
	alert.opacity = 100.0f;
	
	id scale_action = [CCScaleBy actionWithDuration:0.4 scale:0.1f];
	id ease_action = [CCEaseIn actionWithAction:scale_action rate:2];
	[alert runAction:ease_action];

	[self addChild:alert];
	[alert release];
	
	
}

-(void)imageAlert:(NSNotification*)note{
	showcount++;
	if (showcount%3 != 0) {
		return;
	}
	
	[self sync];
	float _x = [[[note userInfo] objectForKey:@"x"]floatValue];
	float _y = [[[note userInfo] objectForKey:@"y"]floatValue];
	NSString *png = [[note userInfo] objectForKey:@"msg"];
	OOOBatmanAlert *alert = [[OOOBatmanAlert alloc]initWithPNGName:png];
	alert.position = ccp(_x,_y);
	alert.scale = 0.2;
	
	id scale_action = [CCScaleBy actionWithDuration:0.4 scale:6.0f];
	id ease_action = [CCEaseIn actionWithAction:scale_action rate:2];
	[alert runAction:ease_action];
	
	[self addChild:alert];
	[alert release];
	
	
}

-(void)miniFadeOutAlert:(NSNotification *)note{
	
	OOOMiniAlert *label;
	
	[self sync];

	NSString *msg = [[note userInfo] objectForKey:@"msg"];
	
	float _x = [[[note userInfo] objectForKey:@"x"]floatValue];
	float _y = [[[note userInfo] objectForKey:@"y"]floatValue];
	
	label = [OOOMiniAlert labelWithString:msg fntFile:MAIN_FONT];
	label.position = ccp(_x,_y);
	label.scale = 0.2;
	id scale_action = [CCScaleBy actionWithDuration:0.5 scale:6.0f];
	id ease_action = [CCEaseIn actionWithAction:scale_action rate:2];
	[label runAction:ease_action];
	[self addChild:label];
	[label fade];
	
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    [syncinfo release];
	[super dealloc];
}


@end
