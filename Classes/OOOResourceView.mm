//
//  OOOResourceView.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 9/23/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "OOOResourceView.h"
#import "cocos2d.h"
#import "OOOConfig.h"
#import "OOOSharedResourceManager.h"
#import "ABCannon.h"
#import "oneononeAppDelegate.h"

@implementation OOOResourceView

-(id)init{
	if ((self = [super init])) {
                
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(redraw:) 
													 name:@"onResourcesChanged" 
												   object:nil];

        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(goTouchMode:) 
													 name:@"touchControlMode" 
												   object:nil];

        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(redraw2:) 
													 name:@"ABCannonStateChanged" 
												   object:nil];
		
		[self build];
	}
	return self;
}


-(void)goTouchMode:(NSNotification*)note{
    
    //NSLog(@">>>> >>> what!!!!");

    
    NSString *touchmode = [[note userInfo] objectForKey:@"mode"];
    
    if([touchmode isEqualToString:@"cannon"]){
        
         [[ABCannon get] notify];
        
    }else{
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(redraw:) 
													 name:@"onResourcesChanged" 
												   object:nil];
        
        [[OOOSharedResourceManager get] notify];
        
    }
}


-(void)build{
    
    //NSLog(@">>>> >>> draw!!!!");
    CGSize screenSize = [(oneononeAppDelegate*)[[UIApplication sharedApplication] delegate] getScreenSize];
    float yoffset;
    float xoffset;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        xoffset = 1024 - 400.0;
        yoffset = 768.0 - 60;       
    }else{
        xoffset = screenSize.width - 400.0;
        yoffset = screenSize.height;
    }
	
    bg = [CCSprite spriteWithSpriteFrameName:@"meters.png"];
	bg.anchorPoint = ccp(0,1);
	bg.position = ccp(xoffset,yoffset);
	[self addChild:bg];
    
    bg2 = [CCSprite spriteWithSpriteFrameName:@"meters_cannon.png"];
	bg2.anchorPoint = ccp(0,1);
	bg2.position = ccp(xoffset,yoffset);
	[self addChild:bg2];
    
    bg.visible = NO;
    bg2.visible = NO;
	
	healthBar = [CCSprite spriteWithSpriteFrameName:@"health_bar.png"];
	healthBar.anchorPoint = ccp(0,1);
	healthBar.position = ccp(xoffset+243,yoffset-17);
	[self addChild:healthBar];
	
	bulletBar = [CCSprite spriteWithSpriteFrameName:@"health_bar.png"];
	bulletBar.anchorPoint = ccp(0,1);
	bulletBar.position = ccp(xoffset+60,yoffset-17);
	[self addChild:bulletBar];

	[[OOOSharedResourceManager get] notify];
    [[ABCannon get] notify];
}

-(void)redraw:(NSNotification *)note{
    
    //NSLog(@"note : %@",note);
		
	float numBullets = [[[note userInfo] objectForKey:@"numBullets"] floatValue];
	float health = [[[note userInfo] objectForKey:@"health"] floatValue];
	
	float health_perc = health / MAX_HEALTH;
	float bullet_perc = numBullets / MAX_NUM_BULLETS;
	
	if (bullet_perc > 1) {
		bullet_perc = 1;
	}
	
	if (health_perc > 1) {
		health_perc = 1;
	}
	
	bulletBar.scaleX = bullet_perc;
	healthBar.scaleX = health_perc;
    
    bg.visible = YES;
    bg2.visible = NO;

}

-(void)redraw2:(NSNotification *)note{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"onResourcesChanged" object:nil];
    
	float ammo = [[[note userInfo] objectForKey:@"numBullets"] floatValue] / 1.0f;
	float power = [[[note userInfo] objectForKey:@"power"] floatValue];
	
	bulletBar.scaleX = ammo;
	healthBar.scaleX = power;
    
    bg.visible = NO;
    bg2.visible = YES;
    
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}

@end
