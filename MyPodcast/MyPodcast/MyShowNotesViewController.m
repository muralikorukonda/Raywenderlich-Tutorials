//
//  MyShowNotesViewController.m
//  MyPodcast
//
//  Created by Main Account on 2/6/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "MyShowNotesViewController.h"
#import "Podcast.h"

@interface MyShowNotesViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation MyShowNotesViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:self.podcast.showNotes];
	[self.webView loadRequest:request];
}

@end
