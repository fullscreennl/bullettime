//
//  ConversationBlock.mm
//  BulletTime
//
//  Created by Johan ten Broeke on 1/23/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "ConversationBlock.h"
#import "OOOGameView.h"
#import "OOOSpritePresenceTable.h"

@implementation ConversationBlock
-(id)init{
	self = [super init];
	if(self){
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(clear:) 
													 name:@"speachCompleted" 
												   object:nil];

        [OOOSpritePresenceTable add:@"conversation"];
	}
	return self;
}

-(void)clear:(NSNotification*)note{
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt:SCROLLMODE_STANDARD] ,@"type",
                              nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"scrollStrategy" 
                       object:nil 
                       userInfo:userInfo]];
    
	[self destroy];
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}
@end
