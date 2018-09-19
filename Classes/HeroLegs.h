//
//  HeroLegs.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 10/4/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface HeroLegs : CCSprite {
	NSMutableArray *frames;
	int state;
	int cursor;
	int framecounter;
    
}

-(void)walk;
-(void)stand;
-(void)jump;
-(void)update:(float)walkspeed;

@end
