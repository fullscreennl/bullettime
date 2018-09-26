//
//  oneononeAppDelegate.h
//  oneonone
//
//  Created by Johan ten Broeke on 2/20/10.
//  Copyright fullscreen.nl 2010. All rights reserved.
//

/*! \mainpage OneOnOne - BulletTime
 *
 * \section made by fullscreen
 *
 * website
 * http://www.fullscreen.nl
 *
 */

#import <UIKit/UIKit.h>
#import "OOOGameModel.h"
#import "cocos2d.h"
#import "OOOTransition.h"
#import "OOORemoteLevelLoader.h"

/*!
 BulletTime is the best game ever.
 
 \warning 
 let op!
 
 \todo 
 fix alles dat mis gaat
*/

@interface oneononeAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	OOOTransition *cutscene;
	OOORemoteLevelLoader *rll;
    BOOL isDrawingLevel;
    int screenWidth;
    int screenHeight;
    
}
///for testing a level
-(void)testLevel;
-(CGSize)getScreenSize;

@property (nonatomic, retain) UIWindow *window;

@end
