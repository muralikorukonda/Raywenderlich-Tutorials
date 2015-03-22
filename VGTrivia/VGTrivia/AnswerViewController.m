//
//  AnswerViewController.m
//  VGTrivia
//
//  Created by Murali Korukonda on 5/6/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *correctAnswerLabel;

@end

@implementation AnswerViewController

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

-(void)viewWillAppear:(BOOL)animated{
    if (self.guessedAnswer == self.question.rightAnswer) {
        self.statusLabel.text = @"Right answer!";
    }
    else
        self.statusLabel.text = @"Wrong answer! :[";
    if(self.question.rightAnswer == 1){
        self.correctAnswerLabel.text = [NSString stringWithFormat:@"Right answer is:%@",self.question.answer1];
    }
    else if(self.question.rightAnswer == 2){
        self.correctAnswerLabel.text = [NSString stringWithFormat:@"Right answer is:%@",self.question.answer2];
    }
    else if(self.question.rightAnswer == 3){
        self.correctAnswerLabel.text = [NSString stringWithFormat:@"Right answer is:%@",self.question.answer3];
    }
    else if(self.question.rightAnswer == 4){
        self.correctAnswerLabel.text = [NSString stringWithFormat:@"Right answer is:%@",self.question.answer4];
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
