//
//  ABTargetScrollFocusSprite.m
//  BulletTime
//
//  Created by johan ten broeke on 6/9/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "ABTargetScrollFocusSprite.h"
#import "ABCannon.h"


@implementation ABTargetScrollFocusSprite

-(id)init{
    self = [super init];
    if(self){
        scrollfocus_counter = 0;
    }
    return self;
}

-(void)update{
    
    
    self.position = CGPointMake( myBody->GetPosition().x * PTM_RATIO, myBody->GetPosition().y * PTM_RATIO);
    
    scrollfocus_counter ++;
    
    if(scrollfocus_counter > 200){
        
        /**
        NSDictionary *zoominfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:0.2f] ,@"zoomfact",nil];
        
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"zoom" 
                           object:nil 
                           userInfo:zoominfo]];
        */
        
        [self destroy];
        [[ABCannon get]setScrollFocus:YES];
        return;
    }
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat:(myBody->GetPosition().x * PTM_RATIO)],@"xposition",
                              [NSNumber numberWithFloat:(myBody->GetPosition().y * PTM_RATIO)],@"yposition",
                              [NSNumber numberWithFloat:myBody->GetLinearVelocity().x] ,@"xspeed",
                              @"target",@"id",nil];
    
    [userInfo retain];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onScroll" 
                       object:nil
                       userInfo:userInfo]];
    
    [userInfo release];
    self.visible = YES;
    
}


@end
