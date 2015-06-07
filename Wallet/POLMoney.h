//
//  POLMoney.h
//  Wallet
//
//  Created by Pawel Walicki on 6/6/15.
//  Copyright (c) 2015 Pawel Walicki. All rights reserved.
//

#import <Foundation/Foundation.h>
@class POLMoney;
@class POLBroker;

@protocol POLMoney <NSObject>

-(id)initWithAmount:(NSInteger) amount currency: (NSString*) currency;

-(id<POLMoney>) times:(NSInteger) multiplier;

-(id<POLMoney>) plus:(POLMoney*) other;

-(id<POLMoney>) reduceToCurrency:(NSString*) currency withBroker:(POLBroker*) broker;

@end

@interface POLMoney : NSObject<POLMoney>

@property (copy, readonly) NSString *currency;
@property (nonatomic, strong, readonly) NSNumber *amount;

+(id) dollarWithAmount:(NSInteger) amount;
+(id) euroWithAmount:(NSInteger) amount;

@end

