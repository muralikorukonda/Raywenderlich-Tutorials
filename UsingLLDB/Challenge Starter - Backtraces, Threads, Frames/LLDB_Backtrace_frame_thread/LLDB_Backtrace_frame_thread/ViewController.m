//
//  ViewController.m
//  LLDB_Backtrace_frame_thread
//
//  Created by Brian Moakley on 4/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "ViewController.h"
#import "InterestCalculator.h"

// Challenge Instructions

// There's an error in this interest calculator. The error is not in the formula itself, but how it is getting one of the values in that formula.
// The calculater is launched in another thread. Your job is pause the app, then by using the backtrace, thread, and frame commands,
// find the bug and fix it while the program is still running.


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *principalField;
@property (weak, nonatomic) IBOutlet UITextField *rateField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UILabel *interestAmount;

@end

@implementation ViewController

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

- (IBAction)calcuateInterest:(id)sender
{
    [self dismissKeyboard];
    self.interestAmount.hidden = NO;
    
    float principal = [self.principalField.text floatValue];
    float interest = [self.rateField.text floatValue];
    NSInteger years = [self.yearField.text integerValue];
    
    if (principal == 0 || interest == 0 || years == 0)
    {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Incomplete Form"
                                                            message:@"You must provide all the fields"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        [NSThread detachNewThreadSelector:@selector(performCalculation:) toTarget:self withObject:@{ @"interest" : @(interest), @"principal" : @(principal),  @"years" : @(years)}];
    }
}

-(void) updateUI: (NSNumber *) interest
{
    self.interestAmount.hidden = NO;
    self.interestAmount.text = [NSString stringWithFormat:@"%.2f", interest.floatValue];
}

-(void) performCalculation: (NSDictionary *) values
{
    @autoreleasepool {
        InterestCalculator * interestCalc = [[InterestCalculator alloc] init];
        interestCalc.rate = [values[@"interest"] floatValue];
        interestCalc.principal = [values[@"principal"] floatValue];
        interestCalc.time = [values[@"years"] floatValue];
        float interest = [interestCalc calculateInterest];
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:@(interest) waitUntilDone:NO];
    }
}

-(void) dismissKeyboard
{
    for (UIView * view in self.view.subviews)
    {
        if ([view isFirstResponder])
        {
            [view resignFirstResponder];
        }
    }
}

@end
