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
        _cards = [[NSMutableArray alloc] init];
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

    [self _showBox];
}

-(void) _showBox
{
    NSInteger xStart = 390;
    NSInteger yStart = 260;

    _rootView = [CCNode node];



    _sprite = [CCSprite spriteWithFile:@"cardBox.png"];


    [_rootView addChild:_sprite];

    _rootView.position = ccp(xStart, yStart);

    [_gameScene addChild:_rootView];
}

- (Card *)getCardFromBox:(CGPoint)point;
{
    Card *temp = _cards[_cards.count - 1];

    [_cards removeLastObject];

    [self _addCardToScene:temp];

    [temp.view moveTo:point];

    return temp;
}

- (void)putCardToBox:(Card *)card
{
    [_cards addObject:card];

    [_gameScene removeChild:card.view.rootView];
    [card.view cleanupView];
}

-(void) shuffleCards
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

- (void)showCards
{
    [self _addCardsToScene];
}

- (void)_addCardToScene:(Card *)card
{
    NSInteger xStart = 390;
    NSInteger yStart = 260;

    [card initView];

    card.view.rootView.position = ccp(xStart, yStart);

    [_gameScene addChild:card.view.rootView];
}

- (void)_addCardsToScene
{
    NSInteger xStart = 390;
    NSInteger yStart = 260;


    for (Card *card in _cards)
    {
        [self _addCardToScene:card];
    }
}


@end