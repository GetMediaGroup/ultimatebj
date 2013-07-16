//
// Created by Roman on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Card.h"
#import "CardView.h"


@implementation Card
{

}
- (id)initWithParams:(ECardSuit)suit type:(ECardType)type
{
    self = [super init];

    if (self)
    {
        _suit = suit;
        _type = type;

        [self _prepare];
    }

    return self;
}


-(void) _prepare
{

}

- (void)initView
{
    NSAssert(!_view, @"Card::initView. View already init");

    {//init button
        _view = [[CardView alloc] initWithOwner:self];
    }
}




@end