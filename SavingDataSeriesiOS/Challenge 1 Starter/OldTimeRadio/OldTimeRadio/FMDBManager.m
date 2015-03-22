//
//  FMDBManager.m
//  OldTimeRadio
//
//  Created by Brian Moakley on 6/3/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "FMDBManager.h"

@interface FMDBManager()

@property (strong, nonatomic) NSString * fileName;
@property (strong, nonatomic) FMDatabase * database;

@end

@implementation FMDBManager

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
    static FMDBManager *sharedMyManager = nil;
    @synchronized(self) {
        if (sharedMyManager == nil)
        {
            sharedMyManager = [[self alloc] init];
        }
    }
    return sharedMyManager;
}

-(void) close
{
    [self.database close];
}

-(void) open
{
    if (!self.database)
    {
        self.database = [FMDatabase databaseWithPath:self.fileName];
    }
    [self.database open];
}

@end
