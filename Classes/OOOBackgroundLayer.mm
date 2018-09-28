//
//  OOOBackgroundLayer.mm
//  oneonone
//
//  Created by Johan ten Broeke on 2/21/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//
enum{
	kContentWidth=512,
	kContentHeight=512
};
#import "OOOBackgroundLayer.h"
#import "OOOConfig.h"
#include <cmath>
#define NSN(__X__) [NSNumber numberWithInt:__X__]

@implementation OOOBackgroundLayer

+(id) layer
{
	OOOBackgroundLayer *layer = [OOOBackgroundLayer node];
	return layer;
}

// initialize your instance here
//-(id) init
-(void)drawWithImages:(NSArray *)_arr
{
	
	//NSLog(@"arr %@",_arr);
	
	arr = _arr;
	[arr retain];
	
	self.isTouchEnabled = NO;
    
    float slotSize = [[arr objectAtIndex:2] floatValue];
	
	int totalWidth = 6 * 480;
	int nrSlots = round(totalWidth/slotSize);
	flatXposses = [[NSMutableArray alloc] initWithCapacity:nrSlots];
	for (int i=0; i < nrSlots; i++) {
		[flatXposses addObject:[NSNumber numberWithInt:(i*slotSize + (slotSize/2))]];
	}
    
	NSString *sheetname = [arr objectAtIndex:0];
	NSString *bgname = [arr objectAtIndex:1];
    
    CCSpriteBatchNode *sheet;
    CCTexture2D *tex;

    sheet = [CCSpriteBatchNode batchNodeWithFile:[bgname stringByAppendingString: @".pvr"] capacity:150];
    tex = [[CCTextureCache sharedTextureCache] addImage: [bgname stringByAppendingString: @".pvr"]];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: [bgname stringByAppendingString: @".plist"] texture:tex];
    [self addChild:sheet z:0 tag:675];

	sheet = [CCSpriteBatchNode batchNodeWithFile:[sheetname stringByAppendingString: @".pvr"] capacity:150];
	tex = [[CCTextureCache sharedTextureCache] addImage:[sheetname stringByAppendingString: @".pvr"]];
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[sheetname stringByAppendingString: @".plist"] texture:tex];
	[self addChild:sheet z:1 tag:674];
    
    if([[arr objectAtIndex:3] isEqualToString:@"PARTY"]){
        sheet = [CCSpriteBatchNode batchNodeWithFile:@"ep12_2.pvr" capacity:150];
        tex = [[CCTextureCache sharedTextureCache] addImage:@"ep12_2.pvr"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"ep12_2.plist" texture:tex];
        [self addChild:sheet z:1 tag:673];
    }
	
	[self tileBG];
    if( [[arr objectAtIndex:3] isEqualToString:@"MENU"]){
        [self drawRainbow];
        rainbow = YES;
    }else{
        [self drawItem];
        rainbow = NO;
    }
	//[self drawRepeating_1];
    NSLog(@" array:  %@", [arr objectAtIndex:3]);
    if( [[arr objectAtIndex:3] isEqualToString:@"YES"]){
        [self drawRepeating_2];
    }else if (( [[arr objectAtIndex:3] isEqualToString:@"PARTY"])){
        [self drawRepeatingNoRandom_2];
    }else if (( [[arr objectAtIndex:3] isEqualToString:@"MENU"])){
       // [self drawRepeatingNoRandom_2];
    }else{
        [self drawRepeatingNoRandom];
    }
    NSLog(@">>>>>>>>>>>>>> testies 1");
	[self drawRepeating_3];
    NSLog(@">>>>>>>>>>>>>> testies 2");
    [self playBGSound:[arr objectAtIndex:4]];
    NSLog(@">>>>>>>>>>>>>> testies 3");
	[arr release];

}


-(void)playBGSound:(NSString*)sound_id{
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:sound_id, @"music", nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onBackgroundMusicEvent" 
                       object:nil 
                       userInfo:userinfo]];
}

-(void)paralax{
	bg.position = ccp(GAMEWORLD_WIDTH/2 +(self.position.x * 0.5) , GAMEWORLD_HEIGHT /2);
    if(rainbow){
        moon.position = ccp(GAMEWORLD_WIDTH/3 +(self.position.x * 0.5) , moon.contentSize.height/2.0);
    }else{
        moon.position = ccp(GAMEWORLD_WIDTH/3 +(self.position.x * 0.5) , 280);
    }
}

