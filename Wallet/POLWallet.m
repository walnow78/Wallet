//
//  POLWallet.m
//  Wallet
//
//  Created by Pawel Walicki on 6/6/15.
//  Copyright (c) 2015 Pawel Walicki. All rights reserved.
//

#import "POLWallet.h"

@interface POLWallet ()

@property(nonatomic,strong) NSMutableArray *moneys;

@end

@implementation POLWallet


-(NSUInteger)countCurrencies {
    
    NSSet *currencies = [NSSet setWithArray:[self.moneys valueForKey:@"currency"]];
    
    return [currencies count];
}


-(NSUInteger)countEuros {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"currency like %@", @"EUR"];
    
    NSArray *euros = [self.moneys filteredArrayUsingPredicate:predicate];
    
    return [euros count];
}


-(NSUInteger)countDollars {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"currency like %@", @"USD"];
    
    NSArray *dollars = [self.moneys filteredArrayUsingPredicate:predicate];
    
    return [dollars count];
}

-(id) initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    
    if (self = [super init]) {
        POLMoney *money = [[POLMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    
    return self;
}

-(id<POLMoney>)plus:(POLMoney*) money{
    
    [self.moneys addObject:money];
    
    return self;
}

-(id<POLMoney>) times:(NSInteger) multiplier{
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity: self.moneys.count];
    
    for (POLMoney *each in self.moneys) {
        POLMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    
    self.moneys = newMoneys;
    
    return self;
    
}

-(POLMoney*) reduceToCurrency:(NSString*) currency withBroker:(POLBroker*) broker{
    
    POLMoney *result = [[POLMoney alloc] initWithAmount:0 currency:currency];
    
    for (POLMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    
    return result;
}

@end

