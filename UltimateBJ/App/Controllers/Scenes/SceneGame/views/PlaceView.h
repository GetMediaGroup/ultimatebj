//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "CCButtonDelegate.h"
#import "EPlaceType.h"

@class SceneGame;


@interface PlaceView : NSObject <CCButtonDelegate>

@property(nonatomic, readonly) CCNode *rootView;


- (id)init:(EPlaceType)type scene:(SceneGame *)scene;

- (void)cleanup;

- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch;

- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch;

- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch;

- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch;

@end