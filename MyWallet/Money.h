//
//  Money.h
//  MyWallet
//
//  Created by Verónica Cordobés on 20/7/16.
//  Copyright © 2016 Verónica Cordobés. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;
@class Broker;

@protocol  Money <NSObject>

-(id)initWithAmount: (NSInteger) amount
           currency: (NSString *) currency;

-(id<Money>)times:(NSInteger) multiplier;

-(id<Money>) plus:(Money *) other;

-(id<Money>) takeMoney:(Money *) other;

-(id<Money>) reduceToCurrency: (NSString *) currency
                   withBroker:(Broker *) broker;

@end


@interface Money : NSObject<Money>

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *currency;
+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;
@end
