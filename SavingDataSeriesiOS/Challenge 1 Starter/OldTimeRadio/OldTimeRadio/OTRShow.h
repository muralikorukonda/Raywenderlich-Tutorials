//
//  OTRShow.h
//  OldTimeRadio
//
//  Created by Brian Moakley on 5/28/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTRShow : NSObject

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * thumbnailFileName;
@property (strong, nonatomic) NSString * showDescription;
@property (assign, nonatomic) NSInteger showId;

@end
