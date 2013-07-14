//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PlaceView.h"
#import "CCButton.h"


@implementation PlaceView
{
    CCButton *_pic;
}

- (id)init
{
    self = [super init];

    if (self)
    {
        [self _initView];
    }

    return self;
}

- (void)_initView
{
    _rootView = [CCNode node];

    _pic = [CCButton init];
    _pic.delegate = self;

    [_rootView addChild:_pic];


}

@end