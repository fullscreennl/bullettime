//
//  BigBulletSprite.h
//  BulletTime
//
//  Created by Johan ten Broeke on 6/1/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"


@interface BigBulletSprite : OOOGameSprite {
    int frames_lived;
	CCParticleSystem* emitter;
    CCSprite *trailholder;
}
+(void)setTrailHolder:(CCSprite*)cann;
+(CCSprite*)getPrevTrailHolder;
-(void)playClouds;
-(void)clear;

@end
