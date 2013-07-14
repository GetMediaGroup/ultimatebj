//
// Created by Roman on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Card;


@interface CardView : NSObject

@property (nonatomic, readonly) CCNode *rootView;

@property (nonatomic, readonly) Card *owner;

-(id) initWithOwner:(Card *) owner;

@end