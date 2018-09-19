//
//  MainSplash.mm
//  BeetleBeat
//
//  Created by Jeroen Goor van on 2/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainSplash.h"

@implementation MainSplash

+(id) scene
{
	// 'scene' is an autorelease object.
	//CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	//MainSplash *layer = [MainSplash node];
	
	//BackgroundLayer *bgLayer = [BackgroundLayer layer];
	MainSplash *scene =  [MainSplash node];
	//[scene addChild: layer];

	// return the scene
	return scene;
}
-(id) init
{
	if( (self=[super init])) {
		
		
		CGSize screenSize = [CCDirector sharedDirector].winSize;
		NSLog(@"Screen width in mainSplash %0.2f screen height %0.2f",screenSize.width,screenSize.height);
		
		//Set up sprite
		
		//CCSpriteSheet *ballsheet = [CCSpriteSheet spriteSheetWithFile:@"beetle_64_64.png" capacity:140];
		//[self addChild:ballsheet z:0 tag:kTagSpriteSheetBall];
		
		//CCSprite *sprite = [CCSprite spriteWithFile:@"splash_mockup.png"];
		CCSprite *sprite = [CCSprite spriteWithFile:@"Default.png"];
		[self addChild:sprite];
		sprite.position = ccp( screenSize.width/2, screenSize.height/2);
				
	}
	return self;
}	

- (void)dealloc {
    [super dealloc];
}


@end
