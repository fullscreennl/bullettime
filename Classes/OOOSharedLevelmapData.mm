//
//  OOOSharedLevelmapData.m
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/8/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOSharedLevelmapData.h"
#import "OOOConfig.h"
#import "OOOSharedResourceManager.h"
#import "OOOStore.h"

@implementation OOOSharedLevelmapData

static OOOSharedLevelmapData *OOOSharedLevelmapData_=nil;

+ (OOOSharedLevelmapData *)get
{
	if (!OOOSharedLevelmapData_)
		OOOSharedLevelmapData_ = [[OOOSharedLevelmapData alloc] init];
	
	return OOOSharedLevelmapData_;
}

-(id)init{
	if( (self=[super init])) {
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(save:) 
													 name:@"saveGameData" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(commitScore:) 
													 name:@"commitScore" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLevelSkipped:) 
													 name:@"onNextScene"
												   object:nil];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(onUpgradeSuccess:) 
                                                     name:@"upgradeSuccess" 
                                                   object:nil];
		
		level_dict = [[NSMutableDictionary alloc] initWithCapacity:50];
        
        
        NSArray *episode_0_BGFormat = [NSArray arrayWithObjects:@"ep1",@"backgr_night",@"128.0",@"YES",@"soundscape_1",nil];      //donker urban
        NSArray *episode_1_BGFormat = [NSArray arrayWithObjects:@"ep3",@"backgr_ep3",@"128.0",@"YES",@"soundscape_1",nil];                  //sunst urban
        NSArray *episode_2_BGFormat = [NSArray arrayWithObjects:@"ep10",@"backgr_ep10",@"128.0",@"YES",@"forest_with_birds",nil];           //rural sunset
        NSArray *episode_3_BGFormat = [NSArray arrayWithObjects:@"ep2",@"backgr_ep2",@"400.0",@"YES",@"desert_background_edit",nil];               //daylight desert
        NSArray *episode_4_BGFormat = [NSArray arrayWithObjects:@"ep8",@"backgr_ep8",@"150.0",@"YES",@"industrial_bullet_time",nil];                  //industrial grey
        NSArray *episode_5_BGFormat = [NSArray arrayWithObjects:@"ep1",@"backgr_ep8",@"128.0",@"YES",@"soundscape_1",nil];                  //schemer urban
        NSArray *episode_6_BGFormat = [NSArray arrayWithObjects:@"ep6",@"backgr_ep6",@"300.0",@"YES",@"concretejungle_mixdown",nil];           //concrete jungle
        NSArray *episode_7_BGFormat = [NSArray arrayWithObjects:@"ep9",@"backgr_ep9",@"128.0",@"NO",@"woods_bullet_time",nil];                    //woods spooky
        NSArray *episode_8_BGFormat = [NSArray arrayWithObjects:@"ep7",@"backgr_ep7",@"800.0",@"YES",@"north_pole_wind",nil];               //polar daylight
        NSArray *episode_9_BGFormat = [NSArray arrayWithObjects:@"ep8",@"backgr_ep3",@"500.0",@"YES",@"industrial_bullet_time",nil];                  //industrial sunset
        NSArray *mf = [[NSArray arrayWithObjects:@"ep11",@"backgr_ep11",@"400.0",@"MENU",@"bullettime_spookyloop",nil] retain]; 
        
        
        menuBGFormat = mf;
        defaultBGFormat = episode_0_BGFormat;

		//////////////////////
		// episode:  0
		//////////////////////
		// level:  0 _ 0
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_0_0_0",@"Level 1#BulletTime#Jump to enter the level!",@"visual.png",[NSNumber numberWithInteger:82],episode_0_BGFormat,nil] forKey:@"0"];
		// level:  0 _ 1
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_0_1_0",@"level 2#BulletTime#Jump to enter the level!",@"visual.png",[NSNumber numberWithInteger:67],episode_0_BGFormat,nil] forKey:@"1"];
		// level:  0 _ 2
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_0_2_0",@"level 3#BulletTime#Battle of suburbia",@"visual.png",[NSNumber numberWithInteger:94],episode_0_BGFormat,nil] forKey:@"2"];
		// level:  0 _ 3
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_0_3_0",@"level 4#BulletTime#Battle of suburbia",@"visual.png",[NSNumber numberWithInteger:150],episode_0_BGFormat,nil] forKey:@"3"];
		// level:  0 _ 4
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_0_4_0",@"level 5#BulletTime#Battle of suburbia",@"visual.png",[NSNumber numberWithInteger:71],episode_0_BGFormat,nil] forKey:@"4"];
		// level:  0 _ 5
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_0_5_0",@"level 6#BulletTime#Battle of suburbia",@"visual.png",[NSNumber numberWithInteger:46],episode_0_BGFormat,nil] forKey:@"5"];
		// level:  0 _ 6
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_0_6_0",@"level 7#BulletTime#Battle of suburbia",@"visual.png",[NSNumber numberWithInteger:75],episode_0_BGFormat,nil] forKey:@"6"];
		// level:  0 _ 7
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_0_7_0",@"level 8#BulletTime#Battle of suburbia",@"visual.png",[NSNumber numberWithInteger:75],episode_0_BGFormat,nil] forKey:@"7"];
		// level:  0 _ 8
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_0_8_0",@"level 9#BulletTime#Battle of suburbia",@"visual.png",[NSNumber numberWithInteger:106],episode_0_BGFormat,nil] forKey:@"8"];
		// level:  0 _ 9
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_0_9_0",@"level 10#BulletTime#Battle of suburbia",@"visual.png",[NSNumber numberWithInteger:106],episode_0_BGFormat,nil] forKey:@"9"];
		//////////////////////
		// episode:  1
		//////////////////////
		// level:  1 _ 0
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_1_0_0",@"level 11#BulletTime#Suburban dusk",@"visual.png",[NSNumber numberWithInteger:96],episode_1_BGFormat,nil] forKey:@"10"];
		// level:  1 _ 1
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_1_1_0",@"level 12#BulletTime#Suburban dusk",@"visual.png",[NSNumber numberWithInteger:86],episode_1_BGFormat,nil] forKey:@"11"];
		// level:  1 _ 2
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_1_2_0",@"level 13#BulletTime#Suburban dusk",@"visual.png",[NSNumber numberWithInteger:95],episode_1_BGFormat,nil] forKey:@"12"];
		// level:  1 _ 3
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_1_3_0",@"level 14#BulletTime#Suburban dusk",@"visual.png",[NSNumber numberWithInteger:70],episode_1_BGFormat,nil] forKey:@"13"];
		// level:  1 _ 4
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_1_4_0",@"level 15#BulletTime#Suburban dusk",@"visual.png",[NSNumber numberWithInteger:87],episode_1_BGFormat,nil] forKey:@"14"];
		// level:  1 _ 5
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_1_5_0",@"level 16#BulletTime#Suburban dusk",@"visual.png",[NSNumber numberWithInteger:126],episode_1_BGFormat,nil] forKey:@"15"];
		// level:  1 _ 6
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_1_6_0",@"level 17#BulletTime#Suburban dusk",@"visual.png",[NSNumber numberWithInteger:62],episode_1_BGFormat,nil] forKey:@"16"];
		// level:  1 _ 7
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_1_7_0",@"level 18#BulletTime#Suburban dusk",@"visual.png",[NSNumber numberWithInteger:191],episode_1_BGFormat,nil] forKey:@"17"];
		// level:  1 _ 8
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_1_8_0",@"level 19#BulletTime#Suburban dusk",@"visual.png",[NSNumber numberWithInteger:83],episode_1_BGFormat,nil] forKey:@"18"];
		// level:  1 _ 9
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_1_9_0",@"level 20#BulletTime#Suburban dusk",@"visual.png",[NSNumber numberWithInteger:120],episode_1_BGFormat,nil] forKey:@"19"];
		//////////////////////
		// episode:  2
		//////////////////////
		// level:  2 _ 0
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_2_0_0",@"level 21#BulletTime#New Ruralism Examined",@"visual.png",[NSNumber numberWithInteger:126],episode_2_BGFormat,nil] forKey:@"20"];
		// level:  2 _ 1
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_2_1_0",@"level 22#BulletTime#New Ruralism Examined",@"visual.png",[NSNumber numberWithInteger:88],episode_2_BGFormat,nil] forKey:@"21"];
		// level:  2 _ 2
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_2_2_0",@"level 23#BulletTime#New Ruralism Examined",@"visual.png",[NSNumber numberWithInteger:119],episode_2_BGFormat,nil] forKey:@"22"];
		// level:  2 _ 3
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_2_3_0",@"level 24#BulletTime#New Ruralism Examined",@"visual.png",[NSNumber numberWithInteger:83],episode_2_BGFormat,nil] forKey:@"23"];
		// level:  2 _ 4
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_2_4_0",@"level 25#BulletTime#New Ruralism Examined",@"visual.png",[NSNumber numberWithInteger:62],episode_2_BGFormat,nil] forKey:@"24"];
		// level:  2 _ 5
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_2_5_0",@"level 26#BulletTime#New Ruralism Examined",@"visual.png",[NSNumber numberWithInteger:96],episode_2_BGFormat,nil] forKey:@"25"];
		// level:  2 _ 6
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_2_6_0",@"level 27#BulletTime#New Ruralism Examined",@"visual.png",[NSNumber numberWithInteger:69],episode_2_BGFormat,nil] forKey:@"26"];
		// level:  2 _ 7
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_2_7_0",@"level 28#BulletTime#New Ruralism Examined",@"visual.png",[NSNumber numberWithInteger:109],episode_2_BGFormat,nil] forKey:@"27"];
		// level:  2 _ 8
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_2_8_0",@"level 29#BulletTime#New Ruralism Examined",@"visual.png",[NSNumber numberWithInteger:104],episode_2_BGFormat,nil] forKey:@"28"];
		// level:  2 _ 9
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_2_9_0",@"level 30#BulletTime#New Ruralism Examined",@"visual.png",[NSNumber numberWithInteger:77],episode_2_BGFormat,nil] forKey:@"29"];
		//////////////////////
		// episode:  3
		//////////////////////
		// level:  3 _ 0
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_3_0_0",@"level 31#BulletTime#A deserted place?",@"visual.png",[NSNumber numberWithInteger:420],episode_3_BGFormat,nil] forKey:@"30"];
		// level:  3 _ 1
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_3_1_0",@"level 32#BulletTime#A deserted place?",@"visual.png",[NSNumber numberWithInteger:133],episode_3_BGFormat,nil] forKey:@"31"];
		// level:  3 _ 2
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_3_2_0",@"level 33#BulletTime#A deserted place?",@"visual.png",[NSNumber numberWithInteger:134],episode_3_BGFormat,nil] forKey:@"32"];
		// level:  3 _ 3
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_3_3_0",@"level 34#BulletTime#A deserted place?",@"visual.png",[NSNumber numberWithInteger:317],episode_3_BGFormat,nil] forKey:@"33"];
		// level:  3 _ 4
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_3_4_0",@"level 35#BulletTime#A deserted place?",@"visual.png",[NSNumber numberWithInteger:193],episode_3_BGFormat,nil] forKey:@"34"];
		// level:  3 _ 5
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_3_5_0",@"level 36#BulletTime#A deserted place?",@"visual.png",[NSNumber numberWithInteger:322],episode_3_BGFormat,nil] forKey:@"35"];
		// level:  3 _ 6
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_3_6_0",@"level 37#BulletTime#A deserted place?",@"visual.png",[NSNumber numberWithInteger:221],episode_3_BGFormat,nil] forKey:@"36"];
		// level:  3 _ 7
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_3_7_0",@"level 38#BulletTime#A deserted place?",@"visual.png",[NSNumber numberWithInteger:77],episode_3_BGFormat,nil] forKey:@"37"];
		// level:  3 _ 8
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_3_8_0",@"level 39#BulletTime#A deserted place?",@"visual.png",[NSNumber numberWithInteger:249],episode_3_BGFormat,nil] forKey:@"38"];
		// level:  3 _ 9
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_3_9_0",@"level 40#BulletTime#A deserted place?",@"visual.png",[NSNumber numberWithInteger:106],episode_3_BGFormat,nil] forKey:@"39"];
		//////////////////////
		// episode:  4
		//////////////////////
		// level:  4 _ 0
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_4_0_0",@"level 41#BulletTime#Showdown at the wastelands",@"visual.png",[NSNumber numberWithInteger:76],episode_4_BGFormat,nil] forKey:@"40"];
		// level:  4 _ 1
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_4_1_0",@"level 42#BulletTime#Showdown at the wastelands",@"visual.png",[NSNumber numberWithInteger:91],episode_4_BGFormat,nil] forKey:@"41"];
		// level:  4 _ 2
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_4_2_0",@"level 43#BulletTime#Showdown at the wastelands",@"visual.png",[NSNumber numberWithInteger:65],episode_4_BGFormat,nil] forKey:@"42"];
		// level:  4 _ 3
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_4_3_0",@"level 44#BulletTime#Showdown at the wastelands",@"visual.png",[NSNumber numberWithInteger:123],episode_4_BGFormat,nil] forKey:@"43"];
		// level:  4 _ 4
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_4_4_0",@"level 45#BulletTime#Showdown at the wastelands",@"visual.png",[NSNumber numberWithInteger:116],episode_4_BGFormat,nil] forKey:@"44"];
		// level:  4 _ 5
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_4_5_0",@"level 46#BulletTime#Showdown at the wastelands",@"visual.png",[NSNumber numberWithInteger:132],episode_4_BGFormat,nil] forKey:@"45"];
		// level:  4 _ 6
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_4_6_0",@"level 47#BulletTime#Showdown at the wastelands",@"visual.png",[NSNumber numberWithInteger:104],episode_4_BGFormat,nil] forKey:@"46"];
		// level:  4 _ 7
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_4_7_0",@"level 48#BulletTime#Showdown at the wastelands",@"visual.png",[NSNumber numberWithInteger:86],episode_4_BGFormat,nil] forKey:@"47"];
		// level:  4 _ 8
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_4_8_0",@"level 49#BulletTime#Showdown at the wastelands",@"visual.png",[NSNumber numberWithInteger:78],episode_4_BGFormat,nil] forKey:@"48"];
		// level:  4 _ 9
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_4_9_0",@"level 50#BulletTime#Showdown at the wastelands",@"visual.png",[NSNumber numberWithInteger:53],episode_4_BGFormat,nil] forKey:@"49"];
		//////////////////////
		// episode:  5
		//////////////////////
		// level:  5 _ 0
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_5_0_0",@"level 51#BulletTime#hitting the shimmer",@"visual.png",[NSNumber numberWithInteger:94],episode_5_BGFormat,nil] forKey:@"50"];
		// level:  5 _ 1
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_5_1_0",@"level 52#BulletTime#hitting the shimmer",@"visual.png",[NSNumber numberWithInteger:102],episode_5_BGFormat,nil] forKey:@"51"];
		// level:  5 _ 2
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_5_2_0",@"level 53#BulletTime#hitting the shimmer",@"visual.png",[NSNumber numberWithInteger:146],episode_5_BGFormat,nil] forKey:@"52"];
		// level:  5 _ 3
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_5_3_0",@"level 54#BulletTime#hitting the shimmer",@"visual.png",[NSNumber numberWithInteger:122],episode_5_BGFormat,nil] forKey:@"53"];
		// level:  5 _ 4
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_5_4_0",@"level 55#BulletTime#hitting the shimmer",@"visual.png",[NSNumber numberWithInteger:163],episode_5_BGFormat,nil] forKey:@"54"];
		// level:  5 _ 5
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_5_5_0",@"level 56#BulletTime#hitting the shimmer",@"visual.png",[NSNumber numberWithInteger:100],episode_5_BGFormat,nil] forKey:@"55"];
		// level:  5 _ 6
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_5_6_0",@"level 57#BulletTime#hitting the shimmer",@"visual.png",[NSNumber numberWithInteger:73],episode_5_BGFormat,nil] forKey:@"56"];
		// level:  5 _ 7
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_5_7_0",@"level 58#BulletTime#hitting the shimmer",@"visual.png",[NSNumber numberWithInteger:110],episode_5_BGFormat,nil] forKey:@"57"];
		// level:  5 _ 8
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_5_8_0",@"level 59#BulletTime#hitting the shimmer",@"visual.png",[NSNumber numberWithInteger:102],episode_5_BGFormat,nil] forKey:@"58"];
		// level:  5 _ 9
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_5_9_0",@"level 60#BulletTime#hitting the shimmer",@"visual.png",[NSNumber numberWithInteger:137],episode_5_BGFormat,nil] forKey:@"59"];
		//////////////////////
		// episode:  6
		//////////////////////
		// level:  6 _ 0
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_6_0_0",@"level 61#BulletTime#Concrete jungle Chachacha",@"visual.png",[NSNumber numberWithInteger:113],episode_6_BGFormat,nil] forKey:@"60"];
		// level:  6 _ 1
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_6_1_0",@"level 62#BulletTime#Concrete jungle Chachacha",@"visual.png",[NSNumber numberWithInteger:107],episode_6_BGFormat,nil] forKey:@"61"];
		// level:  6 _ 2
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_6_2_0",@"level 63#BulletTime#Concrete jungle Chachacha",@"visual.png",[NSNumber numberWithInteger:110],episode_6_BGFormat,nil] forKey:@"62"];
		// level:  6 _ 3
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_6_3_0",@"level 64#BulletTime#Concrete jungle Chachacha",@"visual.png",[NSNumber numberWithInteger:97],episode_6_BGFormat,nil] forKey:@"63"];
		// level:  6 _ 4
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_6_4_0",@"level 65#BulletTime#Concrete jungle Chachacha",@"visual.png",[NSNumber numberWithInteger:52],episode_6_BGFormat,nil] forKey:@"64"];
		// level:  6 _ 5
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_6_5_0",@"level 66#BulletTime#Concrete jungle Chachacha",@"visual.png",[NSNumber numberWithInteger:193],episode_6_BGFormat,nil] forKey:@"65"];
		// level:  6 _ 6
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_6_6_0",@"level 67#BulletTime#Concrete jungle Chachacha",@"visual.png",[NSNumber numberWithInteger:160],episode_6_BGFormat,nil] forKey:@"66"];
		// level:  6 _ 7
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_6_7_0",@"level 68#BulletTime#Concrete jungle Chachacha",@"visual.png",[NSNumber numberWithInteger:172],episode_6_BGFormat,nil] forKey:@"67"];
		// level:  6 _ 8
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_6_8_0",@"level 69#BulletTime#Concrete jungle Chachacha",@"visual.png",[NSNumber numberWithInteger:82],episode_6_BGFormat,nil] forKey:@"68"];
		// level:  6 _ 9
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_6_9_0",@"level 70#BulletTime#Concrete jungle Chachacha",@"visual.png",[NSNumber numberWithInteger:56],episode_6_BGFormat,nil] forKey:@"69"];
		//////////////////////
		// episode:  7
		//////////////////////
		// level:  7 _ 0
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_7_0_0",@"level 71#BulletTime#A message to the woods",@"visual.png",[NSNumber numberWithInteger:244],episode_7_BGFormat,nil] forKey:@"70"];
		// level:  7 _ 1
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_7_1_0",@"level 72#BulletTime#A message to the woods",@"visual.png",[NSNumber numberWithInteger:75],episode_7_BGFormat,nil] forKey:@"71"];
		// level:  7 _ 2
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_7_2_0",@"level 73#BulletTime#A message to the woods",@"visual.png",[NSNumber numberWithInteger:198],episode_7_BGFormat,nil] forKey:@"72"];
		// level:  7 _ 3
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_7_3_0",@"level 74#BulletTime#A message to the woods",@"visual.png",[NSNumber numberWithInteger:118],episode_7_BGFormat,nil] forKey:@"73"];
		// level:  7 _ 4
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_7_4_0",@"level 75#BulletTime#A message to the woods",@"visual.png",[NSNumber numberWithInteger:95],episode_7_BGFormat,nil] forKey:@"74"];
		// level:  7 _ 5
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_7_5_0",@"level 76#BulletTime#A message to the woods",@"visual.png",[NSNumber numberWithInteger:102],episode_7_BGFormat,nil] forKey:@"75"];
		// level:  7 _ 6
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_7_6_0",@"level 77#BulletTime#A message to the woods",@"visual.png",[NSNumber numberWithInteger:134],episode_7_BGFormat,nil] forKey:@"76"];
		// level:  7 _ 7
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_7_7_0",@"level 78#BulletTime#A message to the woods",@"visual.png",[NSNumber numberWithInteger:156],episode_7_BGFormat,nil] forKey:@"77"];
		// level:  7 _ 8
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_7_8_0",@"level 79#BulletTime#A message to the woods",@"visual.png",[NSNumber numberWithInteger:88],episode_7_BGFormat,nil] forKey:@"78"];
		// level:  7 _ 9
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_7_9_0",@"level 80#BulletTime#A message to the woods",@"visual.png",[NSNumber numberWithInteger:182],episode_7_BGFormat,nil] forKey:@"79"];
		//////////////////////
		// episode:  8
		//////////////////////
		// level:  8 _ 0
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_8_0_0",@"level 81#BulletTime#Polar warfare",@"visual.png",[NSNumber numberWithInteger:81],episode_8_BGFormat,nil] forKey:@"80"];
		// level:  8 _ 1
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_8_1_0",@"level 82#BulletTime#Polar warfare",@"visual.png",[NSNumber numberWithInteger:97],episode_8_BGFormat,nil] forKey:@"81"];
		// level:  8 _ 2
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_8_2_0",@"level 83#BulletTime#Polar warfare",@"visual.png",[NSNumber numberWithInteger:49],episode_8_BGFormat,nil] forKey:@"82"];
		// level:  8 _ 3
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_8_3_0",@"level 84#BulletTime#Polar warfare",@"visual.png",[NSNumber numberWithInteger:150],episode_8_BGFormat,nil] forKey:@"83"];
		// level:  8 _ 4
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_8_4_0",@"level 85#BulletTime#Polar warfare",@"visual.png",[NSNumber numberWithInteger:260],episode_8_BGFormat,nil] forKey:@"84"];
		// level:  8 _ 5
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_8_5_0",@"level 86#BulletTime#Polar warfare",@"visual.png",[NSNumber numberWithInteger:72],episode_8_BGFormat,nil] forKey:@"85"];
		// level:  8 _ 6
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_8_6_0",@"level 87#BulletTime#Polar warfare",@"visual.png",[NSNumber numberWithInteger:297],episode_8_BGFormat,nil] forKey:@"86"];
		// level:  8 _ 7
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_8_7_0",@"level 88#BulletTime#Polar warfare",@"visual.png",[NSNumber numberWithInteger:56],episode_8_BGFormat,nil] forKey:@"87"];
		// level:  8 _ 8
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_8_8_0",@"level 89#BulletTime#Polar warfare",@"visual.png",[NSNumber numberWithInteger:88],episode_8_BGFormat,nil] forKey:@"88"];
		// level:  8 _ 9
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_8_9_0",@"level 90#BulletTime#Polar warfare",@"visual.png",[NSNumber numberWithInteger:193],episode_8_BGFormat,nil] forKey:@"89"];
		//////////////////////
		// episode:  9
		//////////////////////
		// level:  9 _ 0
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_9_0_0",@"level 91#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:168],episode_9_BGFormat,nil] forKey:@"90"];
		// level:  9 _ 1
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_9_1_0",@"level 92#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:129],episode_9_BGFormat,nil] forKey:@"91"];
		// level:  9 _ 2
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_9_2_0",@"level 93#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:93],episode_9_BGFormat,nil] forKey:@"92"];
		// level:  9 _ 3
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_9_3_0",@"level 94#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:210],episode_9_BGFormat,nil] forKey:@"93"];
		// level:  9 _ 4
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_9_4_0",@"level 95#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:192],episode_9_BGFormat,nil] forKey:@"94"];
		// level:  9 _ 5
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_9_5_0",@"level 96#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:70],episode_9_BGFormat,nil] forKey:@"95"];
		// level:  9 _ 6
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_9_6_0",@"level 97#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:197],episode_9_BGFormat,nil] forKey:@"96"];
		// level:  9 _ 7
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_9_7_0",@"level 98#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:195],episode_9_BGFormat,nil] forKey:@"97"];
		// level:  9 _ 8
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_9_8_0",@"level 99#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:222],mf,nil] forKey:@"98"];
		// level:  9 _ 9
		[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/level_9_9_0",@"Party!#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:200],mf,nil] forKey:@"99"];		
        
        datafile_name = @"game_progress";
		
		startTime = [[NSDate alloc] init];
		
		currentLevelIndex = @"0";
		[currentLevelIndex retain];
		
		levelProgress = [[NSNumber numberWithInt:SIMULATE_PROGRESS] stringValue];
		[levelProgress retain];
		
		tutorialsdone = 0;
        numEscapes = 0;
		[self loadData];
        
        achievementManager = [[OOOAchievementManager alloc] init];
        [achievementManager authenticateLocalPlayer];
        
        [self setPendingAchivements];
        NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"bullettime_spookyloop", @"music", nil];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onBackgroundMusicEvent" 
						   object:nil 
						   userInfo:userinfo2]];
		/*
		NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithFloat:0.2f], @"volume", nil];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onLoopedVolume" 
						   object:nil 
						   userInfo:userinfo]];
         */
        
        
	}
	return self;
}

