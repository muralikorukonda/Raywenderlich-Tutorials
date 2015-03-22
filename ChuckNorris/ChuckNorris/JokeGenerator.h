//
//  JokeGenerator.h
//  ChuckNorris
//
//  Created by Murali Korukonda on 4/5/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JokeGenerator : NSObject

@property (strong) NSDictionary *jokes;

-(NSString *)randomJoke:(NSString *)jokeType;
-(NSArray *)jokeTypes;

@end
