//
// Created by Alexey Bulavka on 7/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "CCButtonDelegate.h"
#import "EButtonGameType.h"

@class SceneGame;


@interface ButtonGameView : NSObject <CCButtonDelegate>

@property(nonatomic, readonly) CCNode *rootView;

@property(nonatomic, readonly) EButtonGameType buttonType;

- (id)init:(EButtonGameType)buttonType scene:(SceneGame *)scene;

- (void)setPosition:(CGPoint)point;

- (CGSize)getSize;

-(void) clearTextures;

//! Fires when specify button touch began
- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch;

//! Fires when specify button touch moved
- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch;

//! Fires when specify button touch ended
- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch;

//! Fires when specify button touch canceled
- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch;

@end