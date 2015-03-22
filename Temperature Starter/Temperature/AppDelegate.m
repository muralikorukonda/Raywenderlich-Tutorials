//
//  AppDelegate.m
//  Temperature
//
//  Created by Main Account on 12/6/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "TemperatureConverter.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    TemperatureConverter *converter = [[TemperatureConverter alloc] init];
//    converter.location = @"Virginia";

    TemperatureConverter *converter = [[TemperatureConverter alloc] initWithLocation:@"Virginia"];
    for (int i = 60; i <= 80; i+= 10) {
        float degreesCelsius = [converter degreesFarenheitToCelsius:i];
        NSLog(@"%0.2f degrees farenheit = %0.2f degrees celsius",
            (float)i, degreesCelsius);
    }
    
    NSLog(@"Average degrees farenheit in %@: %0.2f", converter.location, converter.averageDegreesFarenheit);
    
    return YES;
}

@end
