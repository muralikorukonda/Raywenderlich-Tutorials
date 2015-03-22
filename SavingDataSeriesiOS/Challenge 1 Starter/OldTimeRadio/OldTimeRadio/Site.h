//
//  Site.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 6/3/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Site : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * isFree;
@property (nonatomic, retain) NSNumber * isMembershipRequired;

@end
