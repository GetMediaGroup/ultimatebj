//
// Created by Alexey Bulavka on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ButtonView.h"
#import "CCButton.h"


@implementation ButtonView
{
    NSString *_textLabel;
    CCButton *_button;
}

// Designated initializer
- (id)init:(NSString *)textLabel
{
    self = [super init];

    if (self)
    {
        [self _prepare];
    }

    return self;
}

- (void)_prepare
{
    _rootView = [CCNode node];
    _rootView.position = [CCDirector sharedDirector].screenCenter;

    _button = [CCButton spriteWithFile:@"ship-hd.png"];
    _button.delegate = self;

    //ToDo: add textLabel

    [_rootView addChild:_button];
}

- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch
{

}

- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch
{

}

- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch
{

}

- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch
{

}

@end