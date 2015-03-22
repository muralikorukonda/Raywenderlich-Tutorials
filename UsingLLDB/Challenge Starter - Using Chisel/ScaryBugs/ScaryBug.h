//
//  ScaryBug.h
//  ScaryBugs
//
//  Created by Main Account on 10/31/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBug : NSObject <NSCoding>

@property (strong) NSString * name;
@property (retain) UIImage * image;
@property (assign) float howScary;

- (id)initWithName:(NSString *)name image:(UIImage *)image howScary:(float)howScary;

@end