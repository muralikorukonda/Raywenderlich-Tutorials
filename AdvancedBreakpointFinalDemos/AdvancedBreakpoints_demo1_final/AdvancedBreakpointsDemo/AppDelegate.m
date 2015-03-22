//
//  AppDelegate.m
//  AdvancedBreakpointsDemo
//
//  Created by Brian Douglas Moakley on 1/30/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate()

@property (strong) NSArray * bookData;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray * title =  @[ @"The", @"Adventures", @"of", @"Sherlock", @"Holmes", @"by", @"Arthur", @"Conan", @"Doyle"];
    int bylineStart = [title indexOfObject:@"by"];
    int bylineEnd = [title indexOfObject:@"Doyle"];
    NSArray * byline = [title subarrayWithRange: NSMakeRange(bylineStart, bylineEnd - bylineStart + 1)];

    
    
    
//    NSLog(@"Byline: %@", byline);
//    NSLog(@"Byline start: %d", bylineStart);
//    NSLog(@"Byline end: %d", bylineEnd);
    
    dispatch_queue_t book_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(book_queue, ^{
        NSArray * additionalData = [self bookData];
        self.bookData = [self mergeArray:additionalData withTargetArray:byline];
    });

    
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

- (NSArray *) bookData
{
    NSError * error = nil;
    NSString * bigDataPath = [[NSBundle mainBundle] pathForResource:@"big_data" ofType:@"txt"];
    NSString * data = [NSString stringWithContentsOfFile:bigDataPath encoding:NSUTF8StringEncoding error:&error];
    
    NSMutableArray *charArray = [NSMutableArray arrayWithCapacity:data.length];
    for (int i=0; i<data.length; ++i) {
        NSString *charStr = [data substringWithRange:NSMakeRange(i, 1)];
        [charArray addObject:charStr];
    }
    [charArray sortUsingComparator:^(NSString *a, NSString *b){
        return [a compare:b];
    }];
    
    return charArray;
}

-(NSMutableArray *) mergeArray: (NSArray *) source withTargetArray: (NSArray *) targetArray
{
    NSMutableArray * combinedArray = [[NSMutableArray alloc] initWithArray:source];
    [combinedArray addObjectsFromArray:targetArray];
    return combinedArray;
}

@end
