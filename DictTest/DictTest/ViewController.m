//
//  ViewController.m
//  DictTest
//
//  Created by Main Account on 1/9/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // 1 : Basic Usage
    NSDictionary *dogDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Beagle Mix that Loves Walks", @"Freckles", @"Maltese that Loves to Play with Toys", @"Scampi", @"Poodle that Loves to Growl and Snarl", @"Dusty", nil];
    
    NSString *dog = @"Scampi";
    NSLog(@"Dog %@: %@", dog, [dogDict valueForKey:dog]);
    
    // 2 : NSNumber Usage, NSMutableDictionary
//    int frecklesBarks = 1;
//    int scampiBarks = 9999;
//    int dustyBarks = 20;

//    NSNumber *frecklesBarks = [NSNumber numberWithInt:1];
//    NSNumber *scampiBarks = [NSNumber numberWithInt:9999];
//    NSNumber *dustyBarks = [NSNumber numberWithInt:20];
//    NSMutableDictionary *barkDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:frecklesBarks, @"Freckles", frecklesBarks, @"Scampi", dustyBarks, @"Dusty", nil];
//    
//    NSLog(@"Dog %@: %@", dog, [barkDict valueForKey:dog]);
//    
//    scampiBarks = [NSNumber numberWithInt:10000];
//    [barkDict setValue:scampiBarks forKey:@"Scampi"];
//    NSLog(@"Dog %@: %@", dog, [barkDict valueForKey:dog]);

    // 3 : Literal Syntax

    NSNumber *frecklesBarks = @1;
    NSNumber *scampiBarks = @9999;
    NSNumber *dustyBarks = @20;
    NSMutableDictionary *barkDict = [@{@"Freckles":frecklesBarks, @"Scampi":scampiBarks, @"Dusty":dustyBarks} mutableCopy];
    NSLog(@"Dog %@: %@", dog, barkDict[dog]);
    
    scampiBarks = @10000;
    barkDict[@"Scampi"] = scampiBarks;
    NSLog(@"Dog %@: %@", dog, barkDict[dog]);
    
    // 4 : Enumeration
    for (NSString *key in barkDict.allKeys) {
        NSNumber *value = barkDict[key];
        NSLog(@"%@: %d", key, [value intValue]);
    }
    
    [barkDict enumerateKeysAndObjectsUsingBlock:^(NSString* key, NSNumber *value, BOOL *stop) {
        NSLog(@"%@: %d", key, [value intValue]);
    }];
    
    // 5 : Custom Key Example
    Dog * freckles = [[Dog alloc] initWithName:@"Freckles" description:@"Beagle Mix that Loves Walks"];
    Dog * scampi = [[Dog alloc] initWithName:@"Scampi" description:@"Maltese that Loves to Play with Toys"];
    Dog * dusty = [[Dog alloc] initWithName:@"Dusty" description:@"Poodle that Loves to Growl and Snarl"];
    
    NSLog(@"Freckles hash: %lu", (unsigned long)[freckles hash]);
    NSLog(@"Scampi hash: %lu", (unsigned long)[scampi hash]);
    NSLog(@"Dusty hash: %lu", (unsigned long)[dusty hash]);
    
    NSDictionary *barkDict2 = @{freckles: frecklesBarks, scampi: scampiBarks, dusty:dustyBarks};
    NSLog(@"Scampi's Barks: %@", barkDict2[scampi]);
    
//    NSMutableDictionary *homelandDict = [NSMutableDictionary
//                                         dictionaryWithObjectsAndKeys:@"Ecuador", @"Felipe",
//                                         @"Candada", @"Greg", @"Netherlands", @"Matthijs",
//                                         @"Denmark", @"Kim", nil];
    // TODO 1: Convert to literal syntax
    // TODO 2: Add your own homeland
    // TODO 3: Look up and print Matthijs's homeland
    // TODO 4: Enumerate dictionary and print out all keys/values
    NSMutableDictionary *homelandDict = [@{@"Felipe": @"Ecudor",@"Greg":@"Canada",@"Matthijs":@"Netherlands",@"Kim":@"Denmark"} mutableCopy];
    NSString *myName = @"Murali";
    NSString *myHomeLand = @"India";
    [homelandDict setObject:myHomeLand forKey:myName];
    NSLog(@"Matthijs homeland: %@",[homelandDict valueForKey:@"Matthijs"]);
    for (NSString *name in [homelandDict allKeys]) {
        NSLog(@"key: %@ and homeland:%@",name,[homelandDict valueForKey:name]);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
