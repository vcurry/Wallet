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
    self.wallet = nil;
}

-(void) testThatTextOnLabelIsEqualToTextOnButton{
    //Mandamos el mensaje
    [self.simpleVC displayText:self.button];
    //Comprobamos que la etiqueta y el botón tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button amd label should have the same text");
}

/**
-(void) testThatTableHasOneSection{
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections, 1, @"There can only be one section");
    
}
 */

/*
 * Modificamos el test para que teste que cada sección tendrá una celda
 * por cada money de esa divisa +1
 */
-(void) testThatNumberOfCellsIsNumberOfMoneysPlusOne{
    UITableView *tV = [[UITableView alloc] init];
    XCTAssertEqual([self.walletVC tableView:tV numberOfRowsInSection:0],
                   [self.wallet countOfCurrency:0] +1,
                   @"Number of cells is the number of moneys plus 1 (the total)");
}

-(void) testThatLastSectionhasOnlyOneCell{
    UITableView *tV = [[UITableView alloc] init];
    XCTAssertEqual([self.walletVC tableView:tV numberOfRowsInSection:[self.wallet numberOfCurrencies]+1], 1,
                   @"Last section should contain just one row (total)");
}

/*
 * Si hay n divisas en el modelo, el dataSource devuelve n+1 secciones
 */
-(void) testThatNumberOfSectionsIsNumberOfEachMoneyPlusOne{
    UITableView *tV = [[UITableView alloc] init];
    XCTAssertEqual([self.wallet numberOfCurrencies] + 1,
                   [self.walletVC numberOfSectionsInTableView:tV],
                   @"Number of sections is the number of currencies plus 1 (the total)");
}

@end
