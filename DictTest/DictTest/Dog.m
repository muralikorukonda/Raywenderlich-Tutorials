//
//  Dog.m
//  DictTest
//
//  Created by Main Account on 1/9/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (instancetype)initWithName:(NSString *)name description:(NSString *)description {
    self = [super init];
    if (self) {
        _name = name;
        _description = description;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    Dog * copy = [[Dog alloc] initWithName:self.name description:self.description];
    return copy;
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToDog:other];
}

- (BOOL)isEqualToDog:(Dog *)other {
    if (self == other) {
        return YES;
    }
    if (!other) {
        return NO;
    }
    
    BOOL equalNames = (!self.name && !other.name) || [self.name isEqualToString:other.name];
    BOOL equalDescriptions = (!self.description && !other.description) || [self.description isEqualToString:other.description];
    
    return equalNames && equalDescriptions;
}

- (NSUInteger)hash {
    NSUInteger result = 1;
    NSUInteger prime = 31;
    result = prime * result + [self.name hash];
    result = prime * result + [self.description hash];
    return result;
}

@end
