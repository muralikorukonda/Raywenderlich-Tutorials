//
//  TemperatureConverter.h
//  Temperature
//
//  Created by Main Account on 12/6/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TemperatureConverter : NSObject

@property (strong, nonatomic) NSString *location;
@property (assign) float averageDegreesFarenheit;

- (float)degreesFarenheitToCelsius:(float)degreesFarenheit;
-(instancetype) initWithLocation:(NSString*)locationName;


@end
