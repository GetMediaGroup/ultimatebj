//
// Created by Roman on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SceneGame.h"


@implementation SceneGame
{
    NSMutableArray *scene;
}
/*
 * Static
 */

//! Default creator for scene. Need override in derived classes.
+ (SceneBase *)createScene
{
    SceneGame *result = [[SceneGame alloc] init];

    return result;
}

/*
 * Properties
 */
- (ESceneType)type
{
    return EST_GAME;
}

/*
 * Instance
 */

//! Load all resources here
- (void)loadResources
{

}

//! Prepare scene. Init all game objects here
- (void)prepare
{

}

- (void)_initGameObjects
{

}

@end