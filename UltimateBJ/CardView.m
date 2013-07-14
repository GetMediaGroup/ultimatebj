//
// Created by Roman on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CardView.h"
#import "Card.h"


@implementation CardView
{
    CCSprite *_sprite;

    CCTexture2D *_textureCardBack;
    CCTexture2D *_textureCardFace;

}
- (id)initWithOwner:(Card *)owner
{
    NSAssert(owner, @"CardView::initWithOwner. owner should be non nil.");

    self = [super init];

    if (self != nil)
    {
        _owner = owner;

        [self _prepare];
    }

    return self;
}

- (void)_prepare
{
    _rootView = [CCNode node];
    //Тернарный оператор

    NSString *SpriteName = [[NSString alloc] init];



    switch (_owner.suit)
    {
        case ECS_CLUBS:
        {
          //ToDO: Another switch for type
          //_textureCardFace = etc
        }
        case ECS_DIAMOND:
        {

        }
        case ECS_HEARTS:
        {

        }
        case ECS_SPADES:
        {

        }
    }

    _textureCardBack =  [[CCTextureCache sharedTextureCache] addImage:@"card-back.png"];


    _sprite = [CCSprite spriteWithTexture:_textureCardBack];


    [_rootView addChild:_sprite];
}

@end