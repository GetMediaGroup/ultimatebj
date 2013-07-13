//
// Created by Alexey Bulavka on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "CCButtonDelegate.h"


@interface ButtonView : NSObject <CCButtonDelegate>

@property (nonatomic, readonly) CCNode *rootView;

- (id)init:(NSString *)textLabel;

//! Fires when specify button touch began
- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch;

//! Fires when specify button touch moved
- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch;

//! Fires when specify button touch ended
- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch;

//! Fires when specify button touch canceled
- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch;

@end