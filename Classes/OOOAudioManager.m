//
//  OOOAudioManager.m
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 9/16/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import "OOOAudioManager.h"
#import "SimpleAudioEngine.h"
#import "CCActionManager.h"
#import "cocos2d.h"

@implementation OOOAudioManager


static OOOAudioManager *sharedOOOAudioManager_=nil;
static NSDictionary *soundLib;
static SimpleAudioEngine *sae=nil;

+ (OOOAudioManager *)sharedOOOAudioManager
{
	if (!sharedOOOAudioManager_){
		sharedOOOAudioManager_ = [[OOOAudioManager alloc] init];
        [CDSoundEngine setMixerSampleRate:CD_SAMPLE_RATE_MID];
        sae = [SimpleAudioEngine sharedEngine];
		soundLib = [NSDictionary dictionaryWithObjectsAndKeys:
												@"sfx_small_explosion.wav",@"gun_shot",
												@"sfx_hero_jump.wav",@"hero_jump",
												@"sfx_eat_edit.wav",@"hero_eaten",
												@"sfx_menu_button.wav",@"menu_tap",
												@"sfx_intro.wav",@"intro",
												@"sfx_canon_edit.wav",@"canon_shot",
												@"sfx_bullet_time.wav",@"bullet_time",
												@"sfx_click.wav",@"gun_empty",
												@"sfx_cocking.wav",@"gun_reload",
												@"sfx_torching_ball.wav",@"fire_torch",
												@"sfx_long_droning.wav",@"droning_machine",
												@"sfx_warp_sound.wav",@"warp",
                                                @"sfx_droning.wav",@"sfx_droning",
                                                @"sfx_snail_move.wav",@"sfx_snail_move",
												@"sfx_nice_chime.wav",@"happy_chime",
												@"sfx_pickup_bullettime.wav",@"pickup_bullettime",
												@"sfx_hurt_option1_edit.wav",@"hero_hurt",
												@"sfx_explosion_spaceship_edit.wav",@"spaceship_exploded",
                                                @"sfx_explosion_debris2.wav",@"explosion_debris",
												@"sfx_hero_dying1.wav",@"hero_dying1",
                                                @"sfx_hero_dying2.wav",@"hero_dying2",
                                                @"sfx_hero_dying3.wav",@"hero_dying3",
                                                @"sfx_hero_dying4.wav",@"hero_dying4",
                                                @"sfx_hero_dying5.wav",@"hero_dying5",
                                                @"sfx_hero_dying6.wav",@"hero_dying6",
                                                @"sfx_hero_dying7.wav",@"hero_dying7",
                                                @"sfx_alien_dying1.wav",@"alien_dying1",
												@"sfx_alien_dying2.wav",@"alien_dying2",
												@"sfx_alien_dying3.wav",@"alien_dying3",
												@"sfx_alien_dying4.wav",@"alien_dying4",
                                                @"sfx_alien_mumbling.wav",@"alien_mumbling",
                                                @"sfx_alien_sad.wav",@"alien_sad",
                                                @"sfx_alien_happy.wav",@"alien_happy",
                                                @"sfx_alien_angry.wav",@"alien_angry",
                                                @"sfx_alien_dolphin.wav",@"alien_dolphin",
                                                @"sfx_alien_.wav",@"alien_",
												@"sfx_spinningup.wav",@"spinning_up",
												@"sfx_snakehiss.wav",@"snake_hiss",
                                                @"sfx_pumpkin_plop.wav",@"pumpkin_pop",
												@"sfx_gunshot_movie.mp3",@"gunshot_menu",
                                                @"Blib.wav",@"blib",
                                                @"sfx_alien_angry2.wav",@"alien_angry2",
                                                @"sfx_alien_angry3.wav",@"alien_angry3",
                                                @"sfx_alien_angry4.wav",@"alien_angry4",
                                                @"sfx_alien_angry5.wav",@"alien_angry5",
                                                @"sfx_alien_sniffing.wav",@"alien_sniffing",
                                                @"sfx_alien_growl.wav",@"alien_growl",
                                                @"sfx_alien_angry6.wav",@"alien_angry6",
                                                @"sfx_alien_sad1.wav",@"alien_sad1",
                                                @"sfx_alien_sad2.wav",@"alien_sad2",
                                                @"sfx_alien_angry7.wav",@"alien_angry7",
                                                @"sfx_alien_barking.wav",@"alien_barking",
                                                @"sfx_alien_barking2.wav",@"alien_barking2",
                                                @"sfx_alien_cry.wav",@"alien_cry",
                                                @"sfx_alien_cry2.wav",@"alien_cry2",
                                                @"sfx_alien_angrygrowl2.wav",@"alien_angrygrowl2",
                                                @"sfx_alien_hurt.wav",@"alien_hurt",
                                                @"sfx_alien_happy4.wav",@"alien_happy4",
                                                @"sfx_piston_walk_loop.wav",@"piston_walk_loop",
                                                @"sfx_highref_spinning.wav",@"highref_spinning",
                                                @"sfx_diesel_engine.wav",@"diesel_engine",
                                                @"sfx_alien_happy2.wav",@"alien_happy2",
                                                @"sfx_alien_happy3.wav",@"alien_happy3",
                                                @"sfx_alien_roaring.wav",@"alien_roaring",
                                                @"sfx_alien_purring.wav",@"alien_purring",
                                                @"sfx_alien_pig_happy5.wav",@"alien_pig_happy5",
                                                @"sfx_alien_crying.wav",@"alien_crying",
                                                @"sfx_alien_blaet.wav",@"alien_blaet",
                                                @"sfx_alien_pig_happy4.wav",@"alien_pig_happy4",
                                                @"sfx_alien_pig_sad.wav",@"alien_pig_sad",
                                                @"sfx_squeak.wav",@"squeak",
                                                @"sfx_ricochet.wav",@"sfx_ricochet",
                                                @"sfx_ricochet2.wav",@"sfx_ricochet2",
                                                @"sfx_hero_auch.wav",@"sfx_hero_auch",
                                                @"sfx_hero_auch2.wav",@"sfx_hero_auch2",
                                                @"sfx_hero_auch3.wav",@"sfx_hero_auch3",
                                                @"sfx_tankdoor.wav",@"sfx_tankdoor",
                                                @"sfx_absorbed.wav",@"sfx_absorbed",
                                                @"sfx_chopper.wav",@"sfx_chopper",
                                                @"sfx_hippo_auch.wav",@"hippo_auch",
                                                @"sfx_hippo_die.wav",@"hippo_die",
                                                @"sfx_hippo_laugh.wav",@"hippo_laugh",
                                                @"sfx_elephant_angry.wav",@"elephant_auch",
                                                @"sfx_elephant_die.wav",@"elephant_die",
                                                @"sfx_elephant_laugh.wav",@"elephant_laugh",
                                                @"sfx_delishaDialog.mp3",@"sfx_delishaDialog",
                                                @"bullettime_spookyloop.mp3",@"bullettime_spookyloop",
												nil]; 
		[soundLib retain];
		[sae preloadEffect:[soundLib objectForKey:@"gun_shot"]];
		[sae preloadEffect:[soundLib objectForKey:@"hero_jump"]];
		[sae preloadEffect:[soundLib objectForKey:@"pumpkin_pop"]];
		[sae preloadEffect:[soundLib objectForKey:@"menu_tap"]];
		[sae preloadEffect:[soundLib objectForKey:@"intro"]];
		[sae preloadEffect:[soundLib objectForKey:@"canon_shot"]];
	//	[sae preloadEffect:[soundLib objectForKey:@"bullet_time"]];
		[sae preloadEffect:[soundLib objectForKey:@"gun_empty"]];
		[sae preloadEffect:[soundLib objectForKey:@"fire_torch"]];
		[sae preloadEffect:[soundLib objectForKey:@"gun_reload"]];
	//	[sae preloadEffect:[soundLib objectForKey:@"droning_machine"]];
		[sae preloadEffect:[soundLib objectForKey:@"warp"]];
		[sae preloadEffect:[soundLib objectForKey:@"happy_chime"]];
		[sae preloadEffect:[soundLib objectForKey:@"pickup_bullettime"]];
		[sae preloadEffect:[soundLib objectForKey:@"hero_hurt"]];
		//[sae preloadEffect:[soundLib objectForKey:@"spaceship_exploded"]];
        [sae preloadEffect:[soundLib objectForKey:@"hero_dying1"]];
        [sae preloadEffect:[soundLib objectForKey:@"hero_dying2"]];
        [sae preloadEffect:[soundLib objectForKey:@"hero_dying3"]];
        [sae preloadEffect:[soundLib objectForKey:@"hero_dying4"]];
        [sae preloadEffect:[soundLib objectForKey:@"hero_dying5"]];
        [sae preloadEffect:[soundLib objectForKey:@"hero_dying6"]];
        [sae preloadEffect:[soundLib objectForKey:@"hero_dying7"]];
		[sae preloadEffect:[soundLib objectForKey:@"alien_dying1"]];
		[sae preloadEffect:[soundLib objectForKey:@"alien_dying2"]];
		[sae preloadEffect:[soundLib objectForKey:@"alien_dying3"]];
		[sae preloadEffect:[soundLib objectForKey:@"alien_dying4"]];
		[sae preloadEffect:[soundLib objectForKey:@"spinning_up"]];
		[sae preloadEffect:[soundLib objectForKey:@"snake_hiss"]];
		[sae preloadEffect:[soundLib objectForKey:@"gunshot_menu"]];
        [sae preloadEffect:[soundLib objectForKey:@"blib"]];
		
		[[NSNotificationCenter defaultCenter] addObserver:sharedOOOAudioManager_ 
												 selector:@selector(onSoundEffect:) 
													 name:@"onSoundEffect" 
												   object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:sharedOOOAudioManager_ 
												 selector:@selector(onPlayLooped:) 
													 name:@"onPlayLooped" 
												   object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:sharedOOOAudioManager_ 
												 selector:@selector(onStopCurrentLooped:) 
													 name:@"onStopCurrentLooped" 
												   object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:sharedOOOAudioManager_ 
												 selector:@selector(onSoundFXSwitch:) 
													 name:@"onSoundFXSwitch" 
												   object:nil];
	
		[[NSNotificationCenter defaultCenter] addObserver:sharedOOOAudioManager_ 
												 selector:@selector(onLoopedVolume:) 
													 name:@"onLoopedVolume" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:sharedOOOAudioManager_ 
												 selector:@selector(onBackgroundMusicEvent:) 
													 name:@"onBackgroundMusicEvent" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:sharedOOOAudioManager_
                                                 selector:@selector(resumePreviousBGTrack)
                                                     name:@"resumePreviousBGTrack" 
												   object:nil];
       
               /**
        [[NSNotificationCenter defaultCenter] addObserver:sharedOOOAudioManager_ 
                                                 selector:@selector(onEnemyHit:) 
                                                     name:@"onEnemyHit" 
                                                   object:nil];
         */
	}
	
	return sharedOOOAudioManager_;
}


