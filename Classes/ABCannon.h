//
//  ABCannon.h
//  BulletTime
//
//  Created by Johan ten Broeke on 6/1/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"

@interface ABCannon : OOOGameSprite {
    BOOL activated;
    BOOL scollfocus;
    int scrollfocus_counter;
    BOOL done;
    CCSprite *barrel;
    CCSprite *head;
    CCSprite *head2;
    CCSprite *trigger;
    CCSprite *dashboard;
    CCSprite *chasis;
    float angle;
    BOOL canTrigger;
    BOOL mustSpawnHero;
    int numCannonballs;
    float totalCannonBalls;
    float power;
    
    float startSwipeX;
    float endSwipeX;
}
+(void)setForceX:(float)x andY:(float)y;
+(float)getXForce;
+(float)getYForce;
-(void)setScrollFocus:(BOOL)hasFocus;
+(void)setInstance:(ABCannon*)cann;
+(ABCannon*)get;
-(void)zoomOut;
-(void)zoomIn;
-(void)draw;
-(void)_spawnHero;
-(void)notify;
-(void)logTransform:(CGAffineTransform) tr;
-(void)exitCannon:(NSNotification*)note;
-(void)_exitCannon;

@end
