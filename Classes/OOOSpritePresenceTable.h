//
//  OOOSpritePresenceTable.h
//  BulletTime
//
//  Created by Johan ten Broeke on 8/1/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OOOSpritePresenceTable : NSObject {
    
}
+(void)clear;
+(void)add:(NSString*)spr_id;
+(BOOL)hasID:(NSString*)spr_id;
@end
