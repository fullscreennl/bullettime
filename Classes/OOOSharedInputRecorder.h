//
//  OOOSharedInputRecorder.h
//  BulletTime
//
//  Created by Johan ten Broeke on 3/29/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OOORecordedFrameData;

@interface OOOSharedInputRecorder : NSObject {
    NSMutableArray *recordedFrames;
    BOOL recording;
}
//+ (OOOSharedInputRecorder *)get;
-(void)recordFrame:(OOORecordedFrameData*)framedata;
-(void)log;
-(void)playBackRecordedFrameAtIndex:(int)index;
-(void)saveFile;
-(void)loadFile;
@end
