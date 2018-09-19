//
//  BatmanLayer.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 9/23/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "OOOGameView.h"
#import "AnimatedSpeachBubbleDelegate.h"
#import "AnimatedSpeachBubble.h"

@interface OOOBatmanLayer : CCLayer <AnimatedSpeachBubbleDelegate>{
	int showcount;
	int dustShowcount;
    NSDictionary *syncinfo;
}
+(id)layer; 
-(void)miniFadeOutAlert:(NSNotification *)note;
-(void)sync;
@end
