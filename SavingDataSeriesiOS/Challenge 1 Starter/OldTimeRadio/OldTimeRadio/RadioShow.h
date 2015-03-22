//
//  RadioShow.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 6/3/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface RadioShow : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * thumbnailFileName;
@property (nonatomic, retain) NSString * showDescription;
@property (nonatomic, retain) NSNumber * showId;
@property (nonatomic, retain) NSSet *episodes;
@end

@interface RadioShow (CoreDataGeneratedAccessors)

- (void)addEpisodesObject:(NSManagedObject *)value;
- (void)removeEpisodesObject:(NSManagedObject *)value;
- (void)addEpisodes:(NSSet *)values;
- (void)removeEpisodes:(NSSet *)values;

@end
