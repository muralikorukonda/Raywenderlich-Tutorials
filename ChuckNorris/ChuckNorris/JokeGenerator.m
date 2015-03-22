//
//  JokeGenerator.m
//  ChuckNorris
//
//  Created by Murali Korukonda on 4/5/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import "JokeGenerator.h"

@implementation JokeGenerator

- (id)init {
    if ((self = [super init])) {
        /*self.jokes = @[
                       @"They once named a street after Chuck Norris, but they had to                       close it down because no one dared cross Chuck Norris.",
                       @"The truth hurts because Chuck Norris roundhouse kicked it.",
                       @"Chuck Norris doesn't cheat death, he beats it fair and                       square.",
                       @"Ghosts sit around the campfire and tell Chuck Norris                       stories.",
                       @"Chuck Norris only uses stunt doubles for crying scenes.",
                       @"That's not an eclipse - it’s the sun hiding from Chuck                       Norris."];
         */
        self.jokes = @{@"Chuck":@[@"They once named a street after Chuck Norris, but they had to close it down because no one dared cross Chuck Norris.",
                                  @"The truth hurts because Chuck Norris roundhouse kicked it.",
                                  @"Chuck Norris doesn't cheat death, he beats it fair and square.",
                                  @"Ghosts sit around the campfire and tell Chuck Norris stories.",
                                  @"Chuck Norris only uses stunt doubles for crying scenes.",
                                  @"That's not an eclipse - it’s the sun hiding from Chuck Norris."],
                       @"Knock":@[@"Knock, Knock! Who's there? Says! Says who? Says me, that's who?",
                               @"Knock, Knock! Who's there? Cows go. Cows go who? No, cows go moo!",
                                  @"Knock, Knock! Who's there? Spell. Spell who? OK, W_H_O."],
                       @"YoMamma":@[@"Yo momma so dumb she studied for a drug test!",
                                    @"Yo momma so fat she jumped in the air and got stuck.",
                                    @"Yo momma so poor when she goes in her front door she's in her back yard."]
                       };

        
    }
    return self;
}
- (NSString *)randomJoke:(NSString *)jokeType {
    NSArray *jokesArray = [_jokes valueForKey:jokeType];
    int randomIdx = arc4random() % jokesArray.count;
    return [jokesArray objectAtIndex:randomIdx];
}

-(NSArray*)jokeTypes{
    return [_jokes allKeys];
}

@end
