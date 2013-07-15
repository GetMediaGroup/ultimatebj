//
// Created by Roman Bord on 7/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "EPlaceType.h"


@interface ResourceManager : NSObject


//Returns point depending on which hand is used
+(CGPoint) getPoint: (EPlaceType) type;

@end