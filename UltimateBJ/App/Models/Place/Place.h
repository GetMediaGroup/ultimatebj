//
// Created by Alexey Bulavka on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "PlaceView.h"
#import "EPlaceType.h"

@class SceneGame;
@class Game;
@class Card;


@interface Place : NSObject

@property(nonatomic, readwrite) BOOL active;

@property(nonatomic, readonly) PlaceView *view;

@property(nonatomic, readonly) EPlaceType type;

@property(nonatomic, readonly) SceneGame *scene;

@property(nonatomic, readwrite) NSUInteger countOfCards;

@property (nonatomic, readwrite) NSUInteger placeMoney;


- (id)init:(EPlaceType)type scene:(SceneGame *)scene game:(Game *)game;

- (void)cleanup;

- (NSUInteger)returnMoney;

- (void)addMoneyToPlace:(NSUInteger)money;

- (void)subtractMoneyFromGame:(NSUInteger)howMuch;

- (void)addCardToPlace:(Card *)card;


@end