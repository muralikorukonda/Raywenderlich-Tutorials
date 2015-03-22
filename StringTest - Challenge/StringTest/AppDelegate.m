//
//  AppDelegate.m
//  StringTest
//
//  Created by Main Account on 1/7/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    int bottles = 21;
    NSString *drink = @"beer";
    
    // 1 - Creating, appending strings
    NSString *song = [NSString stringWithFormat:@"%d bottles of %@ on the wall...%d bottles of %@...", bottles, drink, bottles, drink];
    song = [song stringByAppendingString:@"Take 1 down, pass it around..."];
    bottles--;
    song = [song stringByAppendingFormat:@"%d bottles of %@ on the wall!", bottles, drink];
    NSLog(@"%@", song);
    
    // 2 - Modifying strings
    NSString *vickiSong = [song stringByReplacingOccurrencesOfString:@"beer" withString:@"wine"];
    NSLog(@"%@", vickiSong);
    
    // 3 - Comparing strings
    if ([drink isEqualToString:@"beer"]) {
        NSLog(@"Mmm, beer!");
    } else {
        NSLog(@"Bring me some beer!");
    }
    
    // 3 - Comparing strings
    NSString *toCompare = @"passing out drunk";
    //NSString *toCompare = @"arriving at the bar";
    if ([drink compare:toCompare] == NSOrderedAscending) {
        NSLog(@"%@ comes before %@", drink, toCompare);
    } else {
        NSLog(@"%@ comes after %@", drink, toCompare);
    }
    
    // 4 - Converting strings to primitives
    NSString * myIntString = @"1337";
    NSString * myFloatString = @"3.1415926";
    
    int myInt = [myIntString intValue];
    float myFloat = [myFloatString floatValue];
    NSLog(@"%f is %d", myFloat, myInt);
    
    // 5 - Splitting strings into components
    NSString * awesomeDudesList = @"Brian Moakley,Chris LaPollo,Cosmin Pupaza";
    NSArray * awesomeDudes = [awesomeDudesList componentsSeparatedByString:@","];
    for (NSString * awesomeDude in awesomeDudes) {
        NSLog(@"%@", awesomeDude);
    }
    
    // 6 - Finding range of substring
    NSRange moakleyRange = NSMakeRange(6, 7);
    NSString *substring = [awesomeDudesList substringWithRange:moakleyRange];
    NSLog(@"Substring: %@", substring);

    NSRange laPolloRange = [awesomeDudesList rangeOfString:@"LaPollo"];
    NSLog(@"Starts at index %ld and is %ld characters long", (unsigned long) laPolloRange.location, (unsigned long) laPolloRange.length);
    awesomeDudesList = [awesomeDudesList stringByReplacingCharactersInRange:laPolloRange withString:@"LaHipster"];
    NSLog(@"%@", awesomeDudesList);

    NSString *englishString = @"English";
    NSLog(@"%@", englishString);
    for(int i = 0; i < englishString.length; ++i) {
        unichar myChar = [englishString characterAtIndex:i];
        NSLog(@"%02X %C", myChar, myChar);
    }
    
    // 7 - NSMutableString test
    int intervals = 10000;
    
    CFTimeInterval start1 = CACurrentMediaTime();
    NSString * msg1 = @"";
    for (int i = 0; i < intervals; i++) {
        msg1 = [NSString stringWithFormat:@"%@ %d", msg1, i];
    }
    CFTimeInterval end1 = CACurrentMediaTime();
    NSLog(@"NSString Time: %f", end1 - start1);
    
    CFTimeInterval start2 = CACurrentMediaTime();
    NSMutableString * msg2 = [NSMutableString string];
    for (int i = 0; i < intervals; i++) {
        [msg2 appendFormat:@" %d", i];
    }
    CFTimeInterval end2 = CACurrentMediaTime();
    NSLog(@"NSMutableString Time: %f", end2 - start2);
    
    // 8 - Encoding test
    NSString *japaneseString = @"日本語";
    const char * cString = [japaneseString cStringUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"UTF8");
    for (int i = 0; i < strlen(cString); ++i) {
        NSLog(@"0x%hhx", cString[i]);
    }
    
    NSLog(@"UTF16");
    const char * cString2 = [japaneseString cStringUsingEncoding:NSUTF16StringEncoding];
    uint16_t * utf16String = (uint16_t *) cString2;
    while (*utf16String != '\0') {
        NSLog(@"0x%hx", *utf16String);
        utf16String++;
    }
    
    NSLog(@"UTF32");
    const char * cString3 = [japaneseString cStringUsingEncoding:NSUTF32StringEncoding];
    uint32_t * utf32String = (uint32_t *) cString3;
    while (*utf32String != '\0') {
        NSLog(@"0x%x", *utf32String);
        utf32String++;
    }
    
    // 8 - Encoding test
    NSLog(@"Japanese string: %@ (%ld)", japaneseString, (unsigned long) japaneseString.length);
    for(int i = 0; i < japaneseString.length; ++i) {
        unichar myChar = [japaneseString characterAtIndex:i];
        NSLog(@"0x%04X", myChar);
    }
    
    NSString *gClefString = @"𝄞"; // @"\U0001D11E";
    NSLog(@"G Clef: %@ (%d)", gClefString, gClefString.length);
    for(int i = 0; i < gClefString.length; ++i) {
        unichar myChar = [gClefString characterAtIndex:i];
        NSLog(@"0x%04X", myChar);
    }
    
    NSLog(@"UTF32 for G Clef");
    const char * utf32Note = [gClefString cStringUsingEncoding:NSUTF32StringEncoding];
    uint32_t * uint32String = (uint32_t *)utf32Note;
    while (*uint32String != '\0') {
        NSLog(@"0x%04X", *uint32String);
        uint32String++;
    }
    
    // Challenge
    NSString *namesList = @"Elmo|Big Bird|Snuffy";
    NSMutableString *finalSong = [NSMutableString string];
    // Your code here!
    NSArray *namesArray = [namesList componentsSeparatedByString:@"|"];
    for (int i = 0; i < namesArray.count; ++i) {
        
        NSString *name = namesArray[i];
        
        [finalSong appendString:@"This is the song\n"];
        [finalSong appendString:@"La la la la\n"];
        [finalSong appendFormat:@"%@'s song.\n", name];
        [finalSong appendString:@"La la la la,\n"];
        [finalSong appendString:@"La la la la,\n"];
        [finalSong appendFormat:@"%@'s song.\n\n", name];
        
        [finalSong appendString:@"La la la\n"];
        [finalSong appendString:@"La la la la, la\n"];
        [finalSong appendString:@"La la la\n"];
        [finalSong appendString:@"La la la la, la\n\n"];
        
        if (i == 0) {
            [finalSong appendString:@"He loves to sing,\n"];
        } else {
            [finalSong appendString:@"I love to sing,\n"];
        }
        [finalSong appendString:@"La la la la\n"];
        [finalSong appendFormat:@"%@'s song.\n", name];
        [finalSong appendString:@"La la la la,\n"];
        [finalSong appendString:@"La la la la,\n"];
        [finalSong appendFormat:@"%@'s song.\n\n", name];
        
        if (i == 0) {
            [finalSong appendString:@"He wrote the music.\n"];
            [finalSong appendString:@"He wrote the words.\n"];
            [finalSong appendFormat:@"That's %@'s song.\n\n", name];
        } else if (i == namesArray.count - 1) {
            [finalSong appendString:@"He wrote the music.\n"];
            [finalSong appendString:@"We wrote the words.\n"];
            for (int j = namesArray.count - 1; j > 0; --j) {
                NSString *name2 = namesArray[j];
                [finalSong appendFormat:@"That's %@'s\n", name2];
            }
            [finalSong appendFormat:@"That's %@'s song!\n\n", namesArray[0]];
        } else {
            [finalSong appendString:@"I love the music.\n"];
            [finalSong appendString:@"I love the words.\n"];
            [finalSong appendFormat:@"That's %@'s song.\n\n", name];
        }
        
    }
    NSLog(@"%@", finalSong);
    
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
