//
//  JokeGenerator.m
//  ChuckNorris
//
//  Created by Main Account on 10/29/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "JokeGenerator.h"

@implementation JokeGenerator

- (id)init {
    if ((self = [super init])) {
        NSArray * jokeList = @[
        @"They once named a street after Chuck Norris, but they had to close it down because no one dared cross Chuck Norris.",
        @"The truth hurts because Chuck Norris roundhouse kicked it.",
        @"Ghosts sit around the campfire and tell Chuck Norris stories.",
        @"Chuck Norris only uses stunt doubles for crying scenes.",
        @"That's not an eclipse - it's the sun hiding from Chuck Norris."];
        self.jokes = [NSMutableArray arrayWithArray:jokeList];
    }
    return self;
}

- (NSString *)randomJoke {
    int randomIdx = arc4random() % _jokes.count;
    NSString * joke = [_jokes objectAtIndex:randomIdx];;
    [self.jokes removeObjectAtIndex:randomIdx];
    return joke;
}

@end
