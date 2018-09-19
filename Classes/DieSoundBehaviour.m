//
//  DieSoundBehaviour.m
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 11/17/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import "DieSoundBehaviour.h"


@implementation DieSoundBehaviour
-(id) initWithSound:(NSString*)_sound
{
	if( (self=[super init])) {
		if([_sound isEqualToString:@"alien_dying"]){
			uint r1 = arc4random();
			int rnd1  = (r1 % 4)+1;
			NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"alien_dying%i",rnd1], @"sound", nil];
			[[NSNotificationCenter defaultCenter] 
							postNotification:[NSNotification 
						   notificationWithName:@"onSoundEffect" 
						   object:nil 
						   userInfo:userinfo2]];
		}
	}
	return self;
}
@end
