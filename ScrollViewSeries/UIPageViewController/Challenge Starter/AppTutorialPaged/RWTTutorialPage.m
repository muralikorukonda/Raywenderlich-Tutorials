//
//  RWTTutorialPage.m
//  AppTutorialPaged
//
//  Created by Main Account on 4/23/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTTutorialPage.h"

@implementation RWTTutorialPage

- (instancetype)initWithIndex:(int)index text:(NSString *)text {
  self = [super init];
  if (self) {
    _index = index;
    _text = text;
  }
  return self;
}

- (UIImage *)bgImage {
  return [UIImage imageNamed:[NSString stringWithFormat:@"bg_%d", self.index + 1]];
}

- (UIImage *)iconImage {
  return [UIImage imageNamed:[NSString stringWithFormat:@"icon_%d", self.index + 1]];
}

+ (NSArray *)allPages {
  
  RWTTutorialPage *page0 = [[RWTTutorialPage alloc] initWithIndex:0 text:@"PetShare is a pet photo sharing community."];
  RWTTutorialPage *page1 = [[RWTTutorialPage alloc] initWithIndex:1 text:@"Take pictures of your pet, and add filters or clipart to help them shine."];
  RWTTutorialPage *page2 = [[RWTTutorialPage alloc] initWithIndex:2 text:@"Share your photos via Facebook, email, Twitter, or instant message."];
  RWTTutorialPage *page3 = [[RWTTutorialPage alloc] initWithIndex:3 text:@"Rate other photos, give hearts, and follow pets you adore!"];
  RWTTutorialPage *page4 = [[RWTTutorialPage alloc] initWithIndex:4 text:@"Set up a profile for your pet, show past photos, and let fans follow."];
  return @[page0, page1, page2, page3, page4];
  
}

@end
