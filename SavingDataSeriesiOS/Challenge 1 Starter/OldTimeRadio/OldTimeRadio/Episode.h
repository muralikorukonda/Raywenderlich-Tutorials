//
//  Episode.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 6/3/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Favorite, RadioShow;

@interface Episode : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * broadcastDate;
@property (nonatomic, retain) NSString * fileLocation;
@property (nonatomic, retain) NSNumber * episodeId;
@property (nonatomic, retain) RadioShow *parentShow;
@property (nonatomic, retain) Favorite *favorite;

@end
