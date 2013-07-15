//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "CCButtonDelegate.h"
#import "EPlaceType.h"

@class SceneGame;
@class Place;


@interface PlaceView : NSObject <CCButtonDelegate>

@property(nonatomic, readonly) CCNode *rootView;

@property (nonatomic, readwrite) CCLabelTTF * moneyLabel;

- (id)init:(EPlaceType)type scene:(SceneGame *)scene owner:(Place *)owner;

- (void)cleanup;

- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch;

- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch;

- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch;

- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch;

@end