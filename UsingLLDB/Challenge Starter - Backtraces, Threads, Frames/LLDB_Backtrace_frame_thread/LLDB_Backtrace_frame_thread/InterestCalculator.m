//
//  InterestCalculator.m
//  LLDB_Backtrace_frame_thread
//
//  Created by Brian Moakley on 4/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "InterestCalculator.h"

@implementation InterestCalculator

-(float) calculateInterest
{
    double i = self.rate / 12;
    double m = [self convertYearToMonths:self.time];
    double r = (pow(i+1.0, -m)-1) * -1 / i;
    return self.principal / r;
}

-(int) convertYearToMonths: (int) year
{
    int months = 0; //  change using: expr months=12 while debug
    return year * months;
}

@end
