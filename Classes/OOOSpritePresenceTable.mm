//
//  OOOSpritePresenceTable.m
//  BulletTime
//
//  Created by Johan ten Broeke on 8/1/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "OOOSpritePresenceTable.h"

@implementation OOOSpritePresenceTable

static NSMutableArray *sprite_ids  = nil;

+(void)clear{
    //NSLog(@"clear : %@",sprite_ids);
    if(sprite_ids == nil){
        sprite_ids = [[NSMutableArray alloc] init];
    }else{
        [sprite_ids removeAllObjects];
    }
}

+(void)destroy{
    [sprite_ids release];
}

+(void)add:(NSString*)spr_id{
    //NSLog(@"add : %@",sprite_ids);
    [sprite_ids addObject:spr_id];
}

+(BOOL)hasID:(NSString*)spr_id{
    //NSLog(@"retrieve id : %@",sprite_ids);
    if ([sprite_ids indexOfObject:spr_id] != NSNotFound) {
        return YES;
    }
    return NO;
}

@end
