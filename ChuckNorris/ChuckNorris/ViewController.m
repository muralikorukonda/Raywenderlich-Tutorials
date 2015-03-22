//
//  ViewController.m
//  ChuckNorris
//
//  Created by Murali Korukonda on 4/5/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import "ViewController.h"
#import "JokeGenerator.h"

@interface ViewController ()

@property (strong) JokeGenerator *jokeGenerator;
@property (weak, nonatomic) IBOutlet UILabel *jokeLabel;
- (IBAction)buttonTapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.jokeGenerator = [[JokeGenerator alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    self.jokeLabel.text = [self.jokeGenerator randomJoke:[self.jokeGenerator jokeTypes][0]];
}
@end
