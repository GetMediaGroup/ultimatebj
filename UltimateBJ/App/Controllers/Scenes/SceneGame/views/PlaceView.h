//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "CCButtonDelegate.h"


@interface PlaceView : NSObject <CCButtonDelegate>

@property(nonatomic, readonly) CCNode *rootView;

@end