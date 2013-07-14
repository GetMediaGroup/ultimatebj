//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PlaceView.h"
#import "EPlaceType.h"


@interface Place : NSObject

@property (nonatomic, readonly) BOOL active;

@property (nonatomic, readonly) PlaceView *view;

@property (nonatomic, readonly) EPlaceType type;

- (id)init;

- (NSUInteger)returnMoney;

- (void)addMoney:(NSUInteger)money;

@end