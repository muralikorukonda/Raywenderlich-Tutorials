//
//  SQLLiteManager.m
//  OldTimeRadio
//
//  Created by Brian Moakley on 5/31/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "SQLLiteManager.h"


@interface SQLLiteManager()

@property (assign, nonatomic) sqlite3 * database;
@property (strong, nonatomic) NSString * fileName;
@property (assign, nonatomic) BOOL isOpen;

@end

@implementation SQLLiteManager

- (id)init
{
    self = [super init];
    if (self)
    {
        NSFileManager * fileManager = [NSFileManager defaultManager];
        NSURL * library = [fileManager URLForDirectory:NSLibraryDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSURL * dbUrl = [library URLByAppendingPathComponent:@"library.sqlite"];
        
        _fileName = [dbUrl absoluteString];
    }
    return self;
}

+ (id)sharedManager {
    static SQLLiteManager *sharedMyManager = nil;
    @synchronized(self) {
        if (sharedMyManager == nil)
        {
            sharedMyManager = [[self alloc] init];
        }
    }
    return sharedMyManager;
}

-(int) close
{
    return sqlite3_close(self.database);
}

-(int) open
{
    return sqlite3_open([self.fileName UTF8String], &_database);
}

-(BOOL) isOpen
{
    BOOL isOpen = NO;
    if (self.database != NULL)
    {
        isOpen = YES;
    }
    return isOpen;
}




@end
