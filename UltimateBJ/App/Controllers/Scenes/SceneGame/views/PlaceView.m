//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PlaceView.h"
#import "CCButton.h"
#import "EPlaceType.h"
#import "SceneGame.h"


@implementation PlaceView
{
    CCButton *_pic;
    CCTexture2D *_texturePic;
    CCTexture2D *_textureActivePic;
}

- (id)init:(EPlaceType)type scene:(SceneGame *)scene
{
    self = [super init];

    if (self)
    {
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
}

- (void)_initView:(EPlaceType)type scene:(SceneGame *)scene
{
    _rootView = [CCNode node];

    NSString *_imageName;
    NSString *_imageActiveName;
    CGPoint _picPoint;

    switch (type)
    {
        case EPT_HAND2:
        {
            _imageName = @"emptyPlace(86x86).png";
            _imageActiveName = @"activePlaceRight(86x86).png";
            _picPoint = ccp(290, 98.5);
            break;
        }
        case EPT_HAND3:
        {
            _imageName = @"emptyPlace(60x79).png";
            _imageActiveName = @"activePlace(60x79).png";
            _picPoint = ccp(224.5, 89);
            break;
        }
        case EPT_HAND4:
        {
            _imageName = @"emptyPlace(86x86).png";
            _imageActiveName = @"activePlaceLeft(86x86).png";
            _picPoint = ccp(145.5, 98.5);
            break;
        }
        default:
        {
            NSAssert(NO, @"Invalid type of Place!");
            break;
        }
    }

    _texturePic = [[CCTextureCache sharedTextureCache] addImage:_imageName];
    _textureActivePic = [[CCTextureCache sharedTextureCache] addImage:_imageActiveName];
    _pic = [CCButton spriteWithTexture:_texturePic];

    _pic.position = _picPoint;
    _pic.anchorPoint = ccp(0, 0);
    _pic.delegate = self;

    [_rootView addChild:_pic];
    [scene addChild:_rootView];
}

- (void)_activate
{
    _pic.texture = _textureActivePic;
}

- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch
{
    [self _activate];
}

- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch
{

}

- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch
{
    [self _didButtonTouchEndedOrCanceled];
}

- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch
{
    [self _didButtonTouchEndedOrCanceled];

}

- (void)_didButtonTouchEndedOrCanceled
{

}

@end