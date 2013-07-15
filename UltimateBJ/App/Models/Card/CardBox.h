//
// Created by Roman on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SceneGame;
@class Card;


@interface CardBox : NSObject


//Designated initializer
- (id)initWithObject:(SceneGame *)scene;

- (Card *)getCardFromBoxWithDelay:(CGPoint)point countOfRuns:(NSUInteger)countOfRuns flip:(BOOL)flip;

- (void)putCardToBox:(Card *)card;

- (void)shuffleCards;


- (void)showCards;

//! Returns game scene which the cardBox is posted on
@property(nonatomic, readonly) SceneGame *gameScene;

@end