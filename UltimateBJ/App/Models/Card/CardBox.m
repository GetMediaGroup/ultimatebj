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
    SceneGame * _gameScene;
    NSMutableArray *_cards;
}

- (id)initWithObject:(SceneGame *) scene;
{
    self = [super init];

    if (self)
    {
        _gameScene=scene;
        _cards= [[NSMutableArray alloc] init];
        [self _prepare];
    }

    return self;
}

-(void) _prepare
{

  NSInteger i,j;
  for ( i=0; i<4; i++)
  {
      for (j=0;j<13; j++)


        [_cards addObject:[[Card alloc] initWithParams:i type:j]   ];
      ;
  }
}

-(void) showCards
{
    [self _addCardsToScene:_gameScene];
}

-(void) _addCardsToScene:(SceneGame *) sceneGame
{
    NSInteger xStart = 100;
    NSInteger yStart = 0;


    for (Card *card in _cards)
    {
        [card initView];

        card.view.rootView.position = ccp(xStart, yStart);

        [_gameScene addChild:card.view.rootView];

        xStart += card.view.contentSize.size.width+1;
    }
}



@end