//
//  State.m
//  ChallengeStarter
//
//  Created by Brian Douglas Moakley on 2/1/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "State.h"

@implementation State
{
    NSString *_name;
}

+ (instancetype)createState:(NSString *)name
{
    if ([name isEqualToString:@"California"] ||
        [name isEqualToString:@"Oregon"] ||
        [name isEqualToString:@"Washington"] ||
        [name isEqualToString:@"Alaska"] ||
        [name isEqualToString:@"Hawaii"])
    {
        return [[PacificState alloc] initWithName:name];
    }
    else if ([name isEqualToString:@"New Jersey"] ||
             [name isEqualToString:@"Maine"] ||
             [name isEqualToString:@"Virginia"] ||
             [name isEqualToString:@"Maryland"] ||
             [name isEqualToString:@"Deleware"] ||
             [name isEqualToString:@"Connecticut"] ||
             [name isEqualToString:@"Rhode Island"] ||
             [name isEqualToString:@"New York"] ||
             [name isEqualToString:@"North Carolina"] ||
             [name isEqualToString:@"South Carolina"] ||
             [name isEqualToString:@"New Hampshire"] ||
             [name isEqualToString:@"Massachusets"] ||
             [name isEqualToString:@"Florida"] ||
             [name isEqualToString:@"Georgia"]
             )
    {
        return [[AtlanticState alloc] initWithName:name];
    }
    else if ( [name isEqualToString: @"Arizona"] || [name isEqualToString: @"Arkansas"] || [name isEqualToString: @"Colorado"]
             || [name isEqualToString: @"Idaho"] || [name isEqualToString: @"Illinois"] || [name isEqualToString: @"Indiana"]
             || [name isEqualToString: @"Iowa"] || [name isEqualToString: @"Kansas"] || [name isEqualToString: @"Kentucky"]
             || [name isEqualToString: @"Louisiana"] || [name isEqualToString: @"Michigan"] || [name isEqualToString: @"Minnesota"]
             || [name isEqualToString: @"Mississippi"] || [name isEqualToString: @"Misouri"] || [name isEqualToString: @"Montana"]
             || [name isEqualToString: @"Nevada"] || [name isEqualToString: @"Nebraska"] || [name isEqualToString: @"New Mexico"]
             || [name isEqualToString: @"North Dakota"] || [name isEqualToString: @"Ohio"] || [name isEqualToString: @"Oklahoma"]
             || [name isEqualToString: @"Pennsylvania"] || [name isEqualToString: @"South Dakota"] || [name isEqualToString: @"Tennessee"]
             || [name isEqualToString: @"Texas"] || [name isEqualToString: @"Utah"]
             || [name isEqualToString: @"Vermont"] || [name isEqualToString: @"Washington"] || [name isEqualToString: @"West Virginia"]
             || [name isEqualToString: @"Wisconsin"] || [name isEqualToString: @"Wyoming"]
        ) {
        return [[LandLockedState alloc] initWithName:name];
    }
    else
        return [[State alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name
{
    if(self = [super init])
    {
        _name = name;
    }
    return self;
}

- (NSString *)description
{
    return _name;
}

- (NSString *)getBorderingOcean
{
    return nil;
}
@end


@implementation AtlanticState

- (NSString *)getBorderingOcean
{
    return @"Atlantic";
}

@end

@implementation PacificState

- (NSString *)getBorderingOcean
{
    return @"Pacific";
}
@end

@implementation LandLockedState

- (NSString *)getBorderingOcean
{
    return @"None";
}

@end