//
//  RWTViewController.m
//  AppTutorial
//
//  Created by Main Account on 4/22/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTTutorialStepViewController.h"
#import "RWTTutorialPage.h"

@interface RWTTutorialStepViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation RWTTutorialStepViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  if (self.page == nil) {
    self.page = [RWTTutorialPage allPages][0];
  }
  
  self.bgImageView.image = self.page.bgImage;
  self.iconImageView.image = self.page.iconImage;
  
  UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20.0];
  NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
  [style setLineSpacing:10.f];
  [style setAlignment:NSTextAlignmentCenter];
  
  NSDictionary *attrs = @{
  NSFontAttributeName: font,
  NSParagraphStyleAttributeName: style };
  
  self.textLabel.attributedText = [[NSAttributedString alloc] initWithString:self.page.text attributes:attrs];
}

@end
