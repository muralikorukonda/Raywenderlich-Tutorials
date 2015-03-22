//
//  RWTViewController.m
//  CenteredImageScroller
//
//  Created by Main Account on 4/26/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTViewController.h"
#import "RWTCenteredScrollView.h"

@interface RWTViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) RWTCenteredScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation RWTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zombies.jpg"]];
    
    self.scrollView = [[RWTCenteredScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.backgroundColor = [UIColor blackColor];
    self.scrollView.contentSize = self.imageView.bounds.size;
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.imageView];
    
    self.scrollView.delegate = self;
    
    
    static CGFloat kLineWidth = 2.f;
    UIView *vertLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds), 0, kLineWidth, CGRectGetHeight(self.view.bounds))];
    vertLine.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    vertLine.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:vertLine];
    
    UIView *horizLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.view.bounds), CGRectGetWidth(self.view.bounds),kLineWidth)];
    horizLine.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    horizLine.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:horizLine];
    
    
}



- (void)viewWillLayoutSubviews {
    
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

@end
