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

//! Represents actually size of current content. Contains top left point and width+height.
@property (nonatomic, readonly) CGRect contentSize;

//! Represents actually size of current content. Contains top left point(absolute position) and width+height.
@property (nonatomic, readonly) CGRect contentSizeAbsolute;



-(id) initWithOwner:(Card *) owner;

@end