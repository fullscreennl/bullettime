//
//  OOOResourceView.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 9/23/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface OOOResourceView : CCSprite {
	CCSprite *healthBar;
	CCSprite *bulletBar;
	CCSprite *bg;
    CCSprite *bg2;
}
-(void)build;
@end
