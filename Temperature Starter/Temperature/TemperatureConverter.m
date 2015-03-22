//
//  TemperatureConverter.m
//  Temperature
//
//  Created by Main Account on 12/6/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "TemperatureConverter.h"

@implementation TemperatureConverter {
    float _totalDegreesFarenheit;
    float _numMeasurements;
}
-(instancetype) initWithLocation:(NSString*)locationName{
    if(self=[super init]){
        _location = locationName;
    }
    return self;
}

- (float)degreesFarenheitToCelsius:(float)degreesFarenheit {

    _totalDegreesFarenheit += degreesFarenheit;
    _numMeasurements++;
    _averageDegreesFarenheit = _totalDegreesFarenheit / _numMeasurements;

    return 5.0/9.0 * (degreesFarenheit - 32.0);
}

@end
