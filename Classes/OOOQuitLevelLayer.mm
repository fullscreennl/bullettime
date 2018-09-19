//
//  OOOQuitLevelLayer.m
//  oneonone
//
//  Created by johan ten broeke on 3/24/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOQuitLevelLayer.h"
#import "OOOResourceView.h"
#import "OOOSharedResourceManager.h"
#import "OOOConfig.h"
#import "OOOSnapshot.h"
#import "OOOSharedLevelmapData.h"
#import "HeroSprite.h"
#import "ABCannon.h"
#import "OOOSpritePresenceTable.h"
#import "OOOStore.h"

@implementation OOOQuitLevelLayer

+(id) layer
{
	OOOQuitLevelLayer *layer = [OOOQuitLevelLayer node];
	return layer;
}

-(void)sniffDeviceEnv{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        viewportH = 768;
        viewportW = 1024;
        viewportHH = viewportH/2;
        viewportHW = viewportW/2;
        ipad = YES;
        menuX = -700;
        menuY = 275;
        moveMenuBy = 240;
    }else{
        viewportH = 375;
        viewportW = 667;
        viewportHH = viewportH/2;
        viewportHW = viewportW/2;
        ipad = NO;
        menuX = -500;
        menuY = 0;
        moveMenuBy = 365;
    }
}

-(id) init
{
	if( (self=[super init])) {
        
        [self sniffDeviceEnv];
        
		CCSpriteBatchNode *sheet = [CCSpriteBatchNode batchNodeWithFile:@"main_texture.pvr" capacity:150];
		CCTexture2D *tex = [[CCTextureCache sharedTextureCache] addImage:@"main_texture.pvr"];
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"main_texture.plist" texture:tex];
		[self addChild:sheet z:0 tag:674];	
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(bulletTimeEnded:) 
													 name:@"bulletTimeEnded" 
												   object:nil];
				
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onResourcesChanged:) 
													 name:@"onResourcesChanged" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onMenuFocusChanged:) 
													 name:@"onMenuFocusChanged" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onScrollingInCannonMode:) 
													 name:@"scrollingInCannonMode" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(showManualScrollIndicator:) 
													 name:@"showManualScrollIndicator" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(hideManualScrollIndicator:) 
													 name:@"hideManualScrollIndicator" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(goTouchMode:) 
													 name:@"touchControlMode" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onConversationEntered:) 
													 name:@"onSpeak" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onConversationComplete:) 
													 name:@"speachCompleted" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(disableMenuButton:) 
													 name:@"disableMenuButton" 
												   object:nil];
        
        
        
        
		
		self.isTouchEnabled = YES;
		busyBulletTiming = NO;
		
		menu = [CCMenu menuWithItems:nil];
		
		CCSprite *sprite1 = [CCSprite spriteWithSpriteFrameName:@"back_button0001.png"];
		CCSprite *sprite2 = [CCSprite spriteWithSpriteFrameName:@"back_button0002.png"];
		CCSprite *sprite3 = [CCSprite spriteWithSpriteFrameName:@"back_button0003.png"];
		
		CCMenuItemSprite *item = [CCMenuItemSprite itemFromNormalSprite:sprite1 
									   selectedSprite:sprite2 
									   disabledSprite:sprite3 
											   target:self 
											 selector:@selector(showMenu:)];	
		[menu addChild:item];
        if(!ipad){
            menu.position = ccp(20,viewportH - 20);
        }else{
            menu.position = ccp(50,viewportH - 80);
        }
		
		[self addChild:menu];
		[self addResourceView];
		[self drawBulletTimeButton];
		//[self drawSnapshotButton];
		[self drawSettingsButton];
        if(![[OOOSharedLevelmapData get] hasUpgraded]){
             [self drawTeaserButton];
        }
        overlay = [CCSprite spriteWithFile:@"overlay.png"];
		[self addChild:overlay];
		overlay.position = ccp(viewportHW,viewportHH);
		overlay.visible = NO;
		[self drawMiniMenu];
        
        [self drawDirectResumeButton];
        [self drawManualScrollIndicator];
        
        mustDrawViewButton = NO;
        
        if([[OOOSharedLevelmapData get]isCurrentlyInMenu]){
            [self goMenuState];
        }
        store = [[OOOStore alloc] init];
        
        settings_click_disabled = NO;
        ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [ai setHidden:YES];
	}
    
	return self;
}

