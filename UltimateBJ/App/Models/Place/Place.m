//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Place.h"
#import "SceneGame.h"


@implementation Place
{
    NSUInteger _placeMoney;
}

- (id)init:(EPlaceType)type scene:(SceneGame *)scene
{
    self = [super init];

    if (self)
    {
        _type = type;
        [self _prepare:type scene:scene];
    }

    return self;
}

- (void)cleanup
{
    [_view cleanup];
    _view = nil;
}

- (void)_prepare:(EPlaceType)type scene:(SceneGame *)scene
{
    _placeMoney = 0;
    _active = NO;
    if (type != EPT_CROUPIER && type != EPT_HAND1 && type != EPT_HAND5)
    {
        _view = [[PlaceView alloc] init:type scene:scene];
    }
}

- (NSUInteger)returnMoney
{
    NSUInteger result = _placeMoney;
    _placeMoney = 0;
    return result;
}

- (void)addMoney:(NSUInteger)money
{
    _placeMoney += money;
}

@end