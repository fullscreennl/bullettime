//
//  LoseTransition.m
//  oneonone
//
//  Created by johan ten broeke on 3/17/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOTransition.h"
#import "OOOConfig.h"

@implementation OOOTransition

-(id)init{
	self = [super init];
	if(self){
        [self sniffDeviceEnv];
		testMode = NO;
		testModeTarget = nil;
	}
	return self;
}

-(void)sniffDeviceEnv{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        viewportH = 768;
        viewportW = 1024;
        viewportHH = viewportH/2;
        viewportHW = viewportW/2;
        ipad = YES;
    }else{
        viewportH = 375;
        viewportW = 667;
        viewportHH = viewportH/2;
        viewportHW = viewportW/2;
        ipad = NO;
    }
}

-(void)setTestModeWithTarget:(id)target{
	[self setLevelId:@""];
	testMode = YES;
	testModeTarget = target;
}

-(void)setLevelId:(NSString *)_level_id{
	if (labelOK != YES) {
		NSString *msg = [NSString stringWithString:@"Loading"];
		CCLabelBMFont *titleLabel = [CCLabelBMFont labelWithString:msg fntFile:MAIN_FONT];
		titleLabel.position = ccp(viewportHW,viewportHH);
		[self addChild:titleLabel];
		labelOK = YES;
	}
	testMode = NO;
    
    [_level_id retain];
	[level_id release];
    level_id = _level_id;
}

- (void) onEnterTransitionDidFinish{

	id functioncall_action = [CCCallFunc actionWithTarget:self selector:@selector(reload:)];
	id seq2 = [CCSequence actions:[CCDelayTime actionWithDuration: 0.0f],functioncall_action,nil]; 
	[self runAction:seq2];
	
	//NSLog(@"i am the cutscene!");
}

-(void)reload: (id)sel{
	if (testMode) {
		[testModeTarget performSelector:@selector(testLevel)];
		return;
	}
	
	NSDictionary *dict = [NSDictionary dictionaryWithObject:level_id forKey:@"level_id"];
	//[dict retain];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onEnterLevel" 
					   object:nil 
					   userInfo:dict]];

}

-(void)dealloc{
	[level_id release];
	[super dealloc];
}

@end
