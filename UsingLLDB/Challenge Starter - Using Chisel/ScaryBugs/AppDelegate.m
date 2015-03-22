//
//  AppDelegate.m
//  ScaryBugs
//
//  Created by Main Account on 10/31/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "ScaryBug.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    BOOL hasRunBefore = [[NSUserDefaults standardUserDefaults] boolForKey:@"hasRunBefore"];
    if (!hasRunBefore) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasRunBefore"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        UIAlertView * alertView = [[UIAlertView alloc] 
                                    initWithTitle:@"Welcome!" 
                                    message:@"Welcome to Scary Bugs!" 
                                    delegate:nil 
                                    cancelButtonTitle:nil 
                                    otherButtonTitles:@"w00t", nil];
        [alertView show];        
    }


    // Override point for customization after application launch.
//    ScaryBug * centipede = [[ScaryBug alloc] initWithName:@"Centipede" image:
//                        [UIImage imageNamed:@"centipede.jpg"] howScary:3.0];
//    ScaryBug * ladybug = [[ScaryBug alloc] initWithName:@"Ladybug" image:
//                          [UIImage imageNamed:@"ladybug.jpg"] howScary:1.0];
//    ScaryBug * potatoBug = [[ScaryBug alloc] initWithName:@"Potato Bug" image:
//                            [UIImage imageNamed:@"potatoBug.jpg"] howScary:4.0];
//    ScaryBug * wolfSpider = [[ScaryBug alloc] initWithName:@"Wolf Spider" image:
//                             [UIImage imageNamed:@"wolfSpider.jpg"] howScary:5.0];
//
//    NSMutableArray * bugs = [NSMutableArray arrayWithObjects:
//                             centipede, ladybug, potatoBug, wolfSpider, nil];

    NSMutableArray * bugs = [NSMutableArray array];
    NSArray * docDirs = NSSearchPathForDirectoriesInDomains
        (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [docDirs objectAtIndex:0];
    NSString *bugsPath = [docDir stringByAppendingPathComponent:@"bugs.plist"];

    if ([[NSFileManager defaultManager] fileExistsAtPath:bugsPath]) {
        
        // File exists, let's load it
        NSData *data = [NSData dataWithContentsOfFile:bugsPath];
        NSArray * bugsArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [bugs addObjectsFromArray:bugsArray];
        
    } else {
        // Old code to load default bugs...
        NSString *path = [[NSBundle mainBundle] pathForResource:@"DefaultBugs"
          ofType:@"plist"];
        NSArray * plistArray = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary * bugDict in plistArray) {
            NSString *name = bugDict[@"name"];
            NSString *image = bugDict[@"image"];
            NSNumber * howScaryNumber = bugDict[@"howScary"];
            ScaryBug * bug = [[ScaryBug alloc] initWithName:name
                               image:[UIImage imageNamed:image] 
                               howScary:howScaryNumber.floatValue];
            [bugs addObject:bug];
        }
    }

    UINavigationController * navController = (UINavigationController *) 
      self.window.rootViewController;
    MasterViewController * masterViewController = 
      navController.viewControllers[0];
    masterViewController.bugs = bugs;
    return YES;
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
    UINavigationController * navController = (UINavigationController *) 
      self.window.rootViewController;
    MasterViewController * masterViewController = 
      [navController.viewControllers objectAtIndex:0];
    
    NSArray * docDirs = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [docDirs objectAtIndex:0];
    NSString *bugsPath = [docDir
                          stringByAppendingPathComponent:@"bugs.plist"];
    
    NSData * data = [NSKeyedArchiver
                     archivedDataWithRootObject:masterViewController.bugs];
    [data writeToFile:bugsPath atomically:YES];
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
