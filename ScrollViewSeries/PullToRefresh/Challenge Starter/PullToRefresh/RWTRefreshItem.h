//
//  RWTRefreshItem.h
//  PullToRefresh
//
//  Created by Main Account on 5/1/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWTRefreshItem : NSObject

- (id)initWithView:(UIView *)view centerEnd:(CGPoint)centerEnd parallaxRatio:(float)parallaxRatio sceneHeight:(CGFloat)sceneHeight;
- (void)centerForProgress:(CGFloat)progress;

@property (nonatomic, weak) UIView *view;

@end
