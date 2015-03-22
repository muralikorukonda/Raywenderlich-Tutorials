//
//  ViewController.m
//  WatchpointChallenge
//
//  Created by Brian Moakley on 4/28/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "ViewController.h"
#define TOTAL_STATS 6
#define MAX_STAT 18

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *strengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *intelligenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dexterityLabel;
@property (weak, nonatomic) IBOutlet UILabel *charismaLabel;
@property (weak, nonatomic) IBOutlet UILabel *enduranceLabel;
@property (weak, nonatomic) IBOutlet UILabel *luckLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;
@property (assign, nonatomic) float statAverage;

@end

@implementation ViewController

// Challenge Instructions

// Build and run the app and you will notice that one of the variables is producing a weird results.
// Your job is to place a conditional watchpoint on this troublesome variable. (Just a quick hint) this
// variable should never exceed a value of 18

// Next, you should place a breakpoint on line #74 at ViewController.m
// Have this breakpoint run a python command. First, import command.py
// Then have the print_stat function run at the breakpoint.


// Challenge Solution










- (IBAction)generateStats:(id)sender {
    
    for (int i=0; i < TOTAL_STATS; i++)
    {
        int stat = arc4random_uniform(MAX_STAT) + 1;
        NSString * statString = [NSString stringWithFormat:@"%d", stat];
        switch (i) {
            case 0:
                self.strengthLabel.text = statString;
                break;
            case 1:
                self.intelligenceLabel.text = statString;
                break;
            case 2:
                self.dexterityLabel.text = statString;
                break;
            case 3:
                self.charismaLabel.text = statString;
                break;
            case 4:
                self.enduranceLabel.text = statString;
                break;
            case 5:
                self.luckLabel.text = statString;
        }
        self.statAverage += stat;
    }
    self.averageLabel.text = [NSString stringWithFormat:@"%d", (int) self.statAverage / TOTAL_STATS];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