-(void)tileBG{
	ccTexParams params = {GL_LINEAR,GL_LINEAR,GL_REPEAT,GL_REPEAT};
	bg = [CCSprite spriteWithSpriteFrameName:@"bg_tile.png"];
	[bg setTextureRect:CGRectMake(0, 0, 6*kContentWidth, kContentHeight)];
	bg.position = ccp( GAMEWORLD_WIDTH /2 , GAMEWORLD_HEIGHT /2); // center sprite
	[bg.texture setTexParameters:&params];
	[self addChild:bg];

}

-(void)drawItem{
	moon =[CCSprite spriteWithSpriteFrameName:@"moon.png"];
	moon.position = ccp(GAMEWORLD_WIDTH/3  , 280);
	[self addChild:moon];
    NSLog(@"moon 1");
}

-(void)drawRainbow{
	moon =[CCSprite spriteWithSpriteFrameName:@"moon.png"];
	moon.position = ccp(GAMEWORLD_WIDTH/3  ,  moon.contentSize.height/2.0);
	[self addChild:moon];
    NSLog(@"moon 2");
}

/**
-(void)drawRepeating_1{
	if ([[arr objectAtIndex:2]isEqualToString:@"0"]) {
		return;
	}
	int arraylen = [flatXposses count];
	for (int i =0; i<14; i++){
		//ccTexParams params2 = {GL_LINEAR,GL_LINEAR,GL_REPEAT,GL_REPEAT};
		int r4 = abs(arc4random());
		float rnd4  = (r4 % 1000)/1000.0;
		NSString *houseNR = [NSString stringWithString:[[NSNumber numberWithInt:round(rnd4*3)] stringValue]];
		//CCSprite *house = [CCSprite spriteWithFile:[NSString stringWithFormat:[arr objectAtIndex:2],houseNR]];
		CCSprite *house = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:[arr objectAtIndex:2],houseNR]];
		int r1 = abs(arc4random());
		float rnd1  = (r1 % 1000)/1000.0;
		int baseline = 0;
		int arrayIndex = round(rnd1*(arraylen-(i+1)));
		house.position = ccp([[flatXposses objectAtIndex:arrayIndex] floatValue] , baseline + house.contentSize.height/2 );
		[flatXposses removeObjectAtIndex:arrayIndex];
		//[house.texture setTexParameters:&params2];
		[self addChild:house];
	}
}
 */

-(void)drawRepeatingNoRandom{
	NSUInteger arraylen = [flatXposses count];
	//NSLog(@"arraylength:%i count: %i",nrSlots,arraylen);
	for (int i =0; i<arraylen; i++){
		//ccTexParams params2 = {GL_LINEAR,GL_LINEAR,GL_REPEAT,GL_REPEAT};
		uint r4 = arc4random();
		float rnd4  = (r4 % 1000)/1000.0;
		NSString *houseNR = [NSString stringWithString:[[NSNumber numberWithInt:round(rnd4*6)] stringValue]];
		//CCSprite *house = [CCSprite spriteWithFile:[NSString stringWithFormat:[arr objectAtIndex:3],houseNR]];
        //NSLog(@">> ,%@",[NSString stringWithFormat:@"e_%@.png",houseNR]);
		CCSprite *house = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"e_%@.png",houseNR]];
		uint r1 = arc4random();
		float rnd1  = (r1 % 1000)/1000.0;
		int baseline = 0;
		uint r2 = arc4random();
		float rnd2  = (r2 % 1000)/1000.0;
		house.scaleX = 0.9 + rnd2*0.2;
        house.scaleY = 512.0/house.contentSize.height;
		//float houseHeight = house.contentSize.height * house.scaleY; 
		int arrayIndex = round(rnd1*(arraylen-(i+1)));
		house.position = ccp([[flatXposses objectAtIndex:arrayIndex] floatValue]  , baseline + 512.0/2 );
		[flatXposses removeObjectAtIndex:arrayIndex];
		//[house.texture setTexParameters:&params2];
		[self addChild:house];
		
	}
}

