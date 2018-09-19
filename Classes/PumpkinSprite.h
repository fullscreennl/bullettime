//
//  PumpkinSprite.h
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 9/29/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EnemySprite.h"

@interface PumpkinSprite : EnemySprite {
	int framecounter;
	CCSprite *eyes_neutral;
	CCSprite *eyes_frowned;
	CCSprite *mouth_neutral;
	CCSprite *mouth_show_teeth;
	
}
-(void)drawElements;

-(void)neutralEyes;
-(void)frownEyes;
-(void)neutralMouth;
-(void)showTeethMouth;
@end
