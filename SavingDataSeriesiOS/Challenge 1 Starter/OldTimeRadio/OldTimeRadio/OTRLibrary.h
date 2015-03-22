//
//  OTRLibrary.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 6/1/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTRLibrary : NSObject

+(instancetype) sharedLibrary;
-(void) buildLibraryFromPlist;
-(void) initializeLibrary;

@property (readonly, nonatomic) NSArray * shows;
@property (readonly, nonatomic) NSArray * episodes;
@property (readonly, nonatomic) NSArray * favorites;
@property (readonly, nonatomic) NSArray * sites;
@property (strong, nonatomic) NSManagedObjectContext * managedObjectContext;

@end
