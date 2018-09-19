//
//  AnimatedSpeachBubble.h
//  BulletTime
//
//  Created by Johan ten Broeke on 12/13/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSprite.h"
#import "AnimatedSpeachBubbleDelegate.h"

enum textmode {
	textmodeLeft = 1,
	textmodeRight = 2
};


@interface AnimatedSpeachBubble : CCSprite {
	NSString *text;
	int charcounter;
	int linecounter;
	int xpos;
	id <AnimatedSpeachBubbleDelegate> delegate;
	int pauseTime;
	int pauseCounter;
	int mode;
	int xpos_padding;
	int ypos_padding;
	BOOL mustCleanUp;
}
-(id)initWithMessage:(NSString *)msg;
-(void)setDelegate:(id)obj;
@end
