//
//  POLWaletTableViewController.h
//  Wallet
//
//  Created by Pawel Walicki on 6/6/15.
//  Copyright (c) 2015 Pawel Walicki. All rights reserved.
//

#import <UIKit/UIKit.h>
@class POLWallet;
@interface POLWaletTableViewController : UITableViewController

-(id) initWithModel:(POLWallet*) model;

@end