-(void)onUpgradeSuccess:(NSNotification*)note
{
    _hasUpgraded = YES;
}

-(BOOL)hasUpgraded
{
    if(_hasUpgraded){
        return _hasUpgraded;
    }else{
        OOOStore *store = [[OOOStore alloc] init];
        _hasUpgraded = [store hasUpgraded];
        NSLog(@"hasUpgraded");
        [store release];
        return _hasUpgraded;
    }
}

-(NSArray *)defaultBG{
	return defaultBGFormat;
}

-(void)unlockNextLevel{
	int nid = [currentLevelIndex intValue] + 1;
    if (nid > 0) {
        tutorialsdone = YES;
    }
	nextLevelIndex = [[NSNumber numberWithInt:nid] stringValue];
	if (![gameprogress objectForKey:nextLevelIndex]) {
		[gameprogress setObject:[NSNumber numberWithInt:INITSCORE] forKey:nextLevelIndex];
		[levelProgress release];
		levelProgress = [nextLevelIndex copy];
	}
}

-(NSString *)levelProgresInd{
	return levelProgress;
}

-(NSString*)currentLevelInd{
	return currentLevelIndex;
}

-(void)goMenu{
	currentlyInMenu = YES;
}

-(BOOL)isCurrentlyInMenu{
    return currentlyInMenu;
}

