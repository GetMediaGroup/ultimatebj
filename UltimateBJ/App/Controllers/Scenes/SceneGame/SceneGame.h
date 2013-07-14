//
// Created by Roman on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "SceneBase.h"

@class Game;


@interface SceneGame : SceneBase



/*
 * Static
 */

//! Default creator for scene. Need override in derived classes.
+ (SceneBase *)createScene;

/*
 * Properties
 */

@property (nonatomic, readonly) ESceneType type;

/*
 * Instance methods
 */

//! Load all resources here
- (void)loadResources;

//! Prepare scene. Init all game objects here
- (void)prepare;


@end