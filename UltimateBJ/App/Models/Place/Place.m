//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Place.h"
#import "SceneGame.h"
#import "Game.h"
#import "Card.h"


@implementation Place
{
    Game *_game;
//    NSMutableArray *_cards;
}

- (id)init:(EPlaceType)type scene:(SceneGame *)scene game:(Game *)game;
{
    self = [super init];

    if (self)
    {
        _type = type;
        _game = game;
        _countOfCards = 0;
        _score = 0;
        _cards = [NSMutableArray array];
        [self _prepare:type scene:scene];
    }

    return self;
}

- (void)_prepare:(EPlaceType)type  scene:(SceneGame *)scene
{
    _placeMoney = 0;
    if (type == EPT_CROUPIER)
    {
        _active = YES;
    }
    else
    {
        _active = NO;

    }
    if (type != EPT_HAND1 && type != EPT_HAND5)
    {
        _view = [[PlaceView alloc] init:type scene:scene owner:self];
    }
}

- (void)cleanup
{
    [_view cleanup];
    _view = nil;
}


- (NSUInteger)returnMoney
{
    NSUInteger result = _placeMoney;
    _placeMoney = 0;
    return result;
}

- (void)addMoneyToPlace:(NSUInteger)money
{
    _placeMoney += money;
}

- (void)subtractMoneyFromGame:(NSUInteger)howMuch
{
    [_game subtractMoney:howMuch];
}


- (void)addCardToPlace:(Card *)card
{
    [_cards addObject:card];
}

-(void)removeCardsFromPlace
{
    for (Card * card in _cards)
    {
      [self _removeCard:card];
    }
}

-(void) _removeCard:(Card *) card
{
    [_cards removeObject:card];
}

@end