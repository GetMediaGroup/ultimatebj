//
// Created by Alexey Bulavka on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ButtonMenuView.h"
#import "CCButton.h"


@implementation ButtonMenuView
{
    CCButton *_button;

    CCTexture2D *_textureButtonNormal;
    CCTexture2D *_textureButtonActive;

}

// Designated initializer
- (id)init:(NSString *)textLabel
{
    self = [super init];

    if (self)
    {
        [self _prepare:textLabel];
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

- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch
{
    _button.texture = _textureButtonActive;
}

- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch
{

}

- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch
{
    [self didButtonTouchEndedOrCanceled:button touch:touch];
}

- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch
{
    [self didButtonTouchEndedOrCanceled:button touch:touch];

}

- (void)didButtonTouchEndedOrCanceled:(CCButton *)button touch:(UITouch *)touch
{
    _button.texture = _textureButtonNormal;
}


@end