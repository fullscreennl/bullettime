//
//  OOOGameViewDecorator.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 7/23/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "cocos2d.h"
#import "OOOGameView.h"
#import "OOOBatmanLayer.h"


@interface OOOGameViewDecorator:CCLayer {
	OOOGameView* gamelayer;
}
+(id) sceneWithLevelId:(NSString *)level_id;
+(id)buildTestLevel:(NSDictionary*)dict;
+(OOOGameView *)getGameView;
+(OOOBatmanLayer *)getBatmanLayer;
@end
