//
// Created by Roman on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SceneMenu.h"
#import "ButtonView.h"

@implementation SceneMenu
{

}

/*
 * Static
 */

+ (SceneBase *)createScene
{
    SceneMenu *result = [[SceneMenu alloc] init];

    return result;
}

/*
 * Properties
 */
- (ESceneType)type
{
    return EST_MENU;
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
    [super prepare];

    [self _initGameObjects];
}

- (void)_initGameObjects
{
    CCNode *button_test = [[ButtonView alloc] init:@"TEST"].rootView;
    [self addChild:button_test];
}

@end