-(void)drawRepeatingNoRandom_2{
	//int arraylen = [flatXposses count];
	//NSLog(@"arraylength:%i count: %i",nrSlots,arraylen);
    NSMutableArray *newxposses = [[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:500],[NSNumber numberWithInt:2880-800],[NSNumber numberWithInt:1440], nil] retain]; 
    [flatXposses release];
    flatXposses = newxposses;
	for (int i =0; i<3; i++){
		//ccTexParams params2 = {GL_LINEAR,GL_LINEAR,GL_REPEAT,GL_REPEAT};
		//int r4 = abs(arc4random());
		//float rnd4  = (r4 % 1000)/1000.0;
		//NSString *houseNR = [NSString stringWithString:[[NSNumber numberWithInt:round(rnd4*6)] stringValue]];
		//CCSprite *house = [CCSprite spriteWithFile:[NSString stringWithFormat:[arr objectAtIndex:3],houseNR]];
        //NSLog(@">> ,%@",[NSString stringWithFormat:@"e_%@.png",houseNR]);
        NSString *houseNR = [NSString stringWithString:[[NSNumber numberWithInt:i] stringValue]];
		CCSprite *house = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"e_%@.png",houseNR]];
		//int r1 = abs(arc4random());
		//float rnd1  = (r1 % 1000)/1000.0;
		int baseline = 0;
		//int r2 = abs(arc4random());
		//float rnd2  = (r2 % 1000)/1000.0;
		//house.scaleX = 0.9 + rnd2*0.2;
		float houseHeight = house.contentSize.height * house.scaleY; 
		//int arrayIndex = round(rnd1*(arraylen-(i+1)));
		house.position = ccp([[flatXposses objectAtIndex:i] floatValue]  , baseline + houseHeight/2 );
		//[flatXposses removeObjectAtIndex:i];
		//[house.texture setTexParameters:&params2];
		[self addChild:house];
		
	}
}

-(void)drawRepeating_2{
	NSUInteger arraylen = [flatXposses count];
	//NSLog(@"arraylength:%i count: %i",nrSlots,arraylen);
	for (int i =0; i<arraylen; i++){
		//ccTexParams params2 = {GL_LINEAR,GL_LINEAR,GL_REPEAT,GL_REPEAT};
        uint r4 = arc4random();
        NSLog(@"integer from arc4 %ui",r4);
		float rnd4  = (r4 % 1000)/1000.0;
		NSString *houseNR = [NSString stringWithString:[[NSNumber numberWithInt:round(rnd4*6)] stringValue]];
		//CCSprite *house = [CCSprite spriteWithFile:[NSString stringWithFormat:[arr objectAtIndex:3],houseNR]];
        //NSLog(@">> ,%@",[NSString stringWithFormat:@"e_%@.png",houseNR]);
		CCSprite *house = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"e_%@.png",houseNR]];
		uint r1 = arc4random();
		float rnd1  = (r1 % 1000)/1000.0;
		int baseline = 0;
		uint r2 = arc4random();
		float rnd2  = (r2 % 1000)/1000.0;
		house.scaleY = 0.8 + rnd2*0.4;
		float houseHeight = house.contentSize.height * house.scaleY; 
		int arrayIndex = round(rnd1*(arraylen-(i+1)));
		house.position = ccp([[flatXposses objectAtIndex:arrayIndex] floatValue]  , baseline + houseHeight/2 );
		[flatXposses removeObjectAtIndex:arrayIndex];
		//[house.texture setTexParameters:&params2];
		[self addChild:house];
		
	}
}

-(void)drawRepeating_3{
	for (int i =0; i<10; i++){
		//ccTexParams params2 = {GL_LINEAR,GL_LINEAR,GL_REPEAT,GL_REPEAT};
		//CCSprite *cloud = [CCSprite spriteWithFile:[arr objectAtIndex:4] rect:CGRectMake(0, 0, 288, 98)];
		CCSprite *cloud = [CCSprite spriteWithSpriteFrameName:@"cloud.png"];
		uint r1 = arc4random();
		float rnd1  = (r1 % 1000)/1000.0;
		uint r2 = arc4random();
		float rnd2  = (r2 % 1000)/1000.0;
		//float ypos = 
		
		
		//[cloud.texture setTexParameters:&params2];
		uint r3 = arc4random();
		float rnd3  = (r3 % 1000)/1000.0;
		cloud.scale = 0.8 + 0.5*rnd3;
		cloud.opacity = 64 + rnd3*128;
		float cloudHeight = cloud.scale * cloud.contentSize.height; 
		cloud.position = ccp(rnd1*GAMEWORLD_WIDTH  , ((GAMEWORLD_HEIGHT/3)*rnd2 + 2*GAMEWORLD_HEIGHT/3) - cloudHeight/2.0);
		[self addChild:cloud];
		[self moveObject:cloud];
	}
}

-(void)moveObject: (CCSprite *) sp
{
	uint r1 = arc4random();
	float rnd1  = (r1 % 1000)/1000.0;
	id moveAction = [CCMoveBy actionWithDuration:2.0f position:ccp(5 + rnd1*15,0)];
	id repeatAction = [CCRepeatForever actionWithAction:moveAction];
	[sp runAction:repeatAction];
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	//NSLog(@"backgroundlayer dealloced!!");
    [flatXposses release];
	[super dealloc];
}
@end


