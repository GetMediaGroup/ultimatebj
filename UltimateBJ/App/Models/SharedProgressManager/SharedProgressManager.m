//
// Created by Gregory Tkach on 4/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SharedProgressManager.h"
#import "Game.h"
#import "SceneBase.h"
#import "CardBox.h"
#import "ECardType.h"


@implementation SharedProgressManager
{

}

static SharedProgressManager *_instance = nil;

+ (SharedProgressManager *)shared
{
    @synchronized (self)
    {
        if (!_instance)
        {
            _instance = [[SharedProgressManager alloc] init];
        }
    }

    return _instance;
}

+ (NSUInteger)getScoreToAdd :(ECardType)type
{
    NSUInteger result = 0;

    switch (type)
    {
        case ECT_2:
        {
            result = 2;
            break;
        }
        case ECT_3:
        {
            result = 3;
            break;
        }
        case ECT_4:
        {
            result = 4;
            break;
        }
        case ECT_5:
        {
            result = 5;
            break;
        }
        case ECT_6:
        {
            result = 6;
            break;
        }
        case ECT_7:
        {
            result = 7;
            break;
        }
        case ECT_8:
        {
            result = 8;
            break;
        }
        case ECT_9:
        {
            result = 9;
            break;
        }
        case ECT_10:
        {
            result = 10;
            break;
        }
        case ECT_JACK:
        {
            result = 10;
            break;
        }
        case ECT_ACE:
        {
            result = 10;
            break;
        }
        case ECT_KING:
        {
            result = 10;
            break;
        }
        case ECT_QUEEN:
        {
            result = 10;
            break;
        }
        default:
        {
            NSAssert(NO, @"Card type must be set");
            break;
        }
    }

    return result;
}


//! Designated initializer
- (id)init
{
    self = [super init];

    if (self)
    {
        [self _prepare];
    }

    return self;
}

- (void)_prepare
{

}


//! Must call when some game starts
- (void)didGameStart:(Game *)game
{
    NSAssert(!_game, @"SharedProgressManager::didGameStart. Some game already started.");
    NSAssert(game, @"SharedProgressManager::didGameStart. Game should be non nil.");

    _game = game;
}

//! Must call when current game end
- (void)didGameEnd
{
    NSAssert(_game, @"SharedProgressManager::didGameStart. Currently game is nil.");

}

@end