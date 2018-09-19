//
//  OOORecordedFrameData.m
//  BulletTime
//
//  Created by Johan ten Broeke on 3/29/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "OOORecordedFrameData.h"


@implementation OOORecordedFrameData

-(id)init{
    self = [super init];
    if(self){
        events = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addEvent:(NSNotification*)evt{
    [events addObject:evt];
}

-(NSArray*)getEvents{
    return events;
}

-(void)log{
    int l = [events count];
    for(int i=0; i<l; i++){
        //NSArray *arr = (NSArray*)[events objectAtIndex:i];
        //NSLog(@"frame events: %@",arr);
    }
}

-(void)dealloc{
    [events release];
    [super dealloc];
}

@end
