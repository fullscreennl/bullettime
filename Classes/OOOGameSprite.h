//
//  GameSprite.h
//  oneonone
//
//  Created by johan ten broeke on 2/23/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#define PTM_RATIO 32

#import "cocos2d.h"
#import "Box2D.h"


@interface OOOGameSprite : CCSprite {
	NSString *name;
	CCSpriteBatchNode *sheet;
	b2Body *myBody;
	NSArray *keyframes;
	BOOL _obeyPhysics;
	NSString *className;
	NSString *spriteData;
	NSString *currentFrameName;
	float defaultXscaleValue;
}

//-(id)initWithSheet: (CCSpriteSheet *)_sheet andName:(NSString *)_name andRect:(NSArray *)_rect;
-(id)initWithSheet: (CCSpriteBatchNode *)_sheet andName:(NSString *)_name andKeyFrame:(NSString *)frame;
-(void)setHeight:(float)height;
-(void)setWidth:(float)width;
-(NSString *) getName;
-(void) setB2Body: (b2Body *)body;
-(void) update;
-(b2Body *) getB2Body;
-(void)gotoAndStop:(NSString *)frame_name;
-(void)setKeyFrames:(NSArray *)_keyframes;
-(void)gotoAndPlay:(NSString *)frame_name loop:(BOOL)_loop;
-(void)gotoAndPlay:(NSString *)frame_name target:(id)obj callback:(SEL)cb;
-(void)stop;
-(void)obeyPhysics:(BOOL)_bool;
-(void)destroyPhysics;
-(void)destroy;
-(void)playFrames:(NSArray *)frames loop:(BOOL)_loop target:(id)obj callback:(SEL)cb;
-(void)setClassName:(NSString *)n;
-(NSString *)getClassName;
-(b2Joint *)getJointByName: (NSString *)_name;
-(void)destroyJointByName: (NSString *)_name;
-(void)destroyAllConnectedJoints;
-(void)setSpriteData:(NSString *)data;
-(NSString *)getSpriteData;

@end
