//
// Created by Roman on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class CardBox;
@class SceneGame;


@interface Game : NSObject

//! Designated initializer
- (id)initWithObject:(SceneGame *) sceneGame;

-(void) subtractMoney:(NSUInteger) howMuch;

-(void) makeDeal;

-(void) makeHit;

-(void) makeStand;

-(void) makeDouble;

- (BOOL) anyActivePlaces;

- (void)switchDealOn;
@end

