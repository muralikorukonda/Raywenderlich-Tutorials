//
//  FMDBManager.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 6/3/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface FMDBManager : NSObject

@property (readonly, nonatomic) FMDatabase * database;

+ (id)sharedManager;
- (void) open;
- (void) close;

@end
