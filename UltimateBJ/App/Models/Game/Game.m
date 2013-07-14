//
// Created by Roman on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Game.h"
#import "CardBox.h"
#import "SceneGame.h"
#import "Card.h"
#import "CardView.h"


@implementation Game
{
    SceneGame *_gameScene;
    CardBox *_cardBox;
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
    [self _doGame];
}

- (void)_createCardBox
{
    _cardBox = [[CardBox alloc] initWithObject:_gameScene];


}


//Test function! Don't use
-(void) _doGame
{
   testCard = [_cardBox getCardFromBox:CGPointMake(200, 200)];

}



@end