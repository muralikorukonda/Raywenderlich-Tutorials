//
//  OTRFavorite.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 5/28/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OTREpisode;
@interface OTRFavorite : NSObject 

@property (strong, nonatomic) OTREpisode * episode;
@property (strong, nonatomic) NSDate * favoriteDate;
@property (strong, nonatomic) NSString * note;


@end
