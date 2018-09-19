//
//  EndbossHealthControllerManager.h
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EndbossHealthController, EndbossGenericBodyPart;


@interface EndbossHealthControllerManager : NSObject {
	NSMutableDictionary *controllers;
}
+(EndbossHealthControllerManager *)get;
-(EndbossHealthController *)addBodyToControllerForKey:(EndbossGenericBodyPart*)bp forKey:(NSString*)key withType:(NSString*)controllerType;
-(EndbossHealthController *)getControllerByKey:(NSString *)key;
-(void)removeMe:(NSString *)key;
@end
