//
//  POLWallet.h
//  Wallet
//
//  Created by Pawel Walicki on 6/6/15.
//  Copyright (c) 2015 Pawel Walicki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "POLMoney.h"

@interface POLWallet : NSObject <POLMoney>

-(NSUInteger)countCurrencies;
-(NSUInteger)countEuros;
-(NSUInteger)countDollars;

@end
