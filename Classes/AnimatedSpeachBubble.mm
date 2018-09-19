//
//  AnimatedSpeachBubble.mm
//  BulletTime
//
//  Created by Johan ten Broeke on 12/13/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "AnimatedSpeachBubble.h"
#import "OOOConfig.h"
#import "CCLabelBMFont.h"
#import "cocos2d.h"
#import "OOOGameView.h"

//private members
@interface AnimatedSpeachBubble ()
-(void)drawText;
-(void)switchTextMode;
-(void)clean;
@end


@implementation AnimatedSpeachBubble

-(id)initWithMessage:(NSString *)msg{
	self = [super init];
	if(self){
		pauseTime = 0;
		pauseCounter = 0;
		charcounter = 0;
		linecounter = 0;
		xpos = 0;
		text = [msg retain];
		xpos_padding = 0;
		ypos_padding = 0;
		
		mustCleanUp = NO;
		
		//CCSprite *im = [CCSprite spriteWithSpriteFrameName:@"pow.png"];
		//[self addChild:im];
		
		[self schedule:@selector(drawText) interval:0.06f];
		
		NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
								  [NSNumber numberWithInt:SCROLLMODE_LEFT] ,@"type",
								  nil];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"scrollStrategy" 
						   object:nil 
						   userInfo:userInfo]];
		
		mode = textmodeLeft;
		
	}
	return self;
}

-(void)setDelegate:(id)obj{
	delegate = obj;
}

-(void)switchTextMode{
    int enemyIsTalking = 0;
	linecounter = 0;
	xpos = 0;
	if (mode == textmodeLeft) {
		mode = textmodeRight;
		xpos_padding = 190;
		ypos_padding = 50;
		enemyIsTalking = 1;
	}else if (mode == textmodeRight) {
		mode = textmodeLeft;
		xpos_padding = 0;
		ypos_padding = 0;
		enemyIsTalking = 0;
	}
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt:enemyIsTalking] ,@"enemyIsTalking",
                              nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"switchTextMode" 
                       object:nil 
                       userInfo:userInfo]];
}

-(void)clean{
	[self removeAllChildrenWithCleanup:YES];
}

-(void)drawText{
	
	if (pauseTime > pauseCounter) {
		pauseCounter ++;
		return;
	}
	
	if(mustCleanUp){
		[self clean];
		mustCleanUp = NO;
	};
	
	int l = [text length];
	
	if (charcounter >= l) {
		[self unscheduleAllSelectors];
		[delegate speachCompleted];
		[self removeFromParentAndCleanup:YES];
		return;
	}
	
	charcounter ++;
	
	if (charcounter <= l) {
		NSRange range = NSMakeRange (charcounter-1, 1);
		NSString *_char = [text substringWithRange:range];
		if ([_char isEqualToString:@"*"]) {
			pauseTime = 30;
			pauseCounter = 0;
			mustCleanUp = YES;
			[self switchTextMode];
			return;
		}
		if ([_char isEqualToString:@"#"]) {
			linecounter ++;
			xpos = 0;
		}else{
			CCLabelBMFont *label = [CCLabelBMFont labelWithString:_char fntFile:MAIN_FONT];
			label.scale = 0.5f;
			label.position = ccp(xpos*15+xpos_padding,(linecounter * -20) + ypos_padding);
			[self addChild:label];
			xpos ++;
		}
        if(![_char isEqualToString:@" "]){
            NSDictionary *uinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"blib", @"sound", nil];
            [[NSNotificationCenter defaultCenter] 
             postNotification:[NSNotification 
                               notificationWithName:@"onSoundEffect" 
                               object:nil 
                               userInfo:uinfo]];
        }
	}
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"talkingPulse" 
                       object:nil 
                       userInfo:nil]];
    
    
	
	

}

-(void)dealloc{
	[text release];
	[super dealloc];
}

@end
