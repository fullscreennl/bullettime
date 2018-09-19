//
//  OOOAudioManager.h
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 9/16/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleAudioEngine.h"

@interface OOOAudioManager : NSObject {
	float globalsoundPitch;
    NSString *previousBgMusic;
	CDSoundSource* loopSound;
    NSString *bgLoopCurrentlyPlaying;
	
}
+ (OOOAudioManager *)sharedOOOAudioManager;
-(void) resumePreviousBGTrack;
@end
