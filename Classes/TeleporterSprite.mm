//
//  TeleporterSprite.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 7/27/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "TeleporterSprite.h"
#import "OOOGameViewDecorator.h"
#import "cocos2d.h"


@implementation TeleporterSprite

-(id)init{
	
	if( (self=[super init])) {
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onHit:) 
													 name:@"onTeleporterHit" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onSemiHit:) 
													 name:@"onNextScene"
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(createHero:) 
													 name:@"createHero"
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(displayExitAlert:) 
													 name:@"displayExitAlert"
												   object:nil];
        

	}
	return self;
	
}

-(void)displayExitAlert:(NSNotification*)note{
    if( [spriteData isEqualToString:@"leveldata/menu"] ){
        
        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"level_cleared.png" ,@"msg",[NSNumber numberWithFloat:2.0],@"time",[NSNumber numberWithFloat:1.2f] ,@"alertScale",nil];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"showImageAlert" 
						   object:nil 
						   userInfo:userInfo]];
    }
}

-(void)createHero:(NSNotification*)note{

    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"doubleTeleporter" 
                       object:nil
                       userInfo:nil]];

}

-(void)onHit: (NSNotification *)note{
	 

	OOOGameSprite *sprite1 = [[note userInfo] objectForKey:@"sprite1"];
	OOOGameSprite *sprite2 = [[note userInfo] objectForKey:@"sprite2"];
	
	if(sprite1 == self or sprite2 == self){
		[[NSNotificationCenter defaultCenter] removeObserver:self];
		if ([spriteData isEqualToString:@"leveldata/menu"] || [spriteData isEqualToString:@"leveldata/menu2"]) {
			
			[[NSNotificationCenter defaultCenter] 
			 postNotification:[NSNotification 
							   notificationWithName:@"commitScore" 
							   object:nil
							   userInfo:nil]];
			
		}else {
			//NSLog(@"next scene !!!");
		}
        
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"saveGameData" 
                           object:nil 
                           userInfo:nil]];


		NSDictionary *dict = [NSDictionary dictionaryWithObject:spriteData forKey:@"level_id"];
		NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"warp", @"sound",nil];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onSoundEffect" 
						   object:nil 
						   userInfo:userinfo]];	
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onDrawLevel" 
						   object:nil
						   userInfo:dict]];
	}

}

-(void)onSemiHit: (NSNotification *)note
{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
    //NSLog(@">>>>>>>>>>>>>>>>>> onSemiHit teleporter %@ ",self);
	if ([spriteData isEqualToString:@"leveldata/menu"] || [spriteData isEqualToString:@"leveldata/menu2"]) {
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"commitScore" 
						   object:nil
						   userInfo:nil]];
		
	}else {
		//NSLog(@"next scene !!!");
	}
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"saveGameData" 
                       object:nil 
                       userInfo:nil]];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObject:spriteData forKey:@"level_id"];
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"warp", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];	
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onDrawLevel" 
					   object:nil
					   userInfo:dict]];
	
	[[NSNotificationCenter defaultCenter] removeObserver:self 
												 name:@"onNextScene"
											   object:nil];
	
}


-(void)dealloc{
	//NSLog(@">>>>>>>>>>>>>>>>>> dealloc teleporter %@ ",self);
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[super dealloc];
}

@end
