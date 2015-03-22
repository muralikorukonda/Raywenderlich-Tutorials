//
//  TipCalc.m
//  TipCalc
//
//  Created by Murali Korukonda on 6/5/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import "TipCalc.h"

@implementation TipCalc

-(id)initWithAmountBeforeTax:(float)amountBeforeTax andTipPercentage:(float)tipPercentage andTaxPercentage:(float)taxPercentage{
    if ((self = [super init])) {
        self.amountBeforeTax = amountBeforeTax;
        self.tipPercentage = tipPercentage;
        self.taxPercentage = taxPercentage;
    }
    return self;
}

-(void)calculateTip{
    _taxAmount = self.amountBeforeTax * self.taxPercentage;
    _tipAmount = self.amountBeforeTax * self.tipPercentage;
    _totalAmount = self.amountBeforeTax + _taxAmount + _tipAmount;
}

@end
