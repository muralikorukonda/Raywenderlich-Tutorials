//
//  RWTAppDelegate.m
//  Sidebar
//
//  Created by Main Account on 4/23/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTAppDelegate.h"
#import "RWTIconTableViewController.h"
#import "RWTMenuViewController.h"
#import "RWTSidebarViewController.h"

@interface RWTAppDelegate () <RWTIconTableViewControllerDelegate, RWTMenuViewControllerDelegate>

@property (nonatomic, strong) RWTIconTableViewController *summerVC;
@property (nonatomic, strong) RWTIconTableViewController *winterVC;
@property (nonatomic, strong) RWTMenuViewController *leftMenuVC;
@property (nonatomic, strong) RWTMenuViewController *rightMenuVC;
@property (nonatomic, strong) UINavigationController *iconsNav;
@property (nonatomic, strong) UINavigationController *leftMenuNav;
@property (nonatomic, strong) UINavigationController *rightMenuNav;

@property (nonatomic, strong) RWTSidebarViewController *sidebarVC;

@end

@implementation RWTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    self.winterVC = [storyboard instantiateViewControllerWithIdentifier:@"IconsVC"];
    self.winterVC.delegate = self;
    self.winterVC.iconSetIndex = 0;
    self.summerVC = [storyboard instantiateViewControllerWithIdentifier:@"IconsVC"];
    self.summerVC.delegate = self;
    self.summerVC.iconSetIndex = 1;
    self.leftMenuVC = [storyboard instantiateViewControllerWithIdentifier:@"MenuVC"];
    self.leftMenuVC.delegate = self;
    self.rightMenuVC = [storyboard instantiateViewControllerWithIdentifier:@"MenuVC"];
    self.rightMenuVC.delegate = self;
    
    self.iconsNav = [[UINavigationController alloc] initWithRootViewController:self.summerVC];
    self.leftMenuNav = [[UINavigationController alloc] initWithRootViewController:self.leftMenuVC];
    self.rightMenuNav = [[UINavigationController alloc] initWithRootViewController:self.rightMenuVC];
    
    self.sidebarVC = [[RWTSidebarViewController alloc] initWithLeftViewController:self.leftMenuNav mainViewController:self.iconsNav rightViewController:self.rightMenuVC gap:50];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.sidebarVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)iconTableViewControllerDidTapMenuButton:(RWTIconTableViewController *)controller {
    [self.sidebarVC toggleMenu];
}

- (void)menuViewControllerDidTapSummer:(RWTMenuViewController *)controller {
    [self.sidebarVC toggleMenu];
    if (self.iconsNav.viewControllers[0] != self.summerVC) {
        [self.iconsNav setViewControllers:@[self.summerVC] animated:YES];
    }
}

- (void)menuViewControllerDidTapWinter:(RWTMenuViewController *)controller {
    [self.sidebarVC toggleMenu];
    if (self.iconsNav.viewControllers[0] != self.winterVC) {
        [self.iconsNav setViewControllers:@[self.winterVC] animated:YES];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
