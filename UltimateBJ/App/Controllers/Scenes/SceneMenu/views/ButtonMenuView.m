//
// Created by Alexey Bulavka on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ButtonMenuView.h"
#import "CCButton.h"
#import "ESceneType.h"
#import "SceneBase.h"


@implementation ButtonMenuView
{
    CCButton *_button;

    CCTexture2D *_textureButtonNormal;
    CCTexture2D *_textureButtonActive;

}

// Designated initializer
- (id)init:(NSString *)textLabel buttonType:(EButtonMenuType)buttonType
{
    self = [super init];

    if (self)
    {
        [self _prepare:textLabel];
        _buttonType = buttonType;
    }

    return self;
}

- (void)_prepare :(NSString *)textLabel
{
    _rootView = [CCNode node];

    _textureButtonNormal = [[CCTextureCache sharedTextureCache] addImage:@"buttonMenuNormal.png"];
    _textureButtonActive = [[CCTextureCache sharedTextureCache] addImage:@"buttonMenuActive.png"];

    _button = [CCButton spriteWithTexture:_textureButtonNormal];
    _button.scale = 0.3;
    _button.delegate = self;

    [_rootView addChild:_button];

    CCLabelTTF *label = [CCLabelTTF labelWithString:textLabel
                                           fontName:@"Marker Felt"
                                           fontSize:50];

    label.position = _button.boundingBoxCenter;
    label.color = ccWHITE;
    [_rootView addChild:label];
}

- (void)setPosition:(CGPoint)point
{
    _rootView.position = point;
}

- (CGSize)getSize
{
    return _button.size;
}

- (void)clearTextures
{
    _textureButtonNormal = nil;
    _textureButtonActive = nil;
}

- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch
{
    _button.texture = _textureButtonActive;

    switch (_buttonType)
    {
        case EBMT_NEWGAME:
        {
            [SceneBase setScene:EST_GAME];
            break;
        }
        case EBMT_HIGHSCORE:
        {
            //ToDo: Need to load SceneHighScore here
            break;
        }
        default:
        {
            //Not implemented
            NSAssert(NO, @"No scene to change!");
            break;
        }
    }
}

- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch
{

}

- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch
{
    [self didButtonTouchEndedOrCanceled];
}

- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch
{
    [self didButtonTouchEndedOrCanceled];

}

- (void)didButtonTouchEndedOrCanceled
{
    _button.texture = _textureButtonNormal;
}


@end