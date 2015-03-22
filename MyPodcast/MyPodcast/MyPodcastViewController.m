//
//  MyPodcastViewController.m
//  MyPodcast
//
//  Created by Main Account on 2/6/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "MyPodcastViewController.h"
#import "Podcast.h"
#import "MyShowNotesViewController.h"

@interface MyPodcastViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation MyPodcastViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.podcast) {
      self.titleLabel.text = self.podcast.title;
      self.descriptionLabel.text = self.podcast.description;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowNotes"]) {
        MyShowNotesViewController *vc = (MyShowNotesViewController *)
        segue.destinationViewController;
        vc.podcast = self.podcast;
    }
}

@end
