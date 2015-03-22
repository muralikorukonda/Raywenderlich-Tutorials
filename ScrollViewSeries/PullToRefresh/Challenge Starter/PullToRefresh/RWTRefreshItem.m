//
//  RWTRefreshItem.m
//  PullToRefresh
//
//  Created by Main Account on 5/1/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTRefreshItem.h"

@interface RWTRefreshItem()
@property (nonatomic, assign) CGPoint centerStart;
@property (nonatomic, assign) CGPoint centerEnd;
@end

@implementation RWTRefreshItem

- (id)initWithView:(UIView *)view centerEnd:(CGPoint)centerEnd parallaxRatio:(float)parallaxRatio sceneHeight:(CGFloat)sceneHeight {

  self = [super init];
  if (self) {
    _centerEnd = centerEnd;
    _centerStart = CGPointMake(centerEnd.x, centerEnd.y + (parallaxRatio * sceneHeight));
    _view = view;
    _view.center = _centerStart;
  }
  return self;  
}

- (void)centerForProgress:(CGFloat)progress {
  self.view.center = CGPointMake(self.centerStart.x + ((self.centerEnd.x - self.centerStart.x) * progress), self.centerStart.y + ((self.centerEnd.y - self.centerStart.y) * progress));
}

@end
