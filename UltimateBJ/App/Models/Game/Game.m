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
#import "ResourceManager.h"


@implementation Game
{
    SceneGame *_gameScene;
    CardBox *_cardBox;
    NSMutableArray *_places;
    NSMutableArray *_playingButtons;
    ButtonGameView *_buttonDeal;
    NSUInteger _gameMoney;

    CCNode *_rootView;
    CCLabelTTF *_moneyLabel;
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
    [self _initMoney];

}

- (void)_initMoney
{
    _gameMoney = 1000;

    _rootView = [CCNode node];


    _moneyLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", _gameMoney]
                                     fontName:@"Marker Felt"
                                     fontSize:50];

    _moneyLabel.position = CGPointMake(60, 20);
    _moneyLabel.color = ccWHITE;
    [_rootView addChild:_moneyLabel];
    [_gameScene addChild:_rootView];
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
        [_places addObject:[[Place alloc] init:placeType scene:_gameScene game:self]];
    }
}

- (void)_initButtons
{
    CGFloat _delta = 10;
    _playingButtons = [NSMutableArray array];

    for (EButtonGameType gameType = EBGT_DOUBLE; gameType < EBGT_COUNT - 1; gameType++)
    {
        ButtonGameView *_buttonCurrent = [[ButtonGameView alloc] init:gameType scene:_gameScene game:self];
        [_buttonCurrent setPosition:ccp(480 - [_buttonCurrent getSize].width * 0.2 - _delta, 10)];
        [_playingButtons addObject:_buttonCurrent];
        _delta += [_buttonCurrent getSize].width * 0.2 + 10;
    }

    _buttonDeal = [[ButtonGameView alloc] init:EBGT_DEAL scene:_gameScene game:self];
    [_buttonDeal setPosition:ccp(480 - [_buttonDeal getSize].width * 0.2 - 10, 180)];
    [_playingButtons addObject:_buttonDeal];
}

- (void)subtractMoney:(NSUInteger)howMuch
{
    _gameMoney -= howMuch;
    [_moneyLabel setString:[NSString stringWithFormat:@"%d", _gameMoney]];
}

- (void)makeDeal
{
    for (NSUInteger i = 0; i < 2; i++)
    {
        for (EPlaceType placeType = EPT_HAND1; placeType < EPT_COUNT; placeType++)
        {
            if (((Place *) _places[placeType]).active == YES)
            {
                CGPoint pointDestination = [ResourceManager getPoint:placeType];
                pointDestination =
                        ccp(pointDestination.x + ((Place *) _places[placeType]).countOfCards * 4,
                                pointDestination.y - ((Place *) _places[placeType]).countOfCards * 4);

                static NSUInteger countOfRuns=0;
                [_places[placeType] addCardToPlace:[_cardBox getCardFromBoxWithDelay:pointDestination countOfRuns:countOfRuns++]];
                ((Place *) _places[placeType]).countOfCards++;
            }
        }
    }
}



@end