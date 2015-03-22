//
//  AppDelegate.m
//  ChuckNorris
//
//  Created by Main Account on 10/29/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "JokeGenerator.h"
@interface AppDelegate()
    @property (nonatomic, strong) NSMutableArray * jokes;
@end

@implementation AppDelegate

// Challenges

// NOTE: Before starting, make sure to add the audience laughter sound (laughter.wav) to your YOUR_HOME_DIRECTORY/Library/Sounds folder.
//       To access your library folder, view the following article: http://osxdaily.com/2011/07/22/access-user-library-folder-in-os-x-lion/
//       Once you add the sound, make sure to restart Xcode.

// ALSO NOTE: The speaking code is a little python script to use the speaking feature with regard to objects.

// #1 - First convert all the NSLog statements without variables into regular log statements. The breakpoints should not pause after each statement.
// #2 - Comment out NSLog(@"joke: %@", joke) and add a breakpoint at that line
// #3 - On the breakpoint, add a debugger action. Use the following debugger command to print out joke: expr (void) NSLog(@"joke: %@", joke);
// #4 - Add another debugger action to say the joke: script os.system("say " + lldb.frame.GetValueForVariablePath("joke").description)
// #5 - Play the audience laughter sound after each joke by adding a sound action
// #6 - Make sure the breakpoint pauses so the audience can finish laughing
// #7 - Enjoy the show :]


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //NSLog(@"Initialize joke generator");
    JokeGenerator * generator = [[JokeGenerator alloc] init];
    self.jokes = [[NSMutableArray alloc] init];
    
    
    for(int i = 0; i < 3; ++i) {
    //NSLog(@"Added joke");
        [self.jokes addObject:[generator randomJoke]];
    }
    
    for (int i=0; i < 3; ++i)
    {
        NSString * joke = self.jokes[i];
        //NSLog(@"joke: %@", joke);
    }
    
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
