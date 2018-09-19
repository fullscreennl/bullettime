//
//  MainSplash.h
//  BeetleBeat
//
//  Created by Jeroen Goor van on 2/25/10.
//  Copyright 2010 fullscreen. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "cocos2d.h"



@interface OOOSettings : CCLayer {
	BOOL soundFXMuted;
	BOOL flipControls;
	NSNumber *calibrationOffset;
	CCSprite *swirlSprite;
	CCSprite *swirlSpriteOff;
	CCSprite *swirlSprite2;
	CCSprite *swirlSpriteOff2;
	CCSprite *friendloudSpr; 
	CCSprite *friendSilentSpr; 
	CCSprite *friendDoodleloudSpr;
	CCSprite *friendDoodleSilentSpr;
	NSMutableDictionary * settings; 
	CCLabelBMFont *jumpshootLabel;
    
    int viewportW;
    int viewportH;
    int viewportHW;
    int viewportHH;
    BOOL ipad;
}

+(id) scene;
-(id) init;
-(void)setSwirlPos:(BOOL)_soundState;
-(void)toggleSound;
-(void)toggleDoodle;
-(void)setControlFlip;
-(void)setCalibration;
-(void)sniffDeviceEnv;
@end