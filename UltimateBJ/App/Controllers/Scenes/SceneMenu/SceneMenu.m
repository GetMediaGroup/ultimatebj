//
// Created by Roman on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SceneMenu.h"
#import "ButtonMenuView.h"

@implementation SceneMenu
{
    ButtonMenuView *_buttonStartGameView;
    ButtonMenuView *_buttonHighScoreView;
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
    //Init two buttons
    _buttonStartGameView = [[ButtonMenuView alloc] init:@"New Game"];
    CCNode *_buttonStartGame = _buttonStartGameView.rootView;
    [self addChild:_buttonStartGame];

    _buttonHighScoreView = [[ButtonMenuView alloc] init:@"High Score"];
    CCNode *_buttonHighScore = _buttonHighScoreView.rootView;
    [self addChild:_buttonHighScore];

    //Set positions of buttons
    CGFloat y = ([CCDirector sharedDirector].winSize.height - 2 * [_buttonStartGameView getSize].height) / 3;
    [_buttonHighScoreView setPosition:ccp([CCDirector sharedDirector].screenCenter.x, y)];
    [_buttonStartGameView setPosition:ccp([CCDirector sharedDirector].screenCenter.x, 2 * y + [_buttonStartGameView getSize].height)];
}

@end