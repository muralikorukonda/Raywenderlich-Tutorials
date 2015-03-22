//
//  DateCalculator.m
//  DateCalculator
//
//  Created by Main Account on 12/6/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "DateCalculator.h"

@implementation DateCalculator {
    float _hisAge;
}

- (void)setHisAge:(float)hisAge {
    _hisAge = hisAge;
}

- (float)hisAge {
    return _hisAge;
}

- (BOOL)shouldHeDateIfHerAgeIs:(float)herAge {
    float minAgeToDate = _hisAge / 2 + 7;
    return herAge > minAgeToDate;
}

@end
