//
//  GKAchievementSprite.m
//  BulletTime
//
//  Created by johan ten broeke on 8/2/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "GKAchievementSprite.h"
#import "OOOSharedLevelmapData.h"

@implementation GKAchievementSprite

- (id)init
{
    self = [super init];
    if (self) {

    }
    
    return self;
}

-(void)setSpriteData:(NSString *)data{
    [super setSpriteData:data];
    if([[OOOSharedLevelmapData get] hasAchivementForID:data]){
        
        CCSprite *brick = [[CCSprite alloc] initWithSpriteFrameName:@"rect.png"];
        
        
        float newScaleX = (self.contentSize.width * self.scaleX)/brick.contentSize.width;
        float newScaleY = (self.contentSize.width * self.scaleY)/brick.contentSize.height;
        brick.scaleX = newScaleX;
        brick.scaleY = newScaleY;
        
        brick.position = ccp(self.contentSize.width/2.0f,self.contentSize.height/2.0f);
    
        
        [self addChild:brick];
        [brick release];
        
    }else{

        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(onGKAchievement:) 
                                                     name:@"onGKAchievement" 
                                                   object:nil];
    }
}


-(void) onGKAchievement:(NSNotification *) note{

	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
        
        [[OOOSharedLevelmapData get]setAchivementForID:[self getSpriteData]];
        
        NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"pickup_bullettime", @"sound",nil];
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"onSoundEffect" 
                           object:nil 
                           userInfo:userinfo]];
        

		[[NSNotificationCenter defaultCenter] removeObserver:self];	
		[self destroyPhysics];
		[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
						  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
	}
	
}


-(void)clear: (id)sel{
	[[self parent] removeChild:self cleanup:NO];
}

- (void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[super dealloc];
}

@end
