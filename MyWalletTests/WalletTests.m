//
//  WalletTests.m
//  MyWallet
//
//  Created by Verónica Cordobés on 24/7/16.
//  Copyright © 2016 Verónica Cordobés. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"
#import "Broker.h"
#import "Wallet.h"

@interface WalletTests : XCTestCase
@property (nonatomic,strong) Wallet *wallet;
@end

@implementation WalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _wallet = [[Wallet alloc] initWithAmount:40 currency:@"EUR"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    _wallet = nil;
}

//€40 + $20 = $100 2:1
-(void) testAdditionWithReduction{
    Broker *broker = [Broker new];
    [broker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    [_wallet plus: [Money dollarWithAmount:20]];
    
    Money *reduced = [broker reduce:_wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [Money dollarWithAmount:100], @"€40 + $20 = $100 2:1");
    
}

//Comprueba que se añaden los billetes a wallet
-(void) testPlusInWallet{
    [_wallet plus:[Money euroWithAmount:20]];
    [_wallet plus:[Money dollarWithAmount:30]];
    XCTAssertEqual(_wallet.count, 3, @"Adding money to wallet");
}

//No se pueden sacar billetes que no estén en wallet
-(void) testOnlyExistingMoneyCanBeRemoved{
    [_wallet takeMoney:[Money dollarWithAmount:20]];
    XCTAssertEqual(_wallet.count,1, @"Can't remove money that is not in the wallet");
    [_wallet takeMoney:[Money euroWithAmount:40]];
    XCTAssertEqual(_wallet.count,0, @"Can't remove money that is not in the wallet");
}

-(void) testSubtotalIsRight {
    [_wallet plus:[Money euroWithAmount:1]];
    XCTAssertEqual([_wallet addCurrencyMoneys:@"EUR"], 41, @"Subtotal must be the addition of all currency's moneys");
}

@end
