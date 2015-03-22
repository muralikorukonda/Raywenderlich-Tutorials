//
//  Podcast.m
//  MyPodcast
//
//  Created by Main Account on 2/6/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "Podcast.h"

@implementation Podcast

- (instancetype)initWithEpisodeNumber:(int)episodeNumber title:(NSString *)title description:(NSString *)description audioFile:(NSURL *)audioFile showNotes:(NSURL *)showNotes {
  if ((self = [super init])) {
    _episodeNumber = episodeNumber;
    _title = title;
    _description = description;
    _audioFile = audioFile;
    _showNotes = showNotes;
  }
  return self;
}

+ (NSArray *)podcasts {

  Podcast *episode1 = [[Podcast alloc] initWithEpisodeNumber:1 title:@"Episode 1: Introduction" description:@"In this episode, we talk to Mike Daley about his experiences running his own small company creating game development tools, writing books, and learning OpenGL. We also have a fun discussion about mobile vs. console games, a deep dive into Sprite Kit, and learn about some cool new Blender and OpenGL tutorials." audioFile:[[NSBundle mainBundle] URLForResource:@"Episode1" withExtension:@"mp3"] showNotes:[NSURL URLWithString:@"http://www.raywenderlich.com/57455/introducing-the-raywenderlich-com-podcast-episode-1"]];
  Podcast *episode2 = [[Podcast alloc] initWithEpisodeNumber:2 title:@"Episode 2: Objective-C Style and Runtime" description:@"In episode 2 of the raywenderlich.com podcast, we cover Objective-C style and runtime with Matt Galloway and Nick Waynik." audioFile:[[NSBundle mainBundle] URLForResource:@"Episode2" withExtension:@"mp3"] showNotes:[NSURL URLWithString:@"http://www.raywenderlich.com/62821/objective-c-style-and-runtime-podcast"]];
  Podcast *episode3 = [[Podcast alloc] initWithEpisodeNumber:3 title:@"Episode 3: Cocoa Design Patterns" description:@"A discussion of Cocoa Design patterns such as MVC, delegates, observers, and more - plus our take on the recent controversies around app name trademarks." audioFile:[[NSBundle mainBundle] URLForResource:@"Episode3" withExtension:@"mp3"] showNotes:[NSURL URLWithString:@"http://www.raywenderlich.com/65167/cocoa-design-patterns-raywenderlich-com-podcast-episode-3"]];
  return @[episode1, episode2, episode3];
  
}

@end
