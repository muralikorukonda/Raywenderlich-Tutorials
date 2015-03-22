//
//  RWTPageViewController.m
//  AppTutorialPaged
//
//  Created by Main Account on 4/30/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTPageViewController.h"
#import "RWTTutorialStepViewController.h"
#import "RWTTutorialPage.h"

@interface RWTPageViewController () <UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (nonatomic, strong) NSArray *pages;
@property (nonatomic,strong) UIPageControl *pageCtrl;

@end

@implementation RWTPageViewController

- (void)viewDidLoad {
    
    self.pages = [RWTTutorialPage allPages];
    RWTTutorialStepViewController *stepVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RWTTutorialStepViewController"];
    stepVC.page = self.pages[0];
    
    [self setViewControllers:@[stepVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.dataSource = self;
    self.delegate = self;
    
    self.pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(40, 520, 240, 20)];
    self.pageCtrl.numberOfPages = self.pages.count;
    self.pageCtrl.currentPage = 0;
    [self.view addSubview:self.pageCtrl];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    RWTTutorialStepViewController *oldVC = (RWTTutorialStepViewController *)viewController;
    int newIndex = oldVC.page.index + 1;
    if (newIndex > self.pages.count - 1) return nil;
    
    RWTTutorialStepViewController *newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RWTTutorialStepViewController"];
    newVC.page = self.pages[newIndex];
    return newVC;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    RWTTutorialStepViewController *oldVC = (RWTTutorialStepViewController *)viewController;
    int newIndex = oldVC.page.index - 1;
    if (newIndex < 0) return nil;
    
    RWTTutorialStepViewController *newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RWTTutorialStepViewController"];
    newVC.page = self.pages[newIndex];
    return newVC;
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    //return self.pages.count;
    return 0;
}
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    RWTTutorialStepViewController *vc = (RWTTutorialStepViewController *)pageViewController.viewControllers[0];
    return vc.page.index;
}

-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    RWTTutorialStepViewController *vc = (RWTTutorialStepViewController *)pageViewController.viewControllers[0];
    self.pageCtrl.currentPage = vc.page.index;
}


@end
