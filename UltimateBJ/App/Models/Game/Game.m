//
// Created by Roman on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Game.h"
#import "CardBox.h"
#import "SceneGame.h"
#import "Place.h"
#import "Card.h"
#import "CardView.h"
#import "ButtonGameView.h"


@implementation Game
{
    SceneGame *_gameScene;
    CardBox *_cardBox;
    NSMutableArray *_places;
    NSMutableArray *_playingButtons;
    ButtonGameView *_buttonDeal;
    Card *testCard; //Todo delete
}

//! Designated initializer
- (id)initWithObject:(SceneGame *)sceneGame
{

    self = [super init];

    if (self)
    {
        _gameScene = sceneGame;
        [self _prepare];
    }

    return self;
}

- (void)_prepare
{
    [self _createCardBox];
    [self _initPlaces];
    [self _initButtons];

    [self _doGame];
}

- (void)_createCardBox
{
    _cardBox = [[CardBox alloc] initWithObject:_gameScene];
}

- (void)_initPlaces
{
    _places = [NSMutableArray array];
    for (EPlaceType placeType = EPT_HAND1; placeType < EPT_COUNT; placeType++)
    {
        [_places addObject:[[Place alloc] init:placeType scene:_gameScene]];
    }
}

- (void)_initButtons
{
    CGFloat _delta = 10;
    _playingButtons = [NSMutableArray array];

    for (EButtonGameType gameType = EBGT_DOUBLE; gameType < EBGT_COUNT - 1; gameType++)
    {
        ButtonGameView *_buttonCurrent = [[ButtonGameView alloc] init:gameType scene:_gameScene];
        [_buttonCurrent setPosition:ccp(480 - [_buttonCurrent getSize].width * 0.2 - _delta, 10)];
        [_playingButtons addObject:_buttonCurrent];
        _delta += [_buttonCurrent getSize].width * 0.2 + 10;
    }

    _buttonDeal = [[ButtonGameView alloc] init:EBGT_DEAL scene:_gameScene];
    [_buttonDeal setPosition:ccp(480 - [_buttonDeal getSize].width * 0.2 - 10, 180)];
    [_playingButtons addObject:_buttonDeal];
}

//Test function! Don't use
- (void)_doGame
{
    testCard = [_cardBox getCardFromBox:CGPointMake(232, 117)];

    testCard.view.rootView.scale = 0.65;
}


@end