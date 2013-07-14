//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MoneyManager.h"


@implementation MoneyManager
{

}

- (id)init
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
    _userMoney = 1000;
}

@end