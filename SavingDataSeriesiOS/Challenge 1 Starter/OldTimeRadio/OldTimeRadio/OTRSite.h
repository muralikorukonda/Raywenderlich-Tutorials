//
//  OTRSite.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 5/28/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTRSite : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * address;
@property (assign, nonatomic) BOOL isFree;
@property (assign, nonatomic) BOOL isMembershipRequired;

@end
