//
//  Favorite.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 6/3/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Favorite : NSManagedObject

@property (nonatomic, retain) NSDate * favoriteDate;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSManagedObject *episode;

@end
