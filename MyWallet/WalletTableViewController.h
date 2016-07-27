//
//  WalletTableViewController.h
//  MyWallet
//
//  Created by Verónica Cordobés on 25/7/16.
//  Copyright © 2016 Verónica Cordobés. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wallet;

@interface WalletTableViewController : UITableViewController

-(id)initWithModel:(Wallet *) model;

@end
