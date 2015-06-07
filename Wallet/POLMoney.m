//
//  POLMoney.m
//  Wallet
//
//  Created by Pawel Walicki on 6/6/15.
//  Copyright (c) 2015 Pawel Walicki. All rights reserved.
//

#import "POLMoney.h"
#import "POLBroker.h"

@interface POLMoney ()
@property (nonatomic, strong) NSNumber *amount;
@end

@implementation POLMoney

+(instancetype) euroWithAmount:(NSInteger) amount{
    
    POLMoney *euro = [[POLMoney alloc] initWithAmount:amount
                                             currency:@"EUR"];
    return euro;
    
}

+(instancetype) dollarWithAmount:(NSInteger) amount{
    
    POLMoney *dollar = [[POLMoney alloc] initWithAmount:amount
                                               currency:@"USD"];
    return dollar;
}



-(id) initWithAmount:(NSInteger)amount
            currency:(NSString *)currency{
    
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    
    return self;
    
}

-(id<POLMoney>) times:(NSInteger)multiplier{
    
    POLMoney *newMoney = [[POLMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
    
    return newMoney;
}

-(id<POLMoney>) plus:(POLMoney*) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    POLMoney *total = [[POLMoney alloc] initWithAmount:totalAmount currency:self.currency];
    
    return total;
    
}

-(id<POLMoney>) reduceToCurrency:(NSString*) currency withBroker:(POLBroker*) broker{
    
    // Comprobamos si la divisa de origen y destino son las mismas
    
    POLMoney *result;
    
    double rate = [[broker.rates objectForKey:[broker keyfromCurrency:self.currency toCurrency:currency]] doubleValue];
    
    if ([self.currency isEqual:currency]) {
        result = self;
    }else if(rate == 0){
        
        // No tenemos tasa de conversión
        
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", self.currency, currency];
        
    }else{
        
        double rate = [[broker.rates objectForKey:[broker keyfromCurrency:self.currency toCurrency:currency]] doubleValue];
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[POLMoney alloc] initWithAmount:newAmount currency:currency];
    }
    return result;
    
}

#pragma mark - Overwritten

-(NSString*) description{
    
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], self.currency, self.amount];
    
}


#pragma mark - Equality
-(BOOL)isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency]]) {
        return [self amount] == [object amount];
    }else{
        return NO;
    }
}


-(NSUInteger) hash{
    return [self.amount integerValue];
}




@end
