//
//  ViewController.m
//  VideoGames
//
//  Created by Brian Moakley on 4/14/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "ViewController.h"
#import "RWTXMLVideoGameParser.h"
#import "RWTVideoGame.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *gameName;
@property (weak, nonatomic) IBOutlet UILabel *genre;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UITextView *synopsis;
@property (strong, nonatomic) NSArray *videoGames;
@property (assign, nonatomic) NSInteger index;

@end

// Challenge Instructions

// First set a breakpoint once the app has loaded. A good place may be on a button press
// Once your app is paused, first load the xml in an lldb variable
// Create a new RWTXMLVideoGameParser object
// Pass in the next xml (other_video_games.xml) to the parser object
// Retrieve the results and place them in self.videogames.
// Check out [ViewController viewDidLoad] to see the parsing code. Use that code as a guide.

// Note: LLDB may have issues when assigning objects via. properties. Default to calling methods.

// Good luck! :]


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    RWTXMLVideoGameParser *videoGameParser = [[RWTXMLVideoGameParser alloc] init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"video_games" ofType:@"xml"];
    videoGameParser.xml = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    self.videoGames = [videoGameParser parseFeed];
    self.index = 0;
}

-(void) viewWillAppear:(BOOL)animated
{
    [self updateUI];
}

- (IBAction)previousTap:(id)sender {
    if (self.index > 0)
    {
        self.index -= 1;
    }
    [self updateUI];
}

- (IBAction)nextTap:(id)sender
{
    if (self.index < self.videoGames.count-1)
    {
        self.index += 1;
    }
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) updateUI
{
    RWTVideoGame *videoGame = self.videoGames[self.index];
    self.gameName.text = videoGame.name;
    self.genre.text = videoGame.genre;
    self.rating.text = [NSString stringWithFormat:@"%d", videoGame.rating];
    self.synopsis.text = videoGame.synopsis;
}


@end
