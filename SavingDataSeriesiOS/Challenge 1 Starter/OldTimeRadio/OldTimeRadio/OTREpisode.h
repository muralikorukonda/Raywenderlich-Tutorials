//
//  OTREpisode.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 5/28/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OTRFavorite;
@class OTRShow;

@interface OTREpisode : NSObject 

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) OTRShow * parentShow;
@property (strong, nonatomic) NSDate * broadcastDate;
@property (strong, nonatomic) NSString * fileLocation;
@property (weak, nonatomic) OTRFavorite * favorite;
@property (assign, nonatomic) NSInteger episodeId;

@end
