//
//  POLBroker.m
//  Wallet
//
//  Created by Pawel Walicki on 6/6/15.
//  Copyright (c) 2015 Pawel Walicki. All rights reserved.
//

#import "POLBroker.h"

@interface POLBroker ()

@end

@implementation POLBroker

- (instancetype)init{
    
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    
    return self;
}

-(POLMoney*) reduce:(id<POLMoney>) money toCurrency:(NSString*) currency{
    return [money reduceToCurrency:currency withBroker:self];
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString*)toCurrency{
    
    [self.rates setObject:@(rate) forKey:[self keyfromCurrency:fromCurrency toCurrency:toCurrency]];
    
    [self.rates setObject:@(1.0/rate) forKey:[self keyfromCurrency:toCurrency toCurrency:fromCurrency]];
}

#pragma mark - Utils

-(NSString*) keyfromCurrency:(NSString*) fromCurrency toCurrency:(NSString*) toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

@end
