//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PlaceView.h"
#import "CCButton.h"
#import "EPlaceType.h"
#import "SceneGame.h"
#import "Place.h"
#import "ECardType.h"
#import "SharedProgressManager.h"


@implementation PlaceView
{
    CCButton *_pic;
    CCTexture2D *_texturePic;
    CCTexture2D *_textureActivePic;


    Place *_owner;
}

- (id)init:(EPlaceType)type scene:(SceneGame *)scene owner:(Place *)owner
{
    self = [super init];

    if (self)
    {
        _owner = owner;
        [self _initView:type scene:scene];
    }

    return self;
}

- (void)cleanup
{
    _pic = nil;
    _texturePic = nil;
    _textureActivePic = nil;
    _rootView = nil;
    _owner = nil;
}

- (void)_initView:(EPlaceType)type scene:(SceneGame *)scene
{
    _rootView = [CCNode node];

    NSString *_imageName;
    NSString *_imageActiveName;
    CGPoint _picPoint;


    if (type != EPT_CROUPIER)
    {

        _moneyLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", _owner.placeMoney]
                                         fontName:@"Marker Felt"
                                         fontSize:15];
        _moneyLabel.color = ccWHITE;
    }

    _scoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", _owner.score]
                                     fontName:@"Marker Felt"
                                     fontSize:15];

    _scoreLabel.color = ccWHITE;
    switch (type)
    {
        case EPT_HAND2:
        {
            _imageName = @"emptyPlace(86x86).png";
            _imageActiveName = @"activePlaceRight(86x86).png";
            _picPoint = ccp(290, 98.5);


            _moneyLabel.position = CGPointMake(305, 143);
            _scoreLabel.position = CGPointMake(305, 163);


            break;
        }
        case EPT_HAND3:
        {
            _imageName = @"emptyPlace(60x79).png";
            _imageActiveName = @"activePlace(60x79).png";
            _picPoint = ccp(224.5, 89);

            _moneyLabel.position = CGPointMake(235, 136);
            _scoreLabel.position = CGPointMake(235, 156);

            break;
        }
        case EPT_HAND4:
        {
            _imageName = @"emptyPlace(86x86).png";
            _imageActiveName = @"activePlaceLeft(86x86).png";
            _picPoint = ccp(145.5, 98.5);

            _moneyLabel.position = CGPointMake(150, 144);
            _scoreLabel.position = CGPointMake(150, 164);

            break;
        }
        case EPT_CROUPIER:
        {
            _scoreLabel.position = CGPointMake(205, 180);
            break;
        }
        default:
        {
            NSAssert(NO, @"Invalid type of Place!");
            break;
        }
    }
    if (type != EPT_CROUPIER)
    {
        [_rootView addChild:_moneyLabel];


        _texturePic = [[CCTextureCache sharedTextureCache] addImage:_imageName];
        _textureActivePic = [[CCTextureCache sharedTextureCache] addImage:_imageActiveName];
        _pic = [CCButton spriteWithTexture:_texturePic];

        _pic.position = _picPoint;
        _pic.anchorPoint = ccp(0, 0);
        _pic.delegate = self;


        [_rootView addChild:_pic];
    }
    [_rootView addChild:_scoreLabel];

    [scene addChild:_rootView];
}

- (void)_activate
{
    _pic.texture = _textureActivePic;
    _owner.active = YES;
}

- (void)deactivate
{
    _pic.texture = _texturePic;
    _owner.active = NO;
    [_rootView removeAllChildren];
}

- (void)updateScoreLabel :(ECardType)type
{
    if (type == nil)
    {
        [_scoreLabel setString:[NSString stringWithFormat:@"%d", _owner.score]];
    }
    else
    {
        [_scoreLabel setString:[NSString stringWithFormat:@"%d", [SharedProgressManager getScoreToAdd:type]]];
    }
}

- (void)updateMoneyLabel
{
    [_moneyLabel setString:[NSString stringWithFormat:@"%d", _owner.placeMoney]];
}

- (void)didButtonTouchBegan:(CCButton *)button
                      touch:
                              (UITouch *)touch
{
    [self _activate];

    [_owner addMoneyToPlace:50];

    [_moneyLabel setString:[NSString stringWithFormat:@"%d", _owner.placeMoney]];

    [_owner subtractMoneyFromGame:50];
}


- (void)didButtonTouchMoved:(CCButton *)button
                      touch:
                              (UITouch *)touch
{

}

- (void)didButtonTouchEnded:(CCButton *)button
                      touch:
                              (UITouch *)touch
{
    [self _didButtonTouchEndedOrCanceled];
}

- (void)didButtonTouchCanceled:(CCButton *)button
                         touch:
                                 (UITouch *)touch
{
    [self _didButtonTouchEndedOrCanceled];

}

- (void)_didButtonTouchEndedOrCanceled
{

}

@end