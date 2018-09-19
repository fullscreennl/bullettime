//
//  EventAwakeningVisualSprite.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/25/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "EventAwakeningVisualSprite.h"
#import "OOOConfig.h"
#import "cocos2d.h"


@implementation EventAwakeningVisualSprite

-(void)setBGLayer:(OOOBackgroundLayer *)bg
{
	bgLayer = bg;
}

-(void)setSpriteData:(NSString *)data
{
	spriteData = data;
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(drawSign:) 
												 name:spriteData
											   object:nil];
}

-(void)drawSign:(NSNotification*)note
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	if(spriteData && bgLayer){
		
		int x = [[[note userInfo] objectForKey:@"x"] intValue];
		int y = [[[note userInfo] objectForKey:@"y"] intValue];
		
		CCSprite *sign = [[CCSprite alloc] initWithSpriteFrameName:@"sign.png"];
		self.position =  ccp(x, y);
		sign.position = self.position;
		[bgLayer addChild:sign];
		
		CCLabelBMFont *titleLabel;
		
		NSArray *msgs = [[[note userInfo] objectForKey:@"msg"] componentsSeparatedByString:@"#"];

		int arrayCount = [msgs count];
		for (int i = 0; i < arrayCount; i++) {
			titleLabel = [CCLabelBMFont labelWithString:[msgs objectAtIndex:i] fntFile:MAIN_FONT];
			titleLabel.position = ccp(x, y + 4 - i*11);
			titleLabel.scale = 0.3;
			[bgLayer addChild:titleLabel];
		}
		[sign release];
	}
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}

@end
