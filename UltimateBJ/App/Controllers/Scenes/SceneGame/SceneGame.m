//
// Created by Roman on 7/12/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SceneGame.h"
#import "SharedProgressManager.h"
#import "Game.h"


@implementation SceneGame
{
    CCSprite *_background;
    CCTexture2D *_textureBackground;
    Game *_game;
}
/*
 * Static
 */

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
    [super prepare];

    [self _initBackground];

    [self _initGameObjects];

     _game=[[Game alloc] initWithObject:self];
}

- (void)_initBackground
{
    _textureBackground = [[CCTextureCache sharedTextureCache] addImage:@"background(640x960).png"];
    _background = [CCSprite spriteWithTexture:_textureBackground];
    _background.anchorPoint = ccp(0, 0);
    [self addChild:_background];
}

- (void)_initGameObjects
{
}

@end