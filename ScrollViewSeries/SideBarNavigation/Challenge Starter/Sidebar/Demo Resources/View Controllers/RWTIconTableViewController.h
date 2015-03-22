//
//  RWTIconTableViewController.h
//  Sidebar
//
//  Created by Main Account on 4/23/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RWTIconTableViewController;

@protocol RWTIconTableViewControllerDelegate <NSObject>
- (void)iconTableViewControllerDidTapMenuButton:(RWTIconTableViewController *)controller;
@end

@interface RWTIconTableViewController : UITableViewController

@property (nonatomic, assign) int iconSetIndex;
@property (nonatomic, assign) id <RWTIconTableViewControllerDelegate> delegate;

@end
