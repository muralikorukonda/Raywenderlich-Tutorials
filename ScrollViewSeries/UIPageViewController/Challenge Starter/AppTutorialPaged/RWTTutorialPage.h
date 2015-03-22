//
//  RWTTutorialPage.h
//  AppTutorialPaged
//
//  Created by Main Account on 4/23/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWTTutorialPage : NSObject

@property (nonatomic, assign) int index;
@property (nonatomic, strong) NSString *text;

- (instancetype)initWithIndex:(int)index text:(NSString *)text;
- (UIImage *)bgImage;
- (UIImage *)iconImage;
+ (NSArray *)allPages;

@end
