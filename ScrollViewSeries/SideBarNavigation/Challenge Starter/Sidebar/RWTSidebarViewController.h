//
//  RWTSidebarViewController.h
//  Sidebar
//
//  Created by Main Account on 4/30/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWTSidebarViewController : UIViewController

- (instancetype)initWithLeftViewController:(UIViewController *)leftViewController mainViewController:(UIViewController *)mainViewController rightViewController:(UIViewController *)rightViewController gap:(NSInteger)gap;
- (void)toggleMenu;

@end
