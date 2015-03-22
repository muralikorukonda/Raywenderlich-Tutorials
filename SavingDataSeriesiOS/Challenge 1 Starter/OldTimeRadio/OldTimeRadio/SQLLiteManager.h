//
//  SQLLiteManager.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 5/31/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SQLLiteManager : NSObject

@property (readonly, nonatomic) sqlite3 * database;

+ (id)sharedManager;
- (int) open;
- (int) close;

@end