-(void)commitScore:(NSNotification*)note{
    
    int score = [[OOOSharedResourceManager get] scoreForLevel];
   
    [[OOOSharedResourceManager get] resetScore];
    
    NSLog(@"new score : %i",score);
    NSLog(@"prev score : %i",[[gameprogress objectForKey:currentLevelIndex] intValue]);
    
    if([[gameprogress objectForKey:currentLevelIndex] intValue] > score){
        NSLog(@"new high score");
        [gameprogress setObject:[NSNumber numberWithInt:score] forKey:currentLevelIndex];
    }

	[self unlockNextLevel];
	currentlyInMenu = YES;
}

-(NSNumber*)levelScoreForIndex:(NSString *)str{
	return [gameprogress objectForKey:str];
}

-(int)levelStarsForIndex:(NSString *)str{
    int par = [[[level_dict objectForKey:str]objectAtIndex:3] intValue];
    int score = [[gameprogress objectForKey:str] intValue];
    
    if(score == INITSCORE){
        return 0;
    }
    
	if(score < par){
        return 3;
    }else if(score < par+5){
        return 2;
    }else{
        return 1;
    }
}

-(NSString*)currentLevelEntryPoint{
	//return [[level_dict objectForKey:currentLevelIndex] objectAtIndex:0];
	return curLevelEntryPoint;
}

