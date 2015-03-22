//
//  ViewController.m
//  ArrayTest
//
//  Created by Main Account on 1/8/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSArray * videoGames = [NSArray arrayWithObjects:@"Fallout 2", @"Deus Ex", @"Diablo 2", @"Civilization V", @"Final Fantasy IV", nil];

    NSString *favoriteGame = [videoGames objectAtIndex:1];
    NSLog(@"Favorite game: %@", favoriteGame);
    
    // Iterating, Method 1
    for (int i = 0; i < videoGames.count; ++i) {
        NSString *videoGame = [videoGames objectAtIndex:i];
        NSLog(@"%d: %@", i, videoGame);
    }

    // Iterating, Method 2
    for (NSString * videoGame in videoGames) {
        NSLog(@"%@", videoGame);
    }
    
    // Iterating, Method 3
    [videoGames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *videoGame = obj;
        NSLog(@"%ld: %@", (unsigned long) idx, videoGame);
    }];
    
    // Iterating, Method 4
    [videoGames enumerateObjectsUsingBlock:^(NSString *videoGame, NSUInteger idx, BOOL *stop) {
        NSLog(@"%ld: %@", (unsigned long) idx, videoGame);
    }];
    
    // NSArray vs NSMutableArray
    //NSArray * thingsYouMustDo = [NSArray arrayWithObjects:@"Death", @"Taxes", nil];
    NSArray * thingsYouMustDo = @[@"Taxes", @"Death"];
    //NSLog(@"First thing to do: %@", [thingsYouMustDo objectAtIndex:0]);
    NSLog(@"First thing to do: %@", thingsYouMustDo[0]);
    
    //NSMutableArray * thingsYouWantToDo = [NSMutableArray arrayWithObjects:@"Visit China", @"Go Skydiving", @"Learn to Ballrom Dance", nil];
    NSMutableArray * thingsYouWantToDo = [@[@"Visit China", @"Go Skydiving", @"Learn to Ballroom Dance"] mutableCopy];
    [thingsYouWantToDo addObject:@"Run a Marathon"];
    [thingsYouWantToDo insertObject:@"Stop Worrying So Much" atIndex:1];
    //[thingsYouWantToDo replaceObjectAtIndex:0 withObject:@"Learn Chinese"];
    thingsYouWantToDo[0] = @"Learn Chinese";
    [thingsYouWantToDo removeObjectAtIndex:2]; // Scary!
    [thingsYouWantToDo removeObject:@"Learn to Ballroom Dance"];
    
    NSLog(@"%@", thingsYouWantToDo);
    
    // Misc fun stuff
    NSLog(@"Last thing to do: %@", [thingsYouMustDo lastObject]);

    [thingsYouWantToDo sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSLog(@"%@", thingsYouWantToDo);
    
    NSString *thingsString = [thingsYouWantToDo componentsJoinedByString:@", "];
    NSLog(@"%@", thingsString);
    
    //for (NSString *thing in thingsYouWantToDo) {
    //for (NSString *thing in [thingsYouWantToDo copy]) {
    for (int i = thingsYouWantToDo.count - 1; i > 0; --i) {
        NSString * thing = [thingsYouWantToDo objectAtIndex:i];
        if ([thing hasPrefix:@"Run"]) {
            [thingsYouWantToDo addObject:@"Run a 5K"];
        }
        NSLog(@"%d", i);
    }
    NSLog(@"%@", thingsYouWantToDo);
 
    //NSMutableArray *favoriteFood = [NSMutableArray arrayWithObjects:@"Pizza", @"Sushi", @"Toe Jam", @"Yellow Snow", nil];
    // TODO 1: Convert to use literal syntax
    // TODO 2: Remove any non-favorite food
    // TODO 3: Add at least 1 new favorite food
    // TODO 4: Iterate through list and print out each item (use for loop and literal syntax)
    NSMutableArray *favoriteFood = [@[@"Pizza", @"Sushi", @"Toe Jam", @"Yellow Snow"] mutableCopy];
    
    [favoriteFood removeObjectAtIndex:1];
    [favoriteFood addObject:@"Burger"];
    for (int i=0;i<favoriteFood.count;i++) {
        NSLog(@"%@",favoriteFood[i]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
