//
//  POLBroker.h
//  Wallet
//
//  Created by Pawel Walicki on 6/6/15.
//  Copyright (c) 2015 Pawel Walicki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "POLMoney.h"

@interface POLBroker : NSObject

@property(nonatomic,strong) NSMutableDictionary *rates;

-(POLMoney*) reduce:(id<POLMoney>) money
         toCurrency:(NSString*) currency;

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString*)toCurrency;

-(NSString*) keyfromCurrency:(NSString*) fromCurrency toCurrency:(NSString*) toCurrency;

@end