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
#import "SharedProgressManager.h"


@implementation Game
{
    SceneGame *_gameScene;
    CardBox *_cardBox;
    NSMutableArray *_places;
    NSMutableArray *_playingButtons;
    ButtonGameView *_buttonDeal;
    NSUInteger _gameMoney;

    EPlaceType _currentPlaceType;

    CCNode *_moneyView;
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

    _moneyView = [CCNode node];

    _moneyLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", _gameMoney]
                                     fontName:@"Marker Felt"
                                     fontSize:50];

    _moneyLabel.position = CGPointMake(60, 20);
    _moneyLabel.color = ccWHITE;
    [_moneyView addChild:_moneyLabel];
    [_gameScene addChild:_moneyView];
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
    NSUInteger countOfRuns = 0;
    Card *tempCard;


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
                tempCard = [_cardBox getCardFromBoxWithDelay:pointDestination countOfRuns:countOfRuns];
                [_places[placeType] addCardToPlace:tempCard];
                ((Place *) _places[placeType]).countOfCards++;
                ((Place *) _places[placeType]).score += [SharedProgressManager getScoreToAdd:tempCard.type];


                [((Place *) _places[placeType]).view updateScoreLabel];
                countOfRuns++;

                if (((Place *) _places[placeType]).score == 21)
                {
                    [self _endGameForPlace:placeType WIN:YES];
                }
            }
        }
    }

    id _delayDeal = [CCDelayTime actionWithDuration:countOfRuns * [ResourceManager getCardMoveDuration]];
    id _callDealEnd = [CCCallFunc actionWithTarget:self selector:@selector(_dealEnd)];
    [_gameScene runAction:[CCSequence actions:_delayDeal, _callDealEnd, nil]];
}

- (void)_endGameForPlace:(EPlaceType)placeType WIN:(BOOL)win
{
    if (win == YES)
    {
        _gameMoney += ((Place *) _places[placeType]).placeMoney;
    }

    if (placeType != EPT_CROUPIER)
    {
        ((Place *) _places[placeType]).placeMoney = 0;
        ((Place *) _places[placeType]).active = NO;
    }

    NSUInteger countOfRuns = 0;
    for (Card *card in ((Place *) _places[placeType]).cards)
    {
        [_cardBox putCardToBox:card countOfRuns:countOfRuns++];
    }

}

- (void)_dealEnd
{
    _currentPlaceType = EPT_HAND1;

    [self _nextPlace];

    [self _resumeGame];
}

- (void)_nextPlace
{
    Place *tempPlace = _places[++_currentPlaceType];

    while (tempPlace.active != YES && _currentPlaceType < EPT_CROUPIER)
    {
        _currentPlaceType++;
        tempPlace = _places[_currentPlaceType];
    }
    if (_currentPlaceType == EPT_CROUPIER)
    {
        [self _croupierTurn];
    }
}

- (void)_resumeGame
{
    for (EButtonGameType gameType = EBGT_DOUBLE; gameType < EBGT_COUNT - 2; gameType++)
    {
        [(ButtonGameView *) _playingButtons[gameType] switchOn];
    }
}

- (void)makeHit
{
    Card *tempCard;

    for (EButtonGameType gameType = EBGT_DOUBLE; gameType < EBGT_COUNT - 2; gameType++)
    {
        [(ButtonGameView *) _playingButtons[gameType] switchOff];
    }

    CGPoint pointDestination = [ResourceManager getPoint:_currentPlaceType];
    pointDestination =
            ccp(pointDestination.x + ((Place *) _places[_currentPlaceType]).countOfCards * 4,
                    pointDestination.y - ((Place *) _places[_currentPlaceType]).countOfCards * 4);

    tempCard = [_cardBox getCardFromBoxWithDelay:pointDestination countOfRuns:0];

    [_places[_currentPlaceType] addCardToPlace:tempCard];
    ((Place *) _places[_currentPlaceType]).countOfCards++;
    ((Place *) _places[_currentPlaceType]).score += [SharedProgressManager getScoreToAdd:tempCard.type];

    [((Place *) _places[_currentPlaceType]).view updateScoreLabel];

    if (((Place *) _places[_currentPlaceType]).score > 21)
    {
        [self _endGameForPlace:_currentPlaceType WIN:NO];
        [self _nextPlace];
    }

    for (EButtonGameType gameType = EBGT_DOUBLE; gameType < EBGT_COUNT - 2; gameType++)
    {
        [(ButtonGameView *) _playingButtons[gameType] performSelector:@selector(switchOn) withObject:nil afterDelay:2.0f];
    }

}

- (void)makeStand
{
    [self _nextPlace];

}

- (void)makeDouble
{
    [self subtractMoney:((Place *) _places[_currentPlaceType]).placeMoney];
    [((Place *) _places[_currentPlaceType]) addMoneyToPlace:((Place *) _places[_currentPlaceType]).placeMoney];
    [((Place *) _places[_currentPlaceType]).view updateMoneyLabel];
    [self _nextPlace];
}

- (void)_croupierTurn
{
    Card *tempCard;
    NSUInteger countOfRuns = 0;
    BOOL anyActive = [self _anyActivePlaces];

    while (((Place *) _places[EPT_CROUPIER]).score < 17 && anyActive)
    {
        CGPoint pointDestination = [ResourceManager getPoint:_currentPlaceType];
        pointDestination =
                ccp(pointDestination.x + ((Place *) _places[_currentPlaceType]).countOfCards * 4,
                        pointDestination.y - ((Place *) _places[_currentPlaceType]).countOfCards * 4);

        tempCard = [_cardBox getCardFromBoxWithDelay:pointDestination countOfRuns:countOfRuns++];

        [_places[_currentPlaceType] addCardToPlace:tempCard];
        ((Place *) _places[_currentPlaceType]).countOfCards++;
        ((Place *) _places[_currentPlaceType]).score += [SharedProgressManager getScoreToAdd:tempCard.type];

        [((Place *) _places[_currentPlaceType]).view updateScoreLabel];
    }

    [self performSelector:@selector(_abandoneCroupie) withObject:nil afterDelay:6.0f];

}

- (void) _abandoneCroupie
{
    [self _endGameForPlace:EPT_CROUPIER WIN:NO];
}

- (BOOL)_anyActivePlaces
{
    for (NSUInteger i = 0; i < EPT_COUNT - 1; i++)
    {
        if (((Place *) _places[i]).active)
            return YES;
    }
    return NO;
}

@end