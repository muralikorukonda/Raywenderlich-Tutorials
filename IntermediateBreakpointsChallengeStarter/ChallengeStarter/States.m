//
//  DataModel.m
//  ChallengeStarter
//
//  Created by Brian Douglas Moakley on 1/31/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "States.h"
#import "State.h"

@implementation States {
    NSArray * _allStates;
    NSArray * _contigousStates;
    State * _currentState;
    NSInteger _currentStateId;
}

-(id) init
{
    self = [super init];
    if (self)
    {
        NSArray * statesAD = @[[State createState:@"Alabama"],[State createState:@"Alaska"],[State createState:@"Arizona"],[State createState:@"Arkansas"],[State createState:@"California"],[State createState:@"Colorado"],[State createState:@"Connecticut"],[State createState:@"Delaware"]];
        NSArray * statesEL = @[[State createState:@"Florida"],[State createState:@"Georgia"],[State createState:@"Hawaii"],[State createState:@"Idaho"],[State createState:@"Illinois"],[State createState:@"Indiana"],[State createState:@"Iowa"],[State createState:@"Kansas"],[State createState:@"Kentucky"],[State createState:@"Louisiana"]];
        NSArray * statesM = @[[State createState:@"Maine"],[State createState:@"Maryland"],[State createState:@"Massachusetts"],[State createState:@"Michigan"],[State createState:@"Minnesota"],[State createState:@"Mississippi"],[State createState:@"Misouri"],[State createState:@"Montana"]];
        NSArray * statesNO = @[[State createState:@"Nevada"],[State createState:@"Nebraska"],[State createState:@"New Hampshire"],[State createState:@"New Jersey"],[State createState:@"New Mexico"],[State createState:@"New York"],[State createState:@"North Carolina"],[State createState:@"North Dakota"],[State createState:@"Ohio"],[State createState:@"Ohio"],[State createState:@"Oklahoma"],[State createState:@"Oregon"]];
        NSArray * statesPU = @[[State createState:@"Pennsylvania"],[State createState:@"Rhode Island"],[State createState:@"South Carolina"],[State createState:@"South Dakota"],[State createState:@"Tennessee"],[State createState:@"Texas"],[State createState:@"Utah"]];
        NSArray * statesVZ = @[[State createState:@"Vermont"],[State createState:@"Virginia"],[State createState:@"Washington"],[State createState:@"West Virginia"],[State createState:@"Wisconsin"],[State createState:@"Wyoming"]];
        
        NSMutableArray * combinedStates = [[NSMutableArray alloc] init];
        [combinedStates addObjectsFromArray:statesAD];
        [combinedStates addObjectsFromArray:statesEL];
        [combinedStates addObjectsFromArray:statesM];
        [combinedStates addObjectsFromArray:statesNO];
        [combinedStates addObjectsFromArray:statesPU];
        [combinedStates addObjectsFromArray:statesVZ];
        
        _allStates = combinedStates;
        _contigousStates = [[NSArray alloc] init];
    }
    return self;
}

- (NSArray *)allStates
{
    return _allStates;
}

- (NSArray *) statesStartingWithA
{
    NSMutableArray * aStates = [[NSMutableArray alloc] init];
    for (int i =0; i < _allStates.count; i++)
    {
        _currentState = _allStates[i];

        // Hint for Step #2: Notice that there is a problem when i == 38.
        // Set a conditional breakpoint for for i = 37 to see the last state that works,
        // This will help you find the source of the bug.

        if([_currentState.name hasPrefix:@"North"])
            _numStatesStartingWithNorth++;
        
        if([_currentState.name hasPrefix:@"A"])
        {
            [aStates addObject:_currentState];
        }
    }
    return aStates;
}

-(NSArray *) contiguousStates
{
    NSMutableArray * contiguousStates = [[NSMutableArray alloc] init];
    for (int i =0; i < _allStates.count; i++)
    {
        _currentState = _allStates[i];
        
        
        if ([self isContiguous])
        {
            [contiguousStates addObject:_currentState];
        }
        
    }
    return contiguousStates;
}

-(NSArray *) atlanticStates
{
    NSMutableArray * atlanticStates = [[NSMutableArray alloc] init];
    for (int i =0; i < _allStates.count; i++)
    {
        _currentState = _allStates[i];
        
        if([[_currentState getBorderingOcean] isEqualToString:@"Atlantic"])
            [atlanticStates addObject:_currentState];
    }
    return atlanticStates;
}

-(NSArray *) landLockedStates
{
    NSMutableArray * landLockedStates = [[NSMutableArray alloc] init];
    for (int i =0; i < _allStates.count; i++)
    {
        _currentState = _allStates[i];
        
        if([[_currentState getBorderingOcean] isEqualToString:@"None"])
            [landLockedStates addObject:_currentState];
    }
    return landLockedStates;
}

-(BOOL) isContiguous
{
    if (![_currentState.name isEqualToString:@"Hawaii"] && ![_currentState.name isEqualToString:@"Alaska"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


@end
