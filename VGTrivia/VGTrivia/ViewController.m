//
//  ViewController.m
//  VGTrivia
//
//  Created by Murali Korukonda on 2/6/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"
#import "AnswerViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerButton1;
@property (weak, nonatomic) IBOutlet UIButton *answerButton2;
@property (weak, nonatomic) IBOutlet UIButton *answerButton3;
@property (weak, nonatomic) IBOutlet UIButton *answerButton4;

@property (strong) NSArray *questions;
@property (strong) Question *curQuestion;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     Question *question1 = [[Question alloc] initWithQuestion:@"Which character was a twin in Finaly Fantasy II?" answer1:@"Cecil" answer2:@"Kain" answer3:@"Palom" answer4:@"Tellah" rightAnswer:3];
    Question *question2 = [[Question alloc] initWithQuestion:@"Which of these people was a game designer for Deus Ex?" answer1:@"JC Denton" answer2:@"Shigeru Miyamoto" answer3:@"Matt Rix" answer4:@"Warren Spector" rightAnswer:4];
    Question *question3 = [[Question alloc] initWithQuestion:@"Which character was a twin in Finaly Fantasy II?" answer1:@"Cecil" answer2:@"Kain" answer3:@"Palom" answer4:@"Tellah" rightAnswer:3];
    Question *question4 = [[Question alloc] initWithQuestion:@"Which of these people was a game designer for Deus Ex?" answer1:@"JC Denton" answer2:@"Shigeru Miyamoto" answer3:@"Matt Rix" answer4:@"Warren Spector" rightAnswer:4];
    Question *question5 = [[Question alloc] initWithQuestion:@"Which character was a twin in Finaly Fantasy II?" answer1:@"Cecil" answer2:@"Kain" answer3:@"Palom" answer4:@"Tellah" rightAnswer:3];
    self.questions = @[question1,question2,question3,question4,question5];
     */
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *questions = [dictionary objectForKey:@"Questions"];
    NSMutableArray *mutArr = [[NSMutableArray alloc] init];
    for (int i=0;i<[questions count];i++){
        NSString *question = [[questions objectAtIndex:i] objectForKey:@"question"];
        NSString *answer1 = [[questions objectAtIndex:i] objectForKey:@"answer1"];
        NSString *answer2 = [[questions objectAtIndex:i] objectForKey:@"answer2"];
        NSString *answer3 = [[questions objectAtIndex:i] objectForKey:@"answer3"];
        NSString *answer4 = [[questions objectAtIndex:i] objectForKey:@"answer4"];
        int rightAnswer = [[[questions objectAtIndex:i] objectForKey:@"rightAnswer"] integerValue];
        
        Question *questionObj = [[Question alloc] initWithQuestion:question answer1:answer1 answer2:answer2 answer3:answer3 answer4:answer4 rightAnswer:rightAnswer];
        [mutArr addObject:questionObj];
    }
    self.questions = mutArr;
}

-(void)viewWillAppear:(BOOL)animated{
    self.curQuestion = [self.questions objectAtIndex:arc4random()%self.questions.count];
    self.questionLabel.text = self.curQuestion.question;
    [self.answerButton1 setTitle:self.curQuestion.answer1 forState:UIControlStateNormal];
    [self.answerButton2 setTitle:self.curQuestion.answer2 forState:UIControlStateNormal];
    [self.answerButton3 setTitle:self.curQuestion.answer3 forState:UIControlStateNormal];
    [self.answerButton4 setTitle:self.curQuestion.answer4 forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)answerButtonTapped:(id)sender {
    [self performSegueWithIdentifier:@"DisplayAnswer" sender:sender];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"DisplayAnswer"]) {
        AnswerViewController *answerViewController = (AnswerViewController *)segue.destinationViewController;
        answerViewController.question = self.curQuestion;
        if (sender == self.answerButton1) {
            answerViewController.guessedAnswer = 1;
        }
        else if (sender == self.answerButton2) {
            answerViewController.guessedAnswer = 2;
        }
        else if (sender == self.answerButton3) {
            answerViewController.guessedAnswer = 3;
        }
        else if (sender == self.answerButton4) {
            answerViewController.guessedAnswer = 4;
        }
    }
}

- (IBAction)close:(UIStoryboardSegue *)segue {
}
@end
