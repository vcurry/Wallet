//
//  ControllersTests.m
//  MyWallet
//
//  Created by Verónica Cordobés on 25/7/16.
//  Copyright © 2016 Verónica Cordobés. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleViewController.h"
#import "WalletTableViewController.h"
#import "Wallet.h"

@interface ControllersTests : XCTestCase
@property (nonatomic,strong) SimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) WalletTableViewController *walletVC;
@property (nonatomic,strong) Wallet *wallet;
@end

@implementation ControllersTests

- (void)setUp {
    [super setUp];
    // Creamos el entorno de laboratorio
    self.simpleVC = [[SimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    self.wallet = [[Wallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[Money euroWithAmount:1]];
    self.walletVC = [[WalletTableViewController alloc] initWithModel: self.wallet];
}

- (void)tearDown {
    // Lo destruimos
    [super tearDown];
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

-(void) testThatTextOnLabelIsEqualToTextOnButton{
    //Mandamos el mensaje
    [self.simpleVC displayText:self.button];
    //Comprobamos que la etiqueta y el botón tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button amd label should have the same text");
}

-(void) testThatTableHasOneSection{
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections, 1, @"There can only be one section");
    
}

-(void) testThatNumberOfCellsIsNumberOfMoneysPlusOne{
    
    XCTAssertEqual(self.wallet.count + 1,
                   [self.walletVC tableView:nil numberOfRowsInSection:0],
                   @"Number of cells is the number of moneys plus 1 (the total)");
}

@end