-(void)setCurrentLevelEntryPoint:(NSString*)curLevelId {
	[curLevelId retain];
	[curLevelEntryPoint release];
	curLevelEntryPoint = curLevelId;
    [[OOOSharedResourceManager get] startTime];
}

-(NSArray*)currentLevelBG{
    if(![self tutorialsDone]){
        return defaultBGFormat;
    }
    
    if([curLevelEntryPoint isEqualToString:@"leveldata/level_9_9_0"] || [curLevelEntryPoint isEqualToString:@"leveldata/level_9_9_1"]){
        return [NSArray arrayWithObjects:@"ep13",@"backgr_ep13",@"200.0",@"NO",@"chosenone",nil];
    }
    
    if([curLevelEntryPoint isEqualToString:@"leveldata/level_9_9_2"]){
        return [NSArray arrayWithObjects:@"ep12",@"backgr_ep12",@"500.0",@"PARTY",@"end_of_the_world_party",nil];             
    }
    
	if(currentlyInMenu){
		
        NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"bullettime_spookyloop", @"music", nil];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onBackgroundMusicEvent" 
						   object:nil 
						   userInfo:userinfo2]];
        return menuBGFormat;

	}else{
        return [[level_dict objectForKey:currentLevelIndex] objectAtIndex:4];
	}
}

-(NSString *)setLevelIDForIndex:(NSString*)ind{
	
	currentlyInMenu = NO;
	[startTime release];
	startTime = [[NSDate alloc] init];
	
	[ind retain];
	[currentLevelIndex release];
	currentLevelIndex = ind;
	
	return [[level_dict objectForKey:currentLevelIndex] objectAtIndex:0];
	
}

-(NSArray *)levelDataForIndex:(NSString*)ind{
	return [level_dict objectForKey:ind];
}

-(void)loadData{
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *file = [documentsDirectory stringByAppendingPathComponent:[datafile_name stringByAppendingString:@".plist"]];
	
	gameprogress = [[NSMutableDictionary dictionaryWithContentsOfFile:file] retain];
	//NSLog(@"loading gameprogress %@",gameprogress);
	
	if(gameprogress == nil){
		gameprogress = [[NSMutableDictionary alloc] initWithCapacity:100];
		int i = 0;
        // simulate
		for (i = 0; i < SIMULATE_PROGRESS; i++) {
            //NSLog(@"simulate progress");
			[gameprogress setObject:[NSNumber numberWithInt:INITSCORE-10] forKey:[[NSNumber numberWithInt:i] stringValue]];
		}
        // don't simulate enter first scene of first level
        if(SIMULATE_PROGRESS == 0){
            [gameprogress setObject:[NSNumber numberWithInt:INITSCORE] forKey:[[NSNumber numberWithInt:i] stringValue]];
            currentLevelIndex = @"0";
        }else{
            [gameprogress setObject:[NSNumber numberWithInt:INITSCORE] forKey:[[NSNumber numberWithInt:i] stringValue]];
            currentLevelIndex = [[NSNumber numberWithInt:i] stringValue];
        }
        [currentLevelIndex retain];
        
        achievements = [[NSMutableDictionary alloc] init];
        [achievements setObject:[NSNumber numberWithInt:0] forKey:@"bt_01"];
        [achievements setObject:[NSNumber numberWithInt:0] forKey:@"bt_02"];
        [achievements setObject:[NSNumber numberWithInt:0] forKey:@"bt_03"];
        [achievements setObject:[NSNumber numberWithInt:0] forKey:@"bt_04"];
        [achievements setObject:[NSNumber numberWithInt:0] forKey:@"bt_05"];
        [achievements setObject:[NSNumber numberWithInt:0] forKey:@"bt_06"];
        [achievements setObject:[NSNumber numberWithInt:0] forKey:@"bt_07"];
        [achievements setObject:[NSNumber numberWithInt:0] forKey:@"bt_08"];
        [achievements setObject:[NSNumber numberWithInt:0] forKey:@"bt_09"];
        [achievements setObject:[NSNumber numberWithInt:0] forKey:@"bt_10"];
        [gameprogress setObject:achievements forKey:@"achievements"];
        
        [gameprogress setObject:[NSNumber numberWithInt:numEscapes] forKey:@"escapes"];
  
	}else {
        
		NSString *gp = [[gameprogress objectForKey:@"levelProgress"] retain];
		[levelProgress release];
		levelProgress = gp;
        
        NSMutableDictionary *ach = [[gameprogress objectForKey:@"achievements"] retain];
		[achievements release];
		achievements = ach;
        
        NSNumber *esc = [gameprogress objectForKey:@"escapes"];
        //NSLog(@"esc %@",esc);
		numEscapes = [esc intValue];
        
        if([levelProgress intValue]>0){
            tutorialsdone = YES;
        }else{
            tutorialsdone = NO;
        }
	}

}

-(void)onLevelSkipped:(NSNotification*)note{
    numEscapes --;
}

-(int)getNumEsacapes{
    return numEscapes;
}

//onGKAchievement
-(void)setAchivementForID:(NSString *)ach_id{
    numEscapes ++;
    [achievements setObject:[NSNumber numberWithInt:1] forKey:ach_id];
    [achievementManager reportAchievementIdentifier:ach_id];
}

-(void)setPendingAchivements{
    for (id ach_id in achievements) {
        if ([[achievements objectForKey:ach_id] intValue] == 1) {
            //NSLog(@"pending ach :%@",ach_id);
            [achievementManager reportAchievementIdentifier:ach_id];
        }
    }
}

-(void)setGameCenterSubmittedAchivementForID:(NSString *)ach_id{
    [achievements setObject:[NSNumber numberWithInt:2] forKey:ach_id];
}

-(BOOL)hasAchivementForID:(NSString *)ach_id{
    int has_ach = [[achievements objectForKey:ach_id] intValue];
    if(has_ach > 0){
        return YES;
    }
    return NO;
}

-(BOOL)tutorialsDone{
	return tutorialsdone;
}

-(void)save:(NSNotification*)note{
	//NSLog(@"saving game progress!!!!");
	
	[gameprogress setObject:levelProgress forKey:@"levelProgress"];
    [gameprogress setObject:[NSNumber numberWithInt:numEscapes] forKey:@"escapes"];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *file = [documentsDirectory stringByAppendingPathComponent:[datafile_name stringByAppendingString:@".plist"]];
	
	//NSLog(@"gameprogress %@",gameprogress);
	
	[gameprogress writeToFile:file atomically:YES];
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    [achievementManager release];
	[level_dict release];
    [achievements release];
	[gameprogress release];
	[levelProgress release];
	[currentLevelIndex release];
	[startTime release];
	[curLevelEntryPoint release];
	[super dealloc];
}

@end
