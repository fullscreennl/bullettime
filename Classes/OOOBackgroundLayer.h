//
//  OOOBackgroundLayer.h
//  oneonone
//
//  Created by Johan ten Broeke on 2/21/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "cocos2d.h"
#import "GLES-Render.h"

// bg Layer
@interface OOOBackgroundLayer : CCLayer
{
	CCSprite* bgsprite;
	NSArray *arr;
	NSMutableArray *flatXposses;
	CCSprite *bg;
	CCSprite *moon;
    BOOL rainbow;
}



// adds a new sprite at a given coordinate

+(id) layer; 
-(void)moveObject: (CCSprite*)sp;
-(void)drawWithImages:(NSArray *)arr;
-(void) tileBG;
-(void) drawItem;		
//-(void) drawRepeating_1;
-(void) drawRepeating_2;
-(void) drawRepeating_3;
-(void) paralax;
-(void)drawRepeatingNoRandom;
-(void)drawRepeatingNoRandom_2;
-(void)drawRainbow;
-(void)playBGSound:(NSString*)sound_id;
@end
