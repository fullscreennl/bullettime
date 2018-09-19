//
//  AlienSoundBehaviour.h
//  BulletTime
//
//  Created by Jeroen Goor van on 7/27/11.
//  Copyright 2011 Fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AlienSoundBehaviour : NSObject {
    int trigger;
    NSDictionary *userinfo2;
}
-(id) initWithSound:(NSString*)_sound andModuloTrigger:(int)_trigger;
-(void)excecute:(int)framecounter;
@end
