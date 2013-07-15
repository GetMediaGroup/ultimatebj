//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PlaceView.h"
#import "EPlaceType.h"

@class SceneGame;


@interface Place : NSObject

@property (nonatomic, readwrite) BOOL active;

@property (nonatomic, readonly) PlaceView *view;

@property (nonatomic, readonly) EPlaceType type;

@property (nonatomic, readonly) SceneGame *scene;


- (id)init:(EPlaceType)type scene:(SceneGame *)scene;

- (void)cleanup;

- (NSUInteger)returnMoney;

- (void)addMoney:(NSUInteger)money;

@end