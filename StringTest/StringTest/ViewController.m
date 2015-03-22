//
//  ViewController.m
//  StringTest
//
//  Created by Main Account on 1/7/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"Test Label: %@ (%d)", self.testLabel.text, self.testLabel.text.length);
//	for(int i = 0; i < self.testLabel.text.length; ++i) {
//        unichar myChar = [self.testLabel.text characterAtIndex:i];
//        NSLog(@"Char %d: 0x%04X", i, myChar);
//    }
//    
//    NSLog(@"UTF32 Characters");
//    const char * utf32String = [self.testLabel.text cStringUsingEncoding:NSUTF32StringEncoding];
//    uint32_t * uint32String = (uint32_t *)utf32String;
//    while (*uint32String != '\0') {
//        NSLog(@"0x%04X", *uint32String);
//        uint32String++;
//    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
