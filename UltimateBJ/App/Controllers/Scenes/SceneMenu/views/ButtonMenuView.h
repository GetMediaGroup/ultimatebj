//
// Created by Alexey Bulavka on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "CCButtonDelegate.h"
#import "EButtonMenuType.h"


@interface ButtonMenuView : NSObject <CCButtonDelegate>

@property(nonatomic, readonly) CCNode *rootView;

@property(nonatomic, readonly) EButtonMenuType buttonType;

- (id)init:(NSString *)textLabel buttonType:(EButtonMenuType)buttonType;

- (void)setPosition:(CGPoint)point;

- (CGSize)getSize;

//! Fires when specify button touch began
- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch;

//! Fires when specify button touch moved
- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch;

//! Fires when specify button touch ended
- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch;

//! Fires when specify button touch canceled
- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch;

@end