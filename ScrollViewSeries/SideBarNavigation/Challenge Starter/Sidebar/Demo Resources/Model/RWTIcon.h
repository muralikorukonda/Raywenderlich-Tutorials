//
//  RWTIcon.h
//  WinterIcons
//
//  Created by Main Account on 2/10/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RWTRatingType) {
  RWTRatingTypeUnrated,
  RWTRatingTypeUgly,
  RWTRatingTypeOK,
  RWTRatingTypeNice,
  RWTRatingTypeAwesome
};

@interface RWTIcon : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) UIImage *image;
@property (assign) RWTRatingType rating;

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle imageName:(NSString *)imageName;

@end