-(void)drawDirectResumeButton{
    
    rmenu = [CCMenu menuWithItems:nil];
    
    CCSprite *sprite3 = [CCSprite spriteWithSpriteFrameName:@"resume_btn.png"];
	CCSprite *sprite3sel = [CCSprite spriteWithSpriteFrameName:@"resume_btn_sel.png"];
    
	CCMenuItemSprite *item3 = [CCMenuItemSprite itemFromNormalSprite:sprite3 
													  selectedSprite:sprite3sel
													  disabledSprite:nil 
															  target:self 
															selector:@selector(resumeFromScrolling:)];
    item3.scale = 0.8;
    
    [rmenu addChild:item3];
    rmenu.position = ccp(50,viewportH - 50);
    [self addChild:rmenu];
    rmenu.visible = NO;

}



-(void)drawManualScrollIndicator{
    manScrollInd = [CCSprite spriteWithSpriteFrameName:@"drag_hand.png"];
    manScrollInd.visible = NO;
    if(!ipad){
        manScrollInd.position = ccp(viewportHW,40);
    }else{
        manScrollInd.position = ccp(viewportHW,100);
    }
    [self addChild:manScrollInd];
}

-(void)showManualScrollIndicator:(NSNotification*)note{
    manScrollInd.visible = YES;
    bt_menu.visible = NO;
}

-(void)hideManualScrollIndicator:(NSNotification*)note{
    manScrollInd.visible = NO;
    if([OOOSharedResourceManager hasBulletTime]){
		bt_menu.visible = YES;
	}
}

-(void)onConversationEntered:(NSNotification*)note{
    menu.visible = NO;
    bt_menu.visible = NO;
    /*
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"sfx_delishaDialog", @"sound", nil];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onSoundEffect" 
                       object:nil 
                       userInfo:userinfo]];
*/
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"sfx_delishaDialog", @"music", nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onBackgroundMusicEvent" 
                       object:nil 
                       userInfo:userinfo]];
    
}

-(void)onConversationComplete:(NSNotification*)note{
    menu.visible = YES;
    if([OOOSharedResourceManager hasBulletTime]){
		bt_menu.visible = YES;
	}
    [[NSNotificationCenter defaultCenter] 
      postNotification:[NSNotification 
                        notificationWithName:@"resumePreviousBGTrack" 
                        object:nil 
                        userInfo:nil]];
   
}


-(void)hideMenuButton{
	menu.visible = NO;
}

-(void)goTouchMode:(NSNotification*)note{
    
   // NSLog(@"TOUCHMODE SET !");
    
    NSString *touchmode = [[note userInfo] objectForKey:@"mode"];
    if([touchmode isEqualToString:@"gun"]){
        mustDrawViewButton = YES;
        manScrollInd.visible = NO;
    }else{
        mustDrawViewButton = NO;
    }
}

