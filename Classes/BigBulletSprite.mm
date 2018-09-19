//
//  BigBulletSprite.m
//  BulletTime
//
//  Created by Johan ten Broeke on 6/1/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "BigBulletSprite.h"
#import "ABCannon.h"
#import "OOOGameViewDecorator.h"


@implementation BigBulletSprite

static CCSprite *prevtrailholder = nil;

+(void)setTrailHolder:(CCSprite*)cann{
    prevtrailholder = cann;
    //NSLog(@"prev trailholder %@",cann);
}

+(CCSprite*)getPrevTrailHolder{
    if(prevtrailholder != nil){
        //NSLog(@"prev trailholder %@",prevtrailholder);
    }
    return prevtrailholder;
}

-(id)init{
    self = [super init];
	if(self) {
		frames_lived = 0;
        if([BigBulletSprite getPrevTrailHolder] != nil){
            [[OOOGameViewDecorator getBatmanLayer] removeChild:[BigBulletSprite getPrevTrailHolder] cleanup:YES];
            [BigBulletSprite setTrailHolder:nil];
        }
        trailholder = [[CCSprite alloc]init];
        [BigBulletSprite setTrailHolder:trailholder];
        [[OOOGameViewDecorator getBatmanLayer] addChild:trailholder];
        [trailholder release];
	
	
        emitter = [CCParticleSun node];
        emitter.life = 1.0f;
        emitter.visible = NO;
        emitter.duration = 1.0f;
        emitter.lifeVar = 0.1f;
        emitter.totalParticles = 50;
        emitter.emissionRate = 50;
        
        [[OOOGameViewDecorator getBatmanLayer] addChild:emitter];
    }
	return self;
	
}

-(void)playClouds{
    [self destroyPhysics];
    [self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
                    @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear)];
}

-(void)clear{
    [[OOOGameViewDecorator getBatmanLayer] removeChild:emitter cleanup:YES];
    [[self parent] removeChild:self cleanup:YES];
    [[ABCannon get]setScrollFocus:YES];
}

-(void)update{
	[super update];
	frames_lived ++;
	
	emitter.visible = YES;
	emitter.position = self.position;
	if(frames_lived >= 200){
        [self playClouds];
        return;
	}
    
    if(frames_lived%3 == 0){
        CCSprite *trail = [[CCSprite alloc] initWithSpriteFrameName:@"trail.png"];
        trail.position = self.position;
        [trailholder addChild:trail];
        [trail release];
    }
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat:(myBody->GetPosition().x * PTM_RATIO)],@"xposition",
                              [NSNumber numberWithFloat:(myBody->GetPosition().y * PTM_RATIO)],@"yposition",
                              [NSNumber numberWithFloat:myBody->GetLinearVelocity().x] ,@"xspeed",
                              @"cannonball",@"id",nil];
    
    [userInfo retain];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onScroll" 
                       object:nil
                       userInfo:userInfo]];
    [userInfo release];
    
}



-(void) setB2Body: (b2Body *)body{
	body->SetBullet(TRUE);
	[super setB2Body:body];
	b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
	b2Vec2 impulse(-[ABCannon getXForce],-[ABCannon getYForce]);
	myBody->ApplyLinearImpulse(impulse,point);
}

- (void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	//[emitter release];
	[super dealloc];
}

@end
