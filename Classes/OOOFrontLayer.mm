//
//  OOOFrontLayer.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 11/20/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "OOOFrontLayer.h"
#import "OOOConfig.h"


@implementation OOOFrontLayer

+(id) layer
{
	OOOFrontLayer *layer = [OOOFrontLayer node];
	return layer;
}


-(void)drawWithImages:(NSArray *)_arr
{
	arr = _arr;
	[arr retain];	
	self.isTouchEnabled = NO;
    if (( [[arr objectAtIndex:3] isEqualToString:@"PARTY"])){
        [self placeDecal];
    }
	[self tile];
	[arr release];
	
}


-(void)tile{
	ccTexParams params = {GL_LINEAR,GL_LINEAR,GL_REPEAT,GL_REPEAT};
	bg = [CCSprite spriteWithSpriteFrameName:@"floor.png"];
	[bg setTextureRect:CGRectMake(0, 0, GAMEWORLD_WIDTH, 132)];
	bg.position = ccp( GAMEWORLD_WIDTH /2 , -38); // center sprite -32
	[bg.texture setTexParameters:&params];
	[self addChild:bg];
}

-(void)placeDecal{
    CCSprite *house = [CCSprite spriteWithSpriteFrameName:@"e_3.png"];
    float houseHeight = house.contentSize.height * house.scaleY; 
    house.position = ccp( 1200.0f  , houseHeight/2 );
    [self addChild:house];
}

@end