-(void)drawMiniMenu{
    //NSLog(@"draw mini menu!");
    
	menu_container = [[CCNode alloc]init];
	
	CCMenu *mini_menu = [CCMenu menuWithItems:nil];
	
	//CCSprite *bg = [CCSprite spriteWithSpriteFrameName:@"square_monsterblob.png"];
	CCSprite *bg = [CCSprite spriteWithSpriteFrameName:@"sliding_menu_bg.png"];
	bg.position = ccp(220,160);
	//bg.scaleY = 3.0;
	
	CCSprite *sprite1 = [CCSprite spriteWithSpriteFrameName:@"reset_btn.png"];
	CCSprite *sprite1sel = [CCSprite spriteWithSpriteFrameName:@"reset_btn_sel.png"];
	CCMenuItemSprite *item = [CCMenuItemSprite itemFromNormalSprite:sprite1 
													 selectedSprite:sprite1sel 
													 disabledSprite:nil 
															 target:self 
														   selector:@selector(retry:)];
	
	CCSprite *sprite2 = [CCSprite spriteWithSpriteFrameName:@"menu_btn.png"];
	CCSprite *sprite2sel = [CCSprite spriteWithSpriteFrameName:@"menu_btn_sel.png"];
	CCMenuItemSprite *item2 = [CCMenuItemSprite itemFromNormalSprite:sprite2 
													 selectedSprite:sprite2sel 
													 disabledSprite:nil 
															 target:self 
														   selector:@selector(goMenu:)];
	
	
	CCSprite *sprite3 = [CCSprite spriteWithSpriteFrameName:@"resume_btn.png"];
	CCSprite *sprite3sel = [CCSprite spriteWithSpriteFrameName:@"resume_btn_sel.png"];
	CCMenuItemSprite *item3 = [CCMenuItemSprite itemFromNormalSprite:sprite3 
													  selectedSprite:sprite3sel
													  disabledSprite:nil 
															  target:self 
															selector:@selector(closeMenu:)];
	
    sprite4 = [CCSprite spriteWithSpriteFrameName:@"ffwd_btn.png"];
	CCSprite *sprite4sel = [CCSprite spriteWithSpriteFrameName:@"ffwd_btn_sel.png"];
	skipbtn = [CCMenuItemSprite itemFromNormalSprite:sprite4 
													  selectedSprite:sprite4sel
													  disabledSprite:nil 
															  target:self 
															selector:@selector(nextLevel:)];
    
    skipbtn.visible = NO;
    
    CCSprite *sprite5 = [CCSprite spriteWithSpriteFrameName:@"eye_btn.png"];
	CCSprite *sprite5sel = [CCSprite spriteWithSpriteFrameName:@"eye_btn_sel.png"];
	CCMenuItemSprite *item5 = [CCMenuItemSprite itemFromNormalSprite:sprite5 
													  selectedSprite:sprite5sel
													  disabledSprite:nil 
															  target:self 
															selector:@selector(stopToScrollManually:)];
    item5.visible = NO;    
    
    if(!ipad){
        item.position = ccp(-50,110);
        item.scale = 0.8;
        item2.position = ccp(-50,-70);
        item2.scale = 0.8;
        item3.position = ccp(0,20);
        item3.scale = 0.8;
        skipbtn.position = ccp(0,-140);
        skipbtn.scale = 0.4;
        item5.position = ccp(-75,20);
        if(![ABCannon get] && ![OOOSpritePresenceTable hasID:@"conversation"]){
            item5.scale = 0.6;
            item5.visible = YES;
        }
    }else{
        item.position = ccp(0,50);
        item.scale = 0.8;
        item2.position = ccp(70,50);
        item2.scale = 0.8;
        item3.position = ccp(140,50);
        item3.scale = 0.8;
        skipbtn.position = ccp(337,60);
        skipbtn.scale = 0.4;
    }
	//2 text labels
	CCLabelBMFont *textLabel = [CCLabelBMFont labelWithString:@"reset" fntFile:MAIN_FONT];
	textLabel.anchorPoint = ccp(0.5, 0.3);
	textLabel.position = ccp(45,-20);
	
	
	textLabel.scale = .35;
	[item addChild:textLabel];	

	NSString *text = @"menu";
	//subItem.userData = [[NSNumber numberWithInt:1] retain];
	CCLabelBMFont *textLabel2 = [CCLabelBMFont labelWithString:text fntFile:MAIN_FONT];
	textLabel2.anchorPoint = ccp(0.5, 0.3);
	textLabel2.position = ccp(45,-20);
	

	textLabel2.scale = .35;
	[item2 addChild:textLabel2];	
	
	
	if(!ipad){
        [menu_container addChild:bg];
	}
    
	[mini_menu addChild:item];
	[mini_menu addChild:item2];
	[mini_menu addChild:item3];
	[mini_menu addChild:skipbtn];
    [mini_menu addChild:item5];
	
	[menu_container addChild:mini_menu];
    
    menu_container.position = ccp(menuX,menuY);
    
	[self addChild:menu_container];
}

