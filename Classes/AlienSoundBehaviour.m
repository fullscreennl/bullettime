//
//  AlienSoundBehaviour.m
//  BulletTime
//
//  Created by Jeroen Goor van on 7/27/11.
//  Copyright 2011 Fullscreen. All rights reserved.
//

#import "AlienSoundBehaviour.h"


@implementation AlienSoundBehaviour
-(id) initWithSound:(NSString*)_sound andModuloTrigger:(int)_trigger
{
    trigger = _trigger;
	if( (self=[super init])) {
        userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:_sound, @"sound", nil];
        [userinfo2 retain];
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"onSoundEffect" 
                           object:nil 
                           userInfo:userinfo2]];
        

    }
	return self;
}

-(void)excecute:(int)framecounter{
	if (framecounter%trigger == 0) {
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"onSoundEffect" 
                           object:nil 
                           userInfo:userinfo2]];
    }
}

-(void)dealloc{
    [userinfo2 release];
    [super dealloc];
}
@end
