//
//  DataModel.h
//  ChallengeStarter
//
//  Created by Brian Douglas Moakley on 1/31/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface States : NSObject

@property (nonatomic, readonly) int numStatesStartingWithNorth;

-(NSArray *) allStates;
-(NSArray *) statesStartingWithA;
-(NSArray *) contiguousStates;
-(NSArray *) atlanticStates;
-(NSArray *) landLockedStates;

@end