-(void)stopToScrollManually:(id)sender{
    
    
    menu_container.position = ccp(menuX,menuY);
    
    
    NSDictionary *mode = [NSDictionary dictionaryWithObjectsAndKeys:@"cannon" ,@"mode",nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"touchControlMode" 
                       object:nil 
                       userInfo:mode]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(move:) 
                                                 name:@"onCannonMove" 
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(activate:) 
                                                 name:@"onCannonActivated" 
                                               object:nil];
    
    NSDictionary *zoominfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:0.64f] ,@"zoomfact",nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"zoom" 
                       object:nil 
                       userInfo:zoominfo]];
    
    [self schedule: @selector(simulateHeroScrolling:)];
    manualScrollZoomCounter = 0;
    
}

-(void)simulateHeroScrolling: (ccTime) dt{
    manualScrollZoomCounter ++;
    
    if(manualScrollZoomCounter > 60){
        [self unschedule: @selector(simulateHeroScrolling:)];
        rmenu.visible = YES;
        manScrollInd.visible = YES;
        manualScrollZoomCounter = 0;
        return;
    }
    
    OOOGameSprite *hero = [HeroSprite getSprite];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithFloat:hero.position.x],@"xposition",
                              [NSNumber numberWithFloat:hero.position.y],@"yposition",
                              [NSNumber numberWithFloat:0.0] ,@"xspeed",
                              @"hero",@"id",nil];
    
    [userInfo retain];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onScroll" 
                       object:nil
                       userInfo:userInfo]];
    [userInfo release];
}


-(void)resumeFromScrolling:(id)sender{
    
    [self unschedule: @selector(simulateHeroScrolling:)];
    
    NSDictionary *mode = [NSDictionary dictionaryWithObjectsAndKeys:@"gun" ,@"mode",nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"touchControlMode" 
                       object:nil 
                       userInfo:mode]];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:@"onCannonMove"
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:@"onCannonActivated"
                                                  object:nil];
    
    NSDictionary *zoominfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:1.0f] ,@"zoomfact",nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"zoom" 
                       object:nil 
                       userInfo:zoominfo]];
    
    [self closeMenu:sender];
}

-(void)activate:(NSNotification*)note{
    float touchx = [[[note userInfo] objectForKey:@"x"] floatValue];
    //float touchy = [[[note userInfo] objectForKey:@"y"] floatValue];
    startSwipeX = touchx;
}

-(void)move:(NSNotification*)note{
    
    endSwipeX = [[[note userInfo] objectForKey:@"x"] floatValue];
    

    float swipedist = startSwipeX - endSwipeX;
    
    NSDictionary *swipeinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:swipedist], @"swipedist",nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onGameViewMoveBy" 
                       object:nil 
                       userInfo:swipeinfo]];

    
    startSwipeX = endSwipeX;
}


-(void)disableMenuButton:(NSNotification*)note{
    settings_click_disabled = YES;
}

-(void)goSettings:(id)sender{
    if(settings_click_disabled){
        return;
    }
    
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"goSettings" 
					   object:nil
					   userInfo:nil]];
}

-(void)snap:(id)sender{
	OOOSnapshot *snap = [[OOOSnapshot alloc]init];
	[snap captureToPhotoAlbum];
	[snap release];
	
}

-(void)onMenuFocusChanged:(NSNotification*)note{
	[self goMenuState];
}


