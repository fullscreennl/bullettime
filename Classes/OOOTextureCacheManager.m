//
//  OOOTextureCacheManager.m
//  oneonone_stripped
//
//  Created by johan ten broeke on 7/27/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOTextureCacheManager.h"
#import "cocos2d.h"


@implementation OOOTextureCacheManager

static OOOTextureCacheManager *sharedOOOTextureCacheManager_=nil;

+ (OOOTextureCacheManager *)sharedTextureCacheManager
{
	if (!sharedOOOTextureCacheManager_)
		sharedOOOTextureCacheManager_ = [[OOOTextureCacheManager alloc] init];
	
	return sharedOOOTextureCacheManager_;
}

-(id) init
{
	if( (self=[super init])) {
		atlasNames = [[NSMutableDictionary alloc] init];
	}
	return self;
}

-(void)addAtlas:(NSString *)atlas andTexture:(NSString*)texname{
	
	CCTexture2D *tex = [[CCTextureCache sharedTextureCache] addImage:texname];
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:atlas texture:tex];

}

-(void)dealloc{
	[super dealloc];
	[atlasNames release];
}


@end
