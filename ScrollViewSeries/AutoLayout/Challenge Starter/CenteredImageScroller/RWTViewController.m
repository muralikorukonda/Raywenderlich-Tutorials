//
//  RWTViewController.m
//  CenteredImageScroller
//
//  Created by Main Account on 4/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTViewController.h"
#import "RWTCenteredImageScrollView.h"

@interface RWTViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation RWTViewController

- (void)viewDidLoad {

  self.scrollView = [[RWTCenteredImageScrollView alloc] initWithFrame:self.view.bounds];
  self.scrollView.backgroundColor = [UIColor blackColor];
  self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:self.scrollView];
  
  NSDictionary *viewsDictionary = @{@"scrollView": self.scrollView};
  
  NSArray *horzConstriants = [NSLayoutConstraint constraintsWithVisualFormat:@"|[scrollView]|" options:0 metrics:nil views:viewsDictionary];
  [self.view addConstraints:horzConstriants];
  
  NSArray *vertConstriants = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:viewsDictionary];
  [self.view addConstraints:vertConstriants];
  
//  self.scrollView.delegate = self;
//  
//  static CGFloat kLineWidth = 2.f;
//  UIView *vertLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds), 0, kLineWidth, CGRectGetHeight(self.view.bounds))];
//  vertLine.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
//  vertLine.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
//  [self.view addSubview:vertLine];
//
//  UIView *horzLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.view.bounds), CGRectGetWidth(self.view.bounds), kLineWidth)];
//  horzLine.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
//  horzLine.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//  [self.view addSubview:horzLine];
  
}

@end