-(void) onEnemyHit:(NSNotification *) note{
    /**
	if (CCRANDOM_0_1() < .3 ){
		[[SimpleAudioEngine sharedEngine] playEffect:@"sfx_enemy_bounce_a.wav"];
	}else if(CCRANDOM_0_1() < .6 ){	
		[[SimpleAudioEngine sharedEngine] playEffect:@"sfx_enemy_bounce_b.wav"];
	}else {
		//[[SimpleAudioEngine sharedEngine] playEffect:@"sfx_hurt_option1_edit.wav"];
	}
    */
}

-(id)init{
	if( (self=[super init])) {

		globalsoundPitch = 1.0;
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onBulletTimeEnded:) 
													 name:@"bulletTimeEnded" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(bulletTime:) 
													 name:@"bulletTime" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onBulletTimeEnded:) 
													 name:@"onLose" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onBulletTimeEnded:) 
													 name:@"onDrawLevel" 
												   object:nil];
	
	}
	return self;
}

-(void)bulletTime:(NSNotification*)note{
	globalsoundPitch = 0.3;
}

-(void)onBulletTimeEnded:(NSNotification*)note{
	globalsoundPitch = 1.0;
}

-(void)onSoundFXSwitch:(NSNotification *)note{
	if([[[note userInfo] objectForKey:@"muted"] intValue] == 1){	
		[sae setMute:YES];
	}else{
		[sae setMute:NO];
	}	
}

