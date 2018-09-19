//
//  OOORecordedFrameData.h
//  BulletTime
//
//  Created by Johan ten Broeke on 3/29/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OOORecordedFrameData : NSObject {
    NSMutableArray *events;
}
-(void)addEvent:(NSNotification*)evt;
-(void)log;
-(NSArray*)getEvents;
@end
