//
//  AppDelegate.m
//  DataTypes
//
//  Created by Murali Korukonda on 5/4/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import "AppDelegate.h"
#import <limits.h>

@implementation AppDelegate

typedef NS_ENUM(long long, VideoGameType){
    VideoGameTypeRPG,
    VideoGameTypeStrategy,
    VideoGameTypeAction,
    VideoGameTypeFPS = 5
};
//enum tag_VideoGameType {
//    VideoGameTypeRPG,
//    VideoGameTypeStrategy,
//    VideoGameTypeAction,
//    VideoGameTypeFPS
//};
//typedef int VideoGameType;
typedef NS_OPTIONS(int, EntityCategory){
    EntityCategoryPlayer = 1 << 0,
    EntityCategoryEnemy = 1 << 1,
    EntityCategoryAlien = 1 << 2
    
};

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //Integer Tutorial Challenge
    // Fill in the question marks
    uint32_t u32 = 4;
    int16_t i16 = 5;
    NSInteger nsInt = 6;
    
    NSLog(@"uint32_t: %u (%lu bytes): %d to %d", u32, sizeof(u32), (int)0, (int)UINT32_MAX);
    NSLog(@"int16_t: %hd (%lu bytes): %hd to %hd", i16, sizeof(i16), (short)SHRT_MIN, (short)SHRT_MAX);
    NSLog(@"NSInteger: %ld (%lu bytes)", (long)nsInt, sizeof(nsInt));
    
    // Why is this incorrect on 64-bit architecture?
    //Reason - NSInteger is 8bytes in 64-bit;4bytes in 32-bit
    nsInt = 1000000000000000000;
    int myInt = (int)nsInt;
    NSLog(@"NSInteger: %ld", (long) nsInt);
    NSLog(@"myInt: %d", myInt);
    
    //Float Tutorial Challenge
    float account1 = 100.00;
    float account2 = 0.00;
    float transferAmount = 0.1;
    
    for(int i = 0; i < 30; i++) {
        account1 -= transferAmount;
        account2 += transferAmount;
    }
    
    NSLog(@"Account 1: %.12f", account1);
    NSLog(@"Account 2: %.12f", account2);
    NSLog(@"Sum: %f", account1 + account2);
    // Explain: what went wrong here?
    
    //Boolean Tutorial Challenge
    // Add this method inside application:didFinishLaunchingWithOptions
    if (different(1, 2) == YES) {
        NSLog(@"Different!");
    } else {
        NSLog(@"Not different.");
    }
    
    //Enumerations & Bitmask
    VideoGameType type = VideoGameTypeFPS;
    NSLog(@"Sizeof type: %lu value: %lld",sizeof(type),type);
    
    switch (type) {
        case VideoGameTypeRPG:
        NSLog(@"RPG");
        break;
        
        default:
        NSLog(@"Default");
        break;
    }
    
    EntityCategory category = EntityCategoryAlien | EntityCategoryEnemy;
    NSLog(@"%x",EntityCategoryPlayer);
    NSLog(@"%x",EntityCategoryAlien);
    NSLog(@"%x",EntityCategoryEnemy);
    NSLog(@"%x",category);
    
    if(category & EntityCategoryPlayer){
        NSLog(@"Player");
    }
    if(category & EntityCategoryAlien){
        NSLog(@"Alien");
    }
    if(category & EntityCategoryEnemy){
        NSLog(@"Enemy");
    }
    return YES;
}

static BOOL different (int thing1, int thing2) {
    return thing1 - thing2;
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
