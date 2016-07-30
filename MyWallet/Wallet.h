//
//  Wallet.h
//  MyWallet
//
//  Created by Verónica Cordobés on 24/7/16.
//  Copyright © 2016 Verónica Cordobés. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Wallet : NSObject<Money>
@property (nonatomic,readonly) NSUInteger count;

-(NSUInteger) numberOfCurrencies;
-(NSUInteger) countOfCurrency:(NSInteger) index;
-(id<Money>) takeMoney:(Money *)money;
-(NSUInteger) addCurrencyMoneys:(NSString *) currency;
-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc;

@end
