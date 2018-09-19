//
//  PumpkinSprite.m
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 9/29/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import "PumpkinSprite.h"
#import "Box2D.h"

@implementation PumpkinSprite

-(id)init{
	if( (self=[super init])) {
		framecounter = 0;
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onDamage:) 
													 name:@"onDamage" 
												   object:nil];
		
		
		
		[self drawElements];
	}
	return self;
}
	
-(void)drawElements
{
	
	eyes_neutral = [[CCSprite alloc] initWithSpriteFrameName:@"pumpkin_eyes_neutral.png"];
	eyes_neutral.position = ccp(2*70.0/3.0f, 2*85.0/3.0f); 
    eyes_neutral.scaleX = eyes_neutral.scaleY = 2.0f;
	[self addChild:eyes_neutral];
    [eyes_neutral release];
    
	
	eyes_frowned = [[CCSprite alloc] initWithSpriteFrameName:@"pumpkin_eyes_frowned.png"];
	eyes_frowned.position = ccp(2*70.0/3.0, 2*90.0/3.0);
    eyes_frowned.scaleX = eyes_frowned.scaleY = 2.0f;
	[self addChild:eyes_frowned];
	eyes_frowned.visible = NO;
    [eyes_frowned release];
	
	
	
	mouth_neutral = [[CCSprite alloc] initWithSpriteFrameName:@"pumpkin_mouth_neutral.png"];
	mouth_neutral.position = ccp(2*70.0/3.0, 100.0/3.0);
    mouth_neutral.scaleX = mouth_neutral.scaleY = 2.0f;
	[self addChild:mouth_neutral];
    [mouth_neutral release];
	
	mouth_show_teeth = [[CCSprite alloc] initWithSpriteFrameName:@"pumpkin_mouth_teeth.png"];
	mouth_show_teeth.position = ccp(2*70/3.0, 2*50/3.0);
    mouth_show_teeth.scaleX = mouth_show_teeth.scaleY = 2.0f;
	[self addChild:mouth_show_teeth];
	mouth_show_teeth.visible = NO;
    [mouth_show_teeth release];
	
	
	kill_level = 1;
}

-(void)clearDecals
{
	//if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		//NSLog(@"onDEstroy in pumpkin went off!");
    eyes_frowned.visible = NO;
    eyes_neutral.visible = NO;
    mouth_show_teeth.visible = NO;
    mouth_neutral.visible = NO;
    NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"pumpkin_pop", @"sound", nil];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onSoundEffect" 
                       object:nil 
                       userInfo:userinfo2]];
	//}
	
}

-(void)onDamage:(NSNotification *)note{
	[self showTeethMouth];
	[self frownEyes];
		
}	
	
-(void)neutralEyes
{
	eyes_frowned.visible = NO;
	eyes_neutral.visible = YES;
}

-(void)frownEyes
{
	eyes_frowned.visible = YES;
	eyes_neutral.visible = NO;
	
}

-(void)neutralMouth
{
	mouth_neutral.visible = YES;
	mouth_show_teeth.visible = NO;
}


-(void)showTeethMouth
{
	mouth_neutral.visible = NO;
	mouth_show_teeth.visible = YES;
	
}	
	
-(void)update{
	framecounter++;
	if (_obeyPhysics) {
		self.position = CGPointMake( myBody->GetPosition().x * PTM_RATIO, myBody->GetPosition().y * PTM_RATIO);
		//self.rotation = -1 * CC_RADIANS_TO_DEGREES(myBody->GetAngle());
	}
	
	if (framecounter%128 == 0) {
		[self frownEyes];
		[self neutralMouth];
	}
	if (framecounter%24 == 0) {
		[self neutralEyes];
		[self neutralMouth];
	}
	
	
	self.visible = YES;
}
	
@end
