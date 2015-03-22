//
//  TipCalc.h
//  TipCalc
//
//  Created by Murali Korukonda on 6/5/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipCalc : NSObject

@property (assign) float amountBeforeTax;
@property (assign) float tipPercentage;
@property (assign) float taxPercentage;
@property  (assign,readonly)float tipAmount;
@property  (assign,readonly)float taxAmount;
@property  (assign,readonly)float totalAmount;

-(id) initWithAmountBeforeTax:(float)amountBeforeTax andTipPercentage:(float)tipPercentage andTaxPercentage:(float)taxPercentage;
-(void)calculateTip;

@end
