//
//  DeliciaSprite.m
//  BulletTime
//
//  Created by johan ten broeke on 8/16/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "DeliciaSprite.h"
#import "OOOGameSprite.h"
#import "HeroSprite.h"
#import "OOOSharedResourceManager.h"

@implementation DeliciaSprite

- (id)init
{
    self = [super init];
    if (self) {
        mode = 0;
        frame_counter = 0;
		hero = (OOOGameSprite*)[HeroSprite getSprite];
        [[OOOSharedResourceManager get] clearBullets];

        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(release:) 
													 name:@"speachCompleted" 
												   object:nil];
        
        self.scaleX = self.scaleX* -0.6;
        self.position = ccp(self.position.x,self.position.y + 20);
    }
    
    return self;
}


-(void)release:(NSNotification*)note{
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onLevelCleared" 
                       object:nil 
                       userInfo:nil]];
}


-(float)distanceToHero
{
	if (!hero) {
		return 1000.0f;
	}
	float xDiff = hero.position.x - self.position.x;
	float yDiff = hero.position.y - self.position.y;
	float prod =  sqrtf((xDiff*xDiff) + (yDiff*yDiff));
	return prod;
}

-(float)getXImpulse{
	if (!hero) {
		return 0;
	}
	if (hero.position.x < self.position.x) {
        //if (mode == 0) {
        //    return -20;
        //}
		return -20;
	}else {
		return 20;
	}
	
}

-(void)update{
    self.visible = YES;
	self.position = CGPointMake( myBody->GetPosition().x * PTM_RATIO, myBody->GetPosition().y * PTM_RATIO);
	
	if (!defaultScaleX) {
		oriDefaultScaleX = defaultScaleX = self.scaleX;
	}
	
    if (hero.position.x < self.position.x) {
        self.scaleX = defaultScaleX;
        oriDefaultScaleX = defaultScaleX;
	}else {
        self.scaleX = -1*defaultScaleX;
        oriDefaultScaleX = -1*defaultScaleX;
    }
    
	frame_counter ++;
	if (frame_counter%33 == 0) {
		if ([self distanceToHero] > 50 ) {
			b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
			b2Vec2 impulse([self getXImpulse],10);
			myBody->ApplyLinearImpulse(impulse,point);
		}
	}
	
	if (frame_counter%45 == 0) {
		self.scaleX = oriDefaultScaleX*1.05;
	}
	
	if (frame_counter%91 == 0) {
		self.scaleX = oriDefaultScaleX*1.0;
	}
	if (frame_counter%21 == 0) {
        b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
        b2Vec2 impulse(0,100);
        myBody->ApplyLinearImpulse(impulse,point);
    }
	
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [super dealloc];
}


@end
