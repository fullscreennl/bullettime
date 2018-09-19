//
//  StaticVisualSprite.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 10/3/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "StaticVisualSprite.h"
#import "OOOConfig.h"
#import "cocos2d.h"


@implementation StaticVisualSprite

-(void)setBGLayer:(OOOBackgroundLayer *)bg{
	bgLayer = bg;
	[self drawSign];
	//NSLog(@"bgLayer %@",bgLayer);
}

-(void)setSpriteData:(NSString *)data{
	spriteData = data;
	[self drawSign];
	//NSLog(@"spritedata %@",spriteData);
}

-(void)drawSign{
	if(spriteData && bgLayer){
		
		CCSprite *sign = [[CCSprite alloc] initWithSpriteFrameName:@"sign.png"];
		sign.position = self.position;
		[bgLayer addChild:sign];
		
		CCLabelBMFont *titleLabel;
		
		NSArray *msgs = [spriteData componentsSeparatedByString:@"#"];
		
		int arrayCount = [msgs count];
		for (int i = 0; i < arrayCount; i++) {
            
			titleLabel = [CCLabelBMFont labelWithString:[msgs objectAtIndex:i] fntFile:MAIN_FONT];
			titleLabel.position = ccp(self.position.x, self.position.y + 4 - i*11);
			titleLabel.scale = 0.3;
			[bgLayer addChild:titleLabel];
		}
		[sign release];
	}
}



@end