-(void)goMenuState{
    //self.visible = NO;
	settings_menu.visible = YES;
    if(![self hasUpgraded]){
        teaser_menu.visible =YES;
	}
    menu.visible = NO;
	bt_menu.visible = NO;
	resourceView.visible = NO;
	menu_container.visible = NO;
    /*
    // testing 
    [[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"upgradeSuccess" 
					   object:self
					   userInfo:nil]];
    */
}

-(void)drawBulletTimeButton{
	
	btlabel = [CCLabelBMFont labelWithString:@"0" fntFile:MAIN_FONT];
	btlabel.position = ccp(30,20);
	
	bt_menu = [CCMenu menuWithItems:nil];
	
	CCSprite *sprite1 = [CCSprite spriteWithSpriteFrameName:@"bulletTimeButton.png"];
	
	//CCSprite *sprite2 = [CCSprite spriteWithSpriteFrameName:@"bulletTimeButton.png"];
	//CCSprite *sprite3 = [CCSprite spriteWithSpriteFrameName:@"bulletTimeButton.png"];
	
	CCMenuItemSprite *item = [CCMenuItemSprite itemFromNormalSprite:sprite1 
													 selectedSprite:nil 
													 disabledSprite:nil 
															 target:self 
														   selector:@selector(goBulletTime:)];	
	[item addChild:btlabel];
	[bt_menu addChild:item];
	bt_menu.position = ccp(viewportW-(128/2),viewportH-25);
	[self addChild:bt_menu];
	bt_menu.visible = NO;
	
	[[OOOSharedResourceManager get] notify];
	
}

-(void)drawSettingsButton{
	
	settings_menu = [CCMenu menuWithItems:nil];
	
	CCSprite *sprite1 = [CCSprite spriteWithSpriteFrameName:@"settings_button.png"];
	
	CCMenuItemSprite *item = [CCMenuItemSprite itemFromNormalSprite:sprite1 
													 selectedSprite:nil 
													 disabledSprite:nil 
															 target:self 
														   selector:@selector(goSettings:)];	
	[settings_menu addChild:item];
    
    if(!ipad){
        settings_menu.position = ccp(20,viewportH - 20);
    }else{
        settings_menu.position = ccp(50,viewportH - 80);
    }
	
	[self addChild:settings_menu];
	settings_menu.visible = NO;
	
}

-(void)drawTeaserButton
{
	
	teaser_menu = [CCMenu menuWithItems:nil];
	
	CCSprite *sprite1 = [CCSprite spriteWithFile:@"goldengun_teaser.png"];
    sprite1.scaleX = sprite1.scaleY = 0.5;
	//int width = [sprite1 boundingBox].size.width;
    //int height = [sprite1 boundingBox].size.height;

	CCMenuItemSprite *item = [CCMenuItemSprite itemFromNormalSprite:sprite1 
													 selectedSprite:nil 
													 disabledSprite:nil 
															 target:self 
														   selector:@selector(questionaire:)];
                                                            
	[teaser_menu addChild:item];
    /*
    CCMenuItemSprite *item2 = [CCMenuItemSprite itemFromNormalSprite:sprite1 
													 selectedSprite:nil 
													 disabledSprite:nil 
															 target:self 
														   selector:@selector(goRestore:)];
    [teaser_menu addChild:item2];
    */
    if(!ipad){
//        teaser_menu.position = ccp(viewportW*.5 - width - 20,viewportH - 20);
         teaser_menu.position = ccp(viewportW,viewportH - 10);
    }else{
        teaser_menu.position = ccp(viewportW - 50,viewportH - 30);
    }
	
	[self addChild:teaser_menu];
	teaser_menu.visible = NO;
	
}

