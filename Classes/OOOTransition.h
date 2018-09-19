//
//  LoseTransition.h
//  oneonone
//
//  Created by johan ten broeke on 3/17/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface OOOTransition : CCScene {
	NSString *level_id;
	BOOL labelOK;
	BOOL testMode;
	id testModeTarget;
    
    int viewportW;
    int viewportH;
    int viewportHW;
    int viewportHH;
    BOOL ipad;
}
-(void)setLevelId:(NSString *)_level_id;
-(void)setTestModeWithTarget:(id)target;
-(void)sniffDeviceEnv;
@end
