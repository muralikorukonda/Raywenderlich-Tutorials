//
//  Dog.h
//  DictTest
//
//  Created by Main Account on 1/9/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject <NSCopying>

- (instancetype)initWithName:(NSString *)name description:(NSString *)description;

@property (copy, nonatomic, readonly) NSString *name;
@property (copy, nonatomic, readonly) NSString *description;

@end
