//
//  SeqPumpkinSprite.m
//  BulletTime
//
//  Created by Johan ten Broeke on 5/17/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "SeqPumpkinSprite.h"
#import "OOOConfig.h"
#import "cocos2d.h"


@implementation SeqPumpkinSprite

-(id)init{
    self = [super init];
    if(self){
        kill_level = 1;
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onSeqPumpkinKilled:) 
													 name:@"onSeqPumpkinKilled" 
												   object:nil];
        
    }
    return self;
}

-(void)setSpriteData:(NSString *)data{
    
    NSString *pngname = [data stringByAppendingString:@".png"];
    CCSprite *__id = [[CCSprite alloc] initWithSpriteFrameName:pngname];
	__id.position = ccp(50.0, 50.0); 
    __id.scale = 1.4;
	[self addChild:__id];
    [__id release];
    
    seqID = [NSNumber numberWithInt:[data intValue]];
    [seqID retain];
}

-(void)onSeqPumpkinKilled:(NSNotification *)note{
    NSNumber *seqIDKilled = [[note userInfo] objectForKey:@"seqID"];
    if([seqIDKilled intValue] > [seqID intValue]){
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"onDeathByToxic" 
                           object:nil
                           userInfo:nil]];
    }
}

-(void)willDestruct{
    NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"pumpkin_pop", @"sound", nil];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onSoundEffect" 
                       object:nil 
                       userInfo:userinfo2]];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:seqID,@"seqID",nil];
    
    [userInfo retain];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onSeqPumpkinKilled" 
                       object:nil
                       userInfo:userInfo]];
    [userInfo release];

}

-(void)dealloc{
    [seqID release];
    [[NSNotificationCenter defaultCenter] removeObserver:self]; 
    [super dealloc];
}

@end
