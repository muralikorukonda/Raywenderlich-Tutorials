//
//  MyAudioViewController.m
//  MyPodcast
//
//  Created by Main Account on 2/6/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "MyAudioViewController.h"

@import AVFoundation;

@interface MyAudioViewController ()
@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;
@property (assign) BOOL isPlaying;
@property (strong, nonatomic) AVAudioPlayer *player;
@end

@implementation MyAudioViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.audioFile error:nil];
}

- (IBAction)rewindTapped:(id)sender {
  self.player.currentTime -= 15;
}

- (IBAction)playPauseTapped:(id)sender {
  self.isPlaying = !self.isPlaying;
  
  if (self.isPlaying) {
    [self.playPauseButton setTitle:@"||" forState:UIControlStateNormal];
    [self.player play];
  } else {
    [self.playPauseButton setTitle:@"|>" forState:UIControlStateNormal];
    [self.player pause];
  }
  
}

- (IBAction)fastForwardTapped:(id)sender {
  self.player.currentTime += 15;
}

@end
