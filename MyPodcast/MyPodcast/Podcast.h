//
//  Podcast.h
//  MyPodcast
//
//  Created by Main Account on 2/6/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Podcast : NSObject

@property (assign) int episodeNumber;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSURL *audioFile;
@property (strong, nonatomic) NSURL *showNotes;

- (instancetype)initWithEpisodeNumber:(int)episodeNumber title:(NSString *)title description:(NSString *)description audioFile:(NSURL *)audioFile showNotes:(NSURL *)showNotes;
+ (NSArray *)podcasts;

@end
