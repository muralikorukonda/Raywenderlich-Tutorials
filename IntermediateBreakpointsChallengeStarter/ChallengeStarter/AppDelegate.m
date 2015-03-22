//
//  AppDelegate.m
//  ChallengeStarter
//
//  Created by Brian Douglas Moakley on 1/31/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "States.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Step #1: Add a breakpoint for all exceptions to get close to the source of the crashing bug.
    // Step #2: Use a conditional breakpoint to fully identify the cause of the crashing bug, and fix it.
    // Step #3: You'll see the "number of states starting with North" displays 4, but should be 2. Use a watchpoint to identify and fix the cause of the bug.
    // Step #4: You'll notice the state "Connecticut" does nto appear in the list of atlanticStates. Set a symbolic breakpoint on the getBorderingOcean method to identify and fix the cause of the bug.

    States * states = [[States alloc] init];


    // List states starting with letter A
    for (NSString * state in [states statesStartingWithA])
    {
        NSLog(@"%@", state);
    }
    
    // List Contiguous states
    for (NSString * state in [states contiguousStates])
    {
        NSLog(@"%@", state);
    }

    NSLog(@"Number of states starting with 'North': %d", states.numStatesStartingWithNorth);
    NSLog(@"States along the Atlantic ocean: %@", [states atlanticStates]);
    NSLog(@"States along no ocean: %@", [states landLockedStates]);

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
