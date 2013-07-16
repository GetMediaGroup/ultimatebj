//
// Created by Roman Bord on 7/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ResourceManager.h"
#import "EPlaceType.h"


@implementation ResourceManager
{

}

+ (CGPoint)getPoint:(EPlaceType)type
{
    CGPoint result = ccp(0, 0);

    switch (type)
    {
        case EPT_HAND2:
        {
            result = ccp(295, 113);
            break;
        }
        case EPT_HAND3:
        {
            result = ccp(228, 105);
            break;
        }
        case EPT_HAND4:
        {
            result = ccp(149, 114);
            break;
        }
        case EPT_CROUPIER:
        {
            result = ccp(228, 180);
            break;
        }
        default:
        {
            NSAssert(NO, @"Invalid type of Place!");
            break;
        }
    }

    return result;
}

+ (CGFloat)getCardMoveDuration
{
    return 1.0f;
}

+ (ccColor3B)getActiveButtonColor
{
    ccColor3B result = {255, 255, 255};
    return result;
}

+ (ccColor3B)getInactiveButtonColor
{
    ccColor3B result = {127, 127, 127};
    return result;
}


@end