-(void) resumePreviousBGTrack
{   
    if([bgLoopCurrentlyPlaying isEqualToString:@"sfx_delishaDialog"]){
        NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:previousBgMusic, @"music", nil];
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"onBackgroundMusicEvent" 
                           object:nil 
                           userInfo:userinfo]];
    }
}

- (void) onBackgroundMusicEvent:(NSNotification *) note {
    NSString *eventName = [[note userInfo] objectForKey:@"music"];
    if([eventName isEqualToString:@"sfx_delishaDialog"] && [bgLoopCurrentlyPlaying isEqualToString:@"chosenone"] ){
        return;
    }
    
    [previousBgMusic release];
    if(bgLoopCurrentlyPlaying){
        previousBgMusic = [[NSString stringWithString:bgLoopCurrentlyPlaying] retain];
    }
  
    if([bgLoopCurrentlyPlaying isEqualToString:eventName]){
        return;
    }
    
	[sae playBackgroundMusic:[NSString stringWithFormat:@"%@.mp3",eventName]];
    
    if([eventName isEqualToString:@"chosenone"] || [eventName isEqualToString:@"end_of_the_world_party"]|| [eventName isEqualToString:@"sfx_delishaDialog"]){
        [sae setBackgroundMusicVolume:1.0f];
    }else{
        [sae setBackgroundMusicVolume:0.1f];
    }
    
    [eventName retain];
    [bgLoopCurrentlyPlaying release];
    bgLoopCurrentlyPlaying = eventName;
}

