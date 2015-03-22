//
//  MyContainerViewController.m
//  MyPodcast
//
//  Created by Murali Korukonda on 17/6/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "MyContainerViewController.h"
#import "MyPodcastViewController.h"
#import "MyAudioViewController.h"
#import "Podcast.h"

@interface MyContainerViewController ()

@end

@implementation MyContainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"embedPodcast"]) {
        MyPodcastViewController *myPodcastVC = (MyPodcastViewController *)[segue destinationViewController];
        myPodcastVC.podcast = self.podcast;
    }
    else if([[segue identifier] isEqualToString:@"embedAudio"]){
        MyAudioViewController *myAudioVC = (MyAudioViewController *)[segue destinationViewController];
        myAudioVC.audioFile = self.podcast.audioFile;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
