//
// Created by Roman on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CardView.h"
#import "Card.h"
#import "ResourceManager.h"


@implementation CardView
{
    CCSprite *_sprite;

    CCTexture2D *_textureCardBack;
    CCTexture2D *_textureCardFace;

}

//Properties

- (CGRect)contentSize
{
    CGFloat width = _sprite.contentSize.width * _rootView.scaleX;
    CGFloat height = _sprite.contentSize.height * _rootView.scaleY;

    CGFloat positionX = _rootView.position.x - width / 2;
    CGFloat positionY = _rootView.position.y + height / 2;

    return CGRectMake(positionX, positionY, width, height);
}

- (CGRect)contentSizeAbsolute
{
    CGRect result;

    CGPoint absoluteTopLeftPoint = [_rootView convertToWorldSpace:ccp(-self.contentSize.size.width / 2, self.contentSize.size.height / 2)];

    result = CGRectMake(absoluteTopLeftPoint.x,
            absoluteTopLeftPoint.y,
            self.contentSize.size.width,
            self.contentSize.size.height);

    return result;
}

//Methods

//Designated initializer
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

- (void)moveToWithDelay:(CGPoint)point countOfRuns:(NSUInteger)countOfRuns
{
    ccBezierConfig bezier;

    bezier.endPosition = bezier.controlPoint_1 = bezier.controlPoint_2 = point;

    id bezierAction;

    bezierAction = [CCBezierTo actionWithDuration:[ResourceManager getCardMoveDuration] bezier:bezier];


    id delay = [CCDelayTime actionWithDuration:[ResourceManager getCardMoveDuration] * countOfRuns];

    CCAction *arcAction = [CCSequence actions:delay, bezierAction, nil];

    [_owner.view.rootView runAction:arcAction];
}

- (void)moveFromScene :(NSUInteger)countOfRuns
{
    ccBezierConfig bezier;

    bezier.endPosition = bezier.controlPoint_1 = bezier.controlPoint_2 = ccp(50, 600);

    id bezierAction;

    bezierAction = [CCBezierTo actionWithDuration:[ResourceManager getCardMoveDuration] bezier:bezier];


    id delay = [CCDelayTime actionWithDuration:[ResourceManager getCardMoveDuration] * countOfRuns];

    CCAction *arcAction = [CCSequence actions:delay, bezierAction, nil];

    [_owner.view.rootView runAction:arcAction];
}

- (void)_prepare
{
    _rootView = [CCNode node];

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
        default:
        {

        }
    }

    _textureCardBack = [[CCTextureCache sharedTextureCache] addImage:@"card-back.png"];


    _sprite = [CCSprite spriteWithTexture:_textureCardBack];

    [_rootView addChild:_sprite];
}

- (void)cleanupView
{

    _rootView = nil;

    _sprite = nil;

    _textureCardBack = nil;

}

@end