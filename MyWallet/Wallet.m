//
//  Wallet.m
//  MyWallet
//
//  Created by Verónica Cordobés on 24/7/16.
//  Copyright © 2016 Verónica Cordobés. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Wallet.h"

@interface Wallet()
@property (nonatomic,strong) NSMutableArray *moneys;
@property (nonatomic,strong) NSMutableArray *currencies;
@end

@implementation Wallet

-(NSUInteger) count{
    return [self.moneys count];
}

/*
 * Creamos otro count para que devuelva el número de moneys
 * de cada divisa
 */
-(NSUInteger) countOfCurrency:(NSInteger) index{
    NSString *currencyAtIndex = [self.currencies objectAtIndex:index];
    NSUInteger countOfMoneys = 0;
    for(Money *each in self.moneys){
        if([each.currency isEqual:currencyAtIndex]){
            countOfMoneys += 1;
        }
    }
    return countOfMoneys;
}

-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if(self= [super init]){
        Money *money = [[Money alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject: money];
    }
    
    return self;
}

-(id<Money>) plus:(Money *)other{
    [self.moneys addObject:other];
    return self;
}

-(id<Money>) takeMoney:(Money *)money{
    for(Money *each in self.moneys){
        if([each isEqual:money]){
            [self.moneys removeObject:each];
        }
    }
    return self;
}

-(NSUInteger) addCurrencyMoneys:(NSString *) currency{
    NSUInteger total = 0;
    for(Money *each in self.moneys){
        if([each.currency isEqual:currency]){
            total += [each.amount integerValue];
        }
    }
    
    return total;
}

/*
 * Número de diferentes divisas que hay en moneys
 */
-(NSUInteger) numberOfCurrencies{
    self.currencies = [NSMutableArray array];
    for(Money *each in self.moneys){
        if (![self.currencies containsObject:each.currency]){
            [self.currencies addObject:each.currency];
        }
    }
    return self.currencies.count;
}

-(id<Money>) times:(NSInteger)multiplier{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for(Money *each in self.moneys){
        Money *newMoney = [each times: multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

-(id<Money>) reduceToCurrency:(NSString *)currency
                   withBroker:(Broker *)broker{

    Money *result = [[Money alloc] initWithAmount:0 currency:currency];
    for(Money *each in self.moneys){
        result = [result plus: [each reduceToCurrency:currency withBroker:broker]];
    }
    return result;

}

#pragma mark - Notifications
-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc{
    
    [nc addObserver: self
           selector: @selector(dumpToDisk:)
               name: UIApplicationDidReceiveMemoryWarningNotification
             object: nil];
}

-(void) dumpToDisk:(NSNotification *) notification{
    
}

@end
