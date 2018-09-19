//
//  MenuTransitionSensorSprite.m
//  BulletTime
//
//  Created by johan ten broeke on 8/12/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "MenuTransitionSensorSprite.h"

@implementation MenuTransitionSensorSprite

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(disableMenuButton:) 
													 name:@"disableMenuButton" 
												   object:nil];
    }
    
    return self;
}

-(void)disableMenuButton:(NSNotification *)note{
    //NSLog(@">>>> DestroyPhysics <<<<<%@",self);
    [self destroyPhysics];
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}

@end
