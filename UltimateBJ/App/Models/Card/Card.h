//
// Created by Roman on 7/14/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "ECardSuit.h"
#import "ECardType.h"

@class CardView;


@interface Card : NSObject

@property(nonatomic, readwrite) CardView *view;

@property(nonatomic, readonly) ECardType type;
@property(nonatomic, readonly) ECardSuit suit;
@property (nonatomic, assign) BOOL faceUp;

//! Designated initializer
- (id)initWithParams:(ECardSuit)suit type:(ECardType)type;

//! Init view. Must call only one time.
-(void)initView;


@end