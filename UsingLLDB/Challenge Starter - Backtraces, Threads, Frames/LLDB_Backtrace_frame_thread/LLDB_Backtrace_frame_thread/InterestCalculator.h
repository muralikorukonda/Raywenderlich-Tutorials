//
//  InterestCalculator.h
//  LLDB_Backtrace_frame_thread
//
//  Created by Brian Moakley on 4/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InterestCalculator : NSObject


@property (assign, nonatomic) float time;
@property (assign, nonatomic) float rate;
@property (assign, nonatomic) float principal;

-(float) calculateInterest;

@end
