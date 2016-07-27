//
//  Broker.m
//  MyWallet
//
//  Created by Verónica Cordobés on 23/7/16.
//  Copyright © 2016 Verónica Cordobés. All rights reserved.
//

#import "Broker.h"
#import "Money.h"



@implementation Broker

-(id)init{
    if(self = [super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(Money *) reduce: (id<Money>) money toCurrency:(NSString *) currency{
    
    //double dispatch
    return [money reduceToCurrency:currency
                        withBroker:self];
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency: fromCurrency toCurrency: toCurrency]];
    NSNumber *invRate = @(1.0/rate);
    [self.rates setObject: invRate
                   forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}

#pragma mark - Utils
-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency{
    return [NSString stringWithFormat:@"%@, %@", fromCurrency, toCurrency];
}


#pragma mark - Rates
-(void) parseJSONRates:(NSData *) json{
    
    NSError *err = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:json
                                             options:NSJSONReadingAllowFragments
                                               error:&err];
    
    if(obj != nil){
        //Pillamos los rates y los vamos añadiendo al broker
        
    }else{
        //No hemos recibido nada
        [NSException raise:@"NoRatesException"
                    format:@"JSON must carry some data!"];
    }
}

@end
