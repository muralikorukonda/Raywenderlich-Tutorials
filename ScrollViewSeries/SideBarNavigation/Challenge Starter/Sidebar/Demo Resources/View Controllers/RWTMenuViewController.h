//
//  RWTMenuViewController.h
//  Sidebar
//
//  Created by Main Account on 4/23/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RWTMenuViewController;

@protocol RWTMenuViewControllerDelegate <NSObject>

- (void)menuViewControllerDidTapSummer:(RWTMenuViewController *)controller;
- (void)menuViewControllerDidTapWinter:(RWTMenuViewController *)controller;

@end

@interface RWTMenuViewController : UITableViewController

@property (nonatomic, assign) id <RWTMenuViewControllerDelegate> delegate;

@end