-(void)questionaire:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"The Golden Gun\n\n"
                                                   message:@"Please go purchase/restore The Golden Gun."
                                                  delegate:self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"Purchase",@"Restore",nil];
    [alert show];
    [alert release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSString * buttonPressedName = [alertView buttonTitleAtIndex:buttonIndex];
    NSLog(@"buttin lcicked %i, %@",buttonIndex,buttonPressedName);
    if(buttonIndex==1){
        [self goPurchase:nil];
    }else if(buttonIndex==2){
        [self goRestore:nil];
    }
} 


-(void)drawSnapshotButton{
	/*
	snapshot_menu = [CCMenu menuWithItems:nil];
	
	CCSprite *sprite1 = [CCSprite spriteWithSpriteFrameName:@"camera_btn.png"];
	
	CCMenuItemSprite *item = [CCMenuItemSprite itemFromNormalSprite:sprite1 
													 selectedSprite:nil 
													 disabledSprite:nil 
															 target:self 
														   selector:@selector(snap:)];	
	[snapshot_menu addChild:item];
	snapshot_menu.position = ccp(42,320-30);
	[self addChild:snapshot_menu];
	snapshot_menu.visible = NO;
	*/
}

-(void)goPurchase:(id)sender
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"GO GET THE GOLDEN GUN!");
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(onUpgradeSuccess:) 
                                                 name:@"upgradeSuccess" 
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(onUpgradeFailed:) 
                                                 name:@"upgradeFailed" 
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(transactionFinished:) 
                                                 name:@"inAppPurchaseTransactionFailed" 
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(transactionFinished:) 
                                                 name:@"inAppPurchaseTransactionSuccess" 
                                               object:nil];
    [self showActivityIndicator];
    [store upgrade];
}


-(void)goRestore:(id)sender
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"GO RESTORE THE GOLDEN GUN!");
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(onUpgradeSuccess:) 
                                                 name:@"upgradeSuccess" 
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(onUpgradeFailed:) 
                                                 name:@"upgradeFailed" 
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(transactionFinished:) 
                                                 name:@"inAppPurchaseTransactionFailed" 
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(transactionFinished:) 
                                                 name:@"inAppPurchaseTransactionSuccess" 
                                               object:nil];
    [self showActivityIndicator];
    [store restore];
}

-(BOOL)hasUpgraded
{
	return [store hasUpgraded];
}

-(void)transactionFinished: (NSNotification *)note{
	[self hideActivityIndicator];
}

-(void)onUpgradeSuccess:(NSNotification *) note{
    NSLog(@"upgrade suc6 %@ , %@ self %@",[note name],[note object],self);
    teaser_menu.visible= NO;
}

-(void)onUpgradeFailed:(NSNotification *) note{
	NSLog(@"upgrade failed %@ , %@ self %@",[note name],[note object],self);
   teaser_menu.visible= YES;
}

-(void)explicitUpgrade{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[store upgrade];
}


-(void) showActivityIndicator{
	busyUpgrading = YES;
    [[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"stopGame" 
					   object:nil 
					   userInfo:nil]];
    settings_menu.visible = NO;
    teaser_menu.visible= NO;
	[ai setHidden:NO];
	[ai startAnimating];
    if(ipad){
        [ai setCenter:CGPointMake(768-75, 75)];   
    }else{
        [ai setCenter:CGPointMake(320-75, 75)];
    }
	[[[CCDirector sharedDirector] openGLView]  addSubview:ai];
}

-(void) hideActivityIndicator
{
	busyUpgrading = NO;
    [[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"resumeGame" 
					   object:nil 
					   userInfo:nil]];
    settings_menu.visible = YES;
    if(![self hasUpgraded]){
         teaser_menu.visible= YES;
    }
	[ai removeFromSuperview];
}

-(void)addResourceView{
	resourceView = [[OOOResourceView alloc]init];
	//resourceView.position = ccp(240,160);
	[self addChild:resourceView];
}

-(void)onResourcesChanged:(NSNotification*)note{
	int bt = [[[note userInfo]objectForKey:@"bulletTimes"]intValue];
	[btlabel setString:[NSString stringWithFormat:@"%i",bt]];
	if (bt > 0 && !busyBulletTiming) {
		bt_menu.visible = YES;
	}
}

