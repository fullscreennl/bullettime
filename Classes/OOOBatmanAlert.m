//
//  OOOBatmanAlert.m
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/1/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOBatmanAlert.h"


@implementation OOOBatmanAlert

-(id) initWithPNGName:(NSString*)png{
	if( (self=[super init])) {
		t = 0.4f;
		[self setUp:png];
	}
	return self;
}

-(id) initWithPNGName:(NSString*)png andTime:(float)_t{
	if( (self=[super init])) {
		t = _t;
		[self setUp:png];
	}
	return self;
}

-(void)setUp:(NSString*)png{
	CCSprite *im = [CCSprite spriteWithSpriteFrameName:png];
	[self addChild:im];
	[self fade];
}


-(void)fade{
	[self schedule:@selector(clearSelf:) interval:t];
}

-(void)clearSelf:(id)target{
	[self unschedule:@selector(clearSelf:)];
	[self.parent removeChild:self cleanup:YES];
}

-(void)dealloc{
	[super dealloc];
}

@end
