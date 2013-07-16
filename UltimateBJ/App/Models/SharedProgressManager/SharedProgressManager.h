//
// Created by Gregory Tkach on 4/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "ECardType.h"

@class Game;
@class SceneBase;
@class CardBox;

//! Interface which provide operations with game money and game progress(include runtime progress).
@interface SharedProgressManager : NSObject

/*
 * Properties
 */

@property (nonatomic, readonly) Game *game;

/*
 * methods
 */

+ (SharedProgressManager *)shared;

//! Designated initializer
- (id)init;

+ (NSUInteger)getScoreToAdd :(ECardType)type;

//! Must call when some game starts
-(void)didGameStart:(Game *)game;

//! Must call when current game end
-(void)didGameEnd;

@end