-(void)goBulletTime: (id) sender{
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"bulletTime" 
					   object:nil
					   userInfo:nil]];
	busyBulletTiming = YES;
	bt_menu.visible = NO;
	menu.visible = NO;
	//snapshot_menu.visible = YES;
	overlay.visible=YES;
    if(!ipad){
        overlay.scaleX = 1.0;
        overlay.scaleY = 1.0;
    }else{
        overlay.scaleY = viewportH / 320.0;
        overlay.scaleX = viewportW / 480.0;
    }
    
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"bullet_time", @"sound",nil];
    
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];
	
}

-(void)bulletTimeEnded:(NSNotification *)note{
	busyBulletTiming = NO;
	overlay.visible=NO;
	snapshot_menu.visible = NO;
	menu.visible = YES;
	if([OOOSharedResourceManager hasBulletTime]){
		bt_menu.visible = YES;
	}
}

-(void)retry:(id)sender{
	
	NSString *currentLevel = [[OOOSharedLevelmapData get]currentLevelEntryPoint];
	
	if(!currentLevel){
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onTestLevel" 
						   object:nil
						   userInfo:nil]];
		return;
	}

	NSDictionary *dict = [NSDictionary dictionaryWithObject:currentLevel forKey:@"level_id"];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onDrawLevel" 
					   object:nil
					   userInfo:dict]];
}

-(void)goMenu:(id)sender{
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onLeaveLevel" 
					   object:nil
					   userInfo:nil]];
}

-(void) closeMenu: (id) sender{
    
	menu_container.position = ccp(menuX,menuY);
	menu.visible = YES;
    rmenu.visible = NO;
    manScrollInd.visible = NO;
    skipbtn.visible = NO;
    
    //NSLog(@"nextLevel went off nr 2");
    [sprite4 removeChildByTag:23 cleanup:YES]; 
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"resumeGame" 
					   object:nil 
					   userInfo:nil]];
    
}

-(void) nextLevel: (id) sender{
        
	menu_container.position = ccp(menuX,menuY);
	menu.visible = YES;
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"resumeGame" 
					   object:nil 
					   userInfo:nil]];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onNextScene" 
					   object:nil 
					   userInfo:nil]];
	
}

-(void) showMenu: (id) sender{
    int numEscapes = [[OOOSharedLevelmapData get]getNumEsacapes];
    
    NSString *text = [NSString stringWithFormat:@"escapes : %i",numEscapes,nil];
    CCLabelBMFont *escapes_label = [CCLabelBMFont labelWithString:text fntFile:MAIN_FONT];
    //escapes_label.anchorPoint = ccp(0.5, 0.5);
    escapes_label.scale = .7;
    escapes_label.position = ccp(sprite4.position.x - 100,sprite4.position.y + 30);
    
    [sprite4 addChild:escapes_label z:0 tag:23];
    
    int current_level_id = [[[OOOSharedLevelmapData get] currentLevelInd] intValue];
    int progression_ind = [[[OOOSharedLevelmapData get] levelProgresInd] intValue];
    
    BOOL isUsefulToSkip = current_level_id >= progression_ind;
    
    if(numEscapes > 0 && isUsefulToSkip){
        skipbtn.visible = YES;
    }else{
        skipbtn.visible = NO;
    }
    
    
	id move = [CCMoveBy actionWithDuration:0.3 position:ccp(moveMenuBy,0)];
	id ease = [CCEaseIn actionWithAction:move rate:3.0f];
	[menu_container runAction:ease];
	
	//menu_container.position = ccp(-180,0);
	menu.visible = NO;
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"stopGame" 
					   object:nil 
					   userInfo:nil]];
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[resourceView release];
    [store release];
	[menu_container release];
	[super dealloc];
}

@end
