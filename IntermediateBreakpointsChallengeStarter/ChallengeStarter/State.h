//
//  State.h
//  ChallengeStarter
//
//  Created by Brian Douglas Moakley on 2/1/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface State : NSObject

@property (nonatomic,readonly) NSString* name;

+ (instancetype)createState:(NSString *)name;
- (NSString *)getBorderingOcean;

@end


@interface AtlanticState : State
@end


@interface PacificState : State
@end

@interface LandLockedState : State
@end