//
// Created by Roman on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SceneGame;


@interface CardBox : NSObject

//Designated initializer
-(id) initWithObject:(SceneGame *) scene;

-(void) showCards;

//! Returns game scene which the cardBox is posted on
@property (nonatomic, readonly) SceneGame *gameScene;

@end