- (void) StopBackgroundMusic:(NSNotification *) note {
	[sae stopBackgroundMusic];
}


-(void)onPlayLooped:(NSNotification *) note
{
		[[CCActionManager sharedManager] removeAllActionsFromTarget:loopSound];
		NSString *sound = [soundLib objectForKey:[[note userInfo] objectForKey:@"sound"]];
		loopSound = [[sae soundSourceForFile:sound] retain];
		loopSound.looping = YES;
		[loopSound play];
	
}

-(void)onLoopedVolume:(NSNotification *)note
{
	float volume = [[[note userInfo] objectForKey:@"volume"] floatValue];
	if(loopSound && loopSound.isPlaying){
		[loopSound setGain:volume];
	}

}

-(void)onStopCurrentLooped:(NSNotification *) note
{
	if(loopSound && loopSound.isPlaying){
		//NSLog(@"stop loop sound please!!");
		loopSound.looping = NO;
		[loopSound stop];
		[loopSound release];
		loopSound = nil;
	}
	//[self fadeSoundEffect:1.0f finalVolume:0.0f curveType:kIT_Linear shouldStop:YES effect:loopSound];
}



- (void) onSoundEffect:(NSNotification *) note {
	//NSLog(@"sound fx req: %@",[[note userInfo] objectForKey:@"sound"]);
	if([[note userInfo] objectForKey:@"volume"]){
		[sae setEffectsVolume:[[[note userInfo] objectForKey:@"volume"] floatValue]];
	}else{
		[sae setEffectsVolume:1.0];
	}
		
	NSString *soundToPlay = [soundLib objectForKey:[[note userInfo] objectForKey:@"sound"]];
	[sae playEffect:soundToPlay pitch:globalsoundPitch pan:0.5 gain:0.5];
}

-(void)dealloc{
    [soundLib release];
    [super dealloc];
}



@end
