//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Place.h"


@implementation Place
{
    NSUInteger _placeMoney;
}

- (id)init:(EPlaceType)type
{
    self = [super init];

    if (self)
    {
        _type = type;
        [self _prepare];
    }

    return self;
}

- (void)_prepare
{
    _placeMoney = 0;
    _active = NO;
    _view = [[PlaceView alloc] init];
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