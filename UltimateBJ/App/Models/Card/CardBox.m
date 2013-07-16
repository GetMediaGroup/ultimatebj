//
// Created by Roman on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CardBox.h"
#import "Card.h"
#import "CardView.h"
#import "SceneGame.h"


@implementation CardBox
{
    SceneGame *_gameScene;
    NSMutableArray *_cards;

    CCSprite *_sprite;

    CCNode *_rootView;

}

- (id)initWithObject:(SceneGame *)scene;
{
    self = [super init];

    if (self)
    {
        _gameScene = scene;
        _cards = [NSMutableArray array];
        [self _prepare];
    }

    return self;
}

- (void)_prepare
{
    NSInteger i, j;
    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 13; j++)
        {
            [_cards addObject:[[Card alloc] initWithParams:i type:j]];
        }
    }

    [self shuffleCards];

    [self _showBox];
}

- (void)_showBox
{
    NSInteger xStart = 390;
    NSInteger yStart = 260;

    _rootView = [CCNode node];


    _sprite = [CCSprite spriteWithFile:@"cardBox.png"];

    [_rootView addChild:_sprite];

    _rootView.position = ccp(xStart, yStart);

    [_gameScene addChild:_rootView];
}

- (Card *)getCardFromBoxWithDelay:(CGPoint)point countOfRuns:(NSUInteger)countOfRuns flip:(BOOL)flip
{
    Card *temp = _cards[_cards.count - 1];

    [_cards removeLastObject];

    [self _addCardToScene:temp];

    [temp.view moveToWithDelay:point countOfRuns:countOfRuns flip:flip];

    return temp;
}

- (void)putCardToBox:(Card *)card countOfRuns:(NSUInteger)countOfRuns
{
    [_cards insertObject:card atIndex:0];

    [card.view moveToWithDelay:ccp(50, 600) countOfRuns:countOfRuns flip:NO];

    [self performSelector:@selector(_removeCardFromScene:) withObject:card afterDelay:2.0f * countOfRuns];

}

- (void)_removeCardFromScene :(Card *)card
{
    [_gameScene removeChild:card.view.rootView];
    [card.view cleanupView];
}

- (void)shuffleCards
{
    NSUInteger count = [_cards count];
    for (NSUInteger i = 0; i < count; ++i)
    {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSUInteger n = (arc4random() % nElements) + i;
        [_cards exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

- (void)_addCardToScene:(Card *)card
{
    NSInteger xStart = 390;
    NSInteger yStart = 260;

    [card initView];

    card.view.rootView.position = ccp(xStart, yStart);

    card.view.rootView.scale = 0.65;

    [_gameScene addChild:card.view.rootView];
}

- (void)destroyViews
{
    for (Card *card in _cards)
    {
        if (card.view)
        {
            [card.view cleanupView];
            card.view = nil;
        }
    }
}


@end