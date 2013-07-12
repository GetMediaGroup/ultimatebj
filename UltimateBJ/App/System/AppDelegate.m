/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim. 
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

#import "AppDelegate.h"
#import "ESceneType.h"
#import "SceneBase.h"
#import "SharedProgressManager.h"
#import "Game.h"
#import "SimpleAudioEngine.h"

@implementation AppDelegate

- (void)initializationComplete
{

    [super initializationComplete];

    glClearColor(0.8f, 0.8f, 0.8f, 1.0f);

    {//init singletons
        [SimpleAudioEngine sharedEngine];

        [SharedProgressManager shared];
    }



    [SceneBase setScene:EST_MENU];

//    Game *game = [[Game alloc] init];
//
//    [[SharedProgressManager shared] didGameStart:game];


#ifdef KK_ARC_ENABLED
	CCLOG(@"ARC is enabled");
#else
    CCLOG(@"ARC is either not available or not enabled");
#endif
}

- (id)alternateView
{
    return nil;
}

@end
