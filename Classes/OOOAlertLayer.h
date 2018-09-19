//
//  OOOAlertLayer.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 9/17/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "OOORect.h"
#import "OOORatingRequest.h"

@interface OOOAlertLayer : CCLayer{
	NSMutableArray *lines;
	CCMenu *menu;
	OOORect *bg;
	CCSprite *dialog_bg;
	BOOL pressed;
	NSMutableArray *menuItems;
	float imageAlertYpos;
	//float textAlertYpos;
    
    int viewportW;
    int viewportH;
    int viewportHW;
    int viewportHH;
    BOOL ipad;
    
    NSString *confirmationDialogContext;
    CCSprite *stars_holder;
    CCSprite *dialog_sub_bg;
    NSString *bgImage;
    OOORatingRequest *raterequest;
    CCNode *container1;
}
+(id)layer; 
-(void)showAlert:(NSNotification *)note;
-(void)hideAlert;
-(void)drawButton:(id)target;
-(void)drawYesNoButtons:(id)target;
-(void)removeAllSprites:(id) sel;
-(void)sniffDeviceEnv;
-(void)showMenuInfoForDataIPad:(NSArray *)data andScore:(NSNumber *)score andStars:(int)stars;
-(void)showMenuInfoForData:(NSArray *)data andScore:(NSNumber *)score andStars:(int)stars;
-(void)showStars:(int)numstars;
@end
