//
//  RWTRefreshView.h
//  PullToRefresh
//
//  Created by Main Account on 5/1/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RWTRefreshItem;
@class RWTRefreshView;

@protocol RWTRefreshViewDelegate <NSObject>
- (void)refreshViewDidRefresh:(RWTRefreshView *)refreshView;
@end

@interface RWTRefreshView : UIView <UIScrollViewDelegate>

@property (nonatomic, weak) id <RWTRefreshViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView;
- (void)beginRefreshing;
- (void)endRefreshing;

@end
