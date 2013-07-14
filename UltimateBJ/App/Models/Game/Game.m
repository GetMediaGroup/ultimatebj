//
// Created by Roman on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Game.h"
#import "CardBox.h"
#import "SceneGame.h"
#import "Place.h"


@implementation Game
{
    SceneGame *_gameScene;
    CardBox *_cardBox;
    Place *_testPlace;
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
    [_cardBox showCards];

    _testPlace = [[Place alloc] init:EPT_HAND1 scene:_gameScene];
}

- (void)_createCardBox
{
    _cardBox = [[CardBox alloc] initWithObject:_gameScene];

}

@end