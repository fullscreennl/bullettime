//
//  OOOQuitLevelLayer.h
//  oneonone
//
//  Created by johan ten broeke on 3/24/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "OOOResourceView.h"

@class OOOStore;

@interface OOOQuitLevelLayer : CCLayer {
	OOOResourceView *resourceView;
	CCMenu *bt_menu;
	CCMenu *snapshot_menu;
	CCMenu *menu;
	CCMenu *settings_menu;
	CCLabelBMFont *btlabel;
	BOOL busyBulletTiming;
	CCSprite *overlay;
	CCNode *menu_container;
    CCMenu *rmenu;
    CCMenu *teaser_menu;
    int viewportW;
    int viewportH;
    int viewportHW;
    int viewportHH;
    BOOL ipad;
    int menuX;
    int menuY;
    int moveMenuBy;
    OOOStore *store;
    CCSprite *manScrollInd;
    BOOL busyUpgrading;
    float startSwipeX;
    float endSwipeX;
    
    int manualScrollZoomCounter;
    BOOL mustDrawViewButton;
    UIActivityIndicatorView *ai;
    CCMenuItemSprite *skipbtn;
    CCSprite *sprite4;
    BOOL settings_click_disabled;
    CGSize screenSize;
}
+(id)layer; 
-(void)goMenu: (id) sender;
-(void)addResourceView;
-(void)drawBulletTimeButton;
-(void)drawSnapshotButton;
-(void)drawSettingsButton;
-(void)drawMiniMenu;
-(void)showMenu:(id)sender;
-(void)closeMenu:(id)sender;
-(void)retry:(id)sender;
-(void)hideMenuButton;
-(void)drawTeaserButton;
-(void)sniffDeviceEnv;
-(void)drawDirectResumeButton;
-(void)drawManualScrollIndicator;
-(void)goMenuState;
-(BOOL)hasUpgraded;
-(void) showActivityIndicator;
-(void) hideActivityIndicator;
-(BOOL)hasUpgraded;
-(void)goPurchase:(id)sender;
-(void)goRestore:(id)sender;
@end
