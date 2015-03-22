//
//  RWTSidebarViewController.m
//  Sidebar
//
//  Created by Main Account on 4/30/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTSidebarViewController.h"

@interface RWTSidebarViewController ()

@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, strong) UIViewController *mainViewController;
@property (nonatomic, strong) UIViewController *rightViewController;
@property (nonatomic, assign) NSInteger gap;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) BOOL firstTime;

@end

@implementation RWTSidebarViewController

- (instancetype)initWithLeftViewController:(UIViewController *)leftViewController mainViewController:(UIViewController *)mainViewController rightViewController:(UIViewController *)rightViewController gap:(NSInteger)gap{
    self = [super init];
    if (self) {
        _leftViewController = leftViewController;
        _mainViewController = mainViewController;
        _rightViewController = rightViewController;
        _gap = gap;
        _firstTime = YES;
        
        self.view.backgroundColor = [UIColor blackColor];
        [self setupScrollView];
        [self setupViewControllers];
        
    }
    return self;
}


- (void)addViewController:(UIViewController *)viewController {
    viewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:viewController.view];
    [self addChildViewController:viewController];
    [viewController didMoveToParentViewController:viewController];
    [self shadowView:viewController.view];
}

- (void)setupViewControllers {
    
    [self addViewController:self.leftViewController];
    [self addViewController:self.mainViewController];
    [self addViewController:self.rightViewController];
    
    NSDictionary *viewsDictionary = @{@"leftView": self.leftViewController.view, @"mainView": self.mainViewController.view, @"outerView": self.view,@"rightView":self.rightViewController.view};
    /*
     NSArray *horzConstriants = [NSLayoutConstraint constraintsWithVisualFormat:@"|[leftView][mainView(==outerView)]|" options:0 metrics:nil views:viewsDictionary];
     [self.view addConstraints:horzConstriants];
     
     NSArray *leftViewVertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[leftView(==outerView)]|" options:0 metrics:nil views:viewsDictionary];
     [self.view addConstraints:leftViewVertConstraints];
     
     NSArray *mainViewVertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[mainView(==outerView)]|" options:0 metrics:nil views:viewsDictionary];
     [self.view addConstraints:mainViewVertConstraints];
     
     NSLayoutConstraint *leftViewWidth = [NSLayoutConstraint constraintWithItem:self.leftViewController.view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:-self.gap];
     [self.view addConstraint:leftViewWidth];*/
    
    NSArray *horzConstriants = [NSLayoutConstraint constraintsWithVisualFormat:@"|[leftView][mainView(==outerView)][rightView]|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:horzConstriants];
    
    NSArray *leftViewVertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[leftView(==outerView)]|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:leftViewVertConstraints];
    NSArray *rightViewVertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rightView(==outerView)]|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:rightViewVertConstraints];
    
    
    NSArray *mainViewVertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[mainView(==outerView)]|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:mainViewVertConstraints];
    
    NSLayoutConstraint *leftViewWidth = [NSLayoutConstraint constraintWithItem:self.leftViewController.view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:-self.gap];
    [self.view addConstraint:leftViewWidth];
    
    NSLayoutConstraint *rightViewWidth = [NSLayoutConstraint constraintWithItem:self.rightViewController.view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:-self.gap];
    [self.view addConstraint:rightViewWidth];
    
    
    
}

- (void)setupScrollView {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    NSDictionary *viewsDictionary = @{@"scrollView": self.scrollView};
    
    NSString *format = @"|[scrollView]|";
    NSArray *horzConstraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:horzConstraints];
    
    NSArray *vertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:vertConstraints];
    
    NSLayoutConstraint *scrollViewWidth = [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:-self.gap];
    [self.view addConstraint:scrollViewWidth];
    self.scrollView.clipsToBounds = NO;
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, -self.gap);
    [self.view addConstraint:scrollViewWidth];
    
    
    UITapGestureRecognizer *tapRecognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(viewTapped:)];
    tapRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapRecognizer];
    
    [self.view addGestureRecognizer:self.scrollView.panGestureRecognizer];
}

- (BOOL)isOpen {
    CGPoint contentOffset = self.scrollView.contentOffset;
    return contentOffset.x == 0 || contentOffset.x > CGRectGetWidth(self.scrollView.bounds);
}

- (void)closeMenuAnimated:(BOOL)animated {
    CGPoint contentOffset = self.scrollView.contentOffset;
    contentOffset.x = CGRectGetWidth(self.view.bounds) - self.gap;
    [self.scrollView setContentOffset:contentOffset animated:animated];
}

- (void)openMenuAnimated:(BOOL)animated {
    [self.scrollView setContentOffset:CGPointZero animated:animated];
}

- (void)toggleMenu {
    if ([self isOpen]) {
        [self closeMenuAnimated:YES];
    } else {
        [self openMenuAnimated:YES];
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (self.firstTime) {
        self.firstTime = NO;
        [self closeMenuAnimated:NO];
    }
    
}

- (void)shadowView:(UIView *)view {
    view.layer.shadowPath = [UIBezierPath
                             bezierPathWithRect:self.mainViewController.view.bounds].CGPath;
    view.layer.shadowRadius = 2.5f;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowOpacity = 1.f;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
}

- (void)viewTapped:(UITapGestureRecognizer *)tapRecognizer {
    [self toggleMenu];
}

- (void)mainViewTapped:(UITapGestureRecognizer *)tapRecognizer {
    [self toggleMenu];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint tapLocation = [touch locationInView:self.scrollView];
    CGFloat leftX = CGRectGetWidth(self.view.bounds) - self.gap;
    CGFloat rightX = leftX + CGRectGetWidth(self.view.bounds);
    BOOL inGap = tapLocation.x >= leftX && tapLocation.x <= rightX;
    BOOL isOpen = [self isOpen];
    return inGap && isOpen;
}

@end
