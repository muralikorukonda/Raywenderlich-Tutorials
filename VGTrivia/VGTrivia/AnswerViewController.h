//
//  AnswerViewController.h
//  VGTrivia
//
//  Created by Murali Korukonda on 5/6/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface AnswerViewController : UIViewController
@property (strong) Question *question;
@property (assign) int guessedAnswer;
@end
