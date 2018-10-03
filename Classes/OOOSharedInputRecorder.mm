//
//  OOOSharedInputRecorder.mm
//  BulletTime
//
//  Created by Johan ten Broeke on 3/29/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "OOOSharedInputRecorder.h"
#import "OOORecordedFrameData.h"


@implementation OOOSharedInputRecorder

/**
static OOOSharedInputRecorder *OOOSharedInputRecorder_ = nil;

+ (OOOSharedInputRecorder *)get
{
	if (!OOOSharedInputRecorder_)
		OOOSharedInputRecorder_ = [[OOOSharedInputRecorder alloc] init];
	
	return OOOSharedInputRecorder_;
}
*/

-(id)init{
    self = [super init];
    if(self){
        recordedFrames = [[NSMutableArray alloc] init];
        recording = YES;
    }
    return self;
}

-(void)recordFrame:(OOORecordedFrameData*)framedata{
    if (recording) {
        [recordedFrames addObject:[framedata getEvents]];
    }
}

-(void)loadFile{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirFolder = [paths objectAtIndex:0];
    
    NSString *foldername = [docDirFolder stringByAppendingString:@"/recordings"];
    NSString *filename = @"recorded_data";
    
	NSString *filePath = [NSString stringWithFormat:@"%@/%@.plist",foldername,filename];
    
    recordedFrames = [[NSKeyedUnarchiver unarchiveObjectWithFile:filePath] retain];
}

-(void)saveFile{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirFolder = [paths objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *foldername = [docDirFolder stringByAppendingString:@"/recordings"];
    NSString *filename = @"recorded_data";

	if ( ![fileManager fileExistsAtPath:foldername] ) 
	{
		[fileManager createDirectoryAtPath:foldername withIntermediateDirectories: YES attributes:nil error: NULL];
	}
	NSString *filePath = [NSString stringWithFormat:@"%@/%@.plist",foldername,filename];
	
	if ([fileManager fileExistsAtPath:filePath]) 
	{
		//NSLog(@"<<< fileExistsAtPath >>>");
		[fileManager removeItemAtPath:filePath error:nil];
	}
	
	BOOL success = [NSKeyedArchiver archiveRootObject:(id)recordedFrames toFile:(NSString *)filePath];

	if (!success) {
		NSLog(@"FAILED ! save testdata at: %@",filePath);
	}else{
        NSLog(@"SUCCESS ! save testdata at: %@",filePath);

    }
    
    //[self log];

}

-(void)playBackRecordedFrameAtIndex:(int)index{
    if([recordedFrames count] <= (uint)index ){
        return;
    }
    NSArray *events = (NSArray*)[recordedFrames objectAtIndex:index];
    NSUInteger l = [events count];
    for(int i=0; i<l; i++){
        NSNotification *note = (NSNotification*)[events objectAtIndex:i];
        [[NSNotificationCenter defaultCenter] postNotification:note];
    }
}

-(void)log{
    NSUInteger l = [recordedFrames count];
    for(int i=0; i<l; i++){
        //NSArray *frame = (NSArray*)[recordedFrames objectAtIndex:i];
        //NSLog(@"recordedframe id: %@",frame);
    }
}

-(void)dealloc{
    [recordedFrames release];
    [super dealloc];
}

@end
