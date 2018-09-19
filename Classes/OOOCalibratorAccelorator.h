//
//  OOOCalibratorAccelorator.h
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 9/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface OOOCalibratorAccelorator : CCLayer {
	int framecounter;
	NSMutableArray *samples;
	NSMutableDictionary *settings;
	CCSprite *ind;
	CCSpriteBatchNode *sheet;
    CGSize screenSize;
    int viewportW;
    int viewportH;
    int viewportHW;
    int viewportHH;
    BOOL ipad;
}
+(id) scene;
-(void) buildMenuBTN;
-(void)buildIndicator;
-(void)sniffDeviceEnv;
@end
