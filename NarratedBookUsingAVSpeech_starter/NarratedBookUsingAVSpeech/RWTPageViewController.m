//
//  RWTPageViewController.m
//  NarratedBookUsingAVSpeech
//
//  Created by Republic of Apps, LLC on 2/1/14.
//  Copyright (c) 2014 RepublicOfApps, LLC. All rights reserved.
//

#import "RWTPageViewController.h"
#import "RWTBook.h"
#import "RWTPage.h"
@import AVFoundation;

#pragma mark - Class Extension

@interface RWTPageViewController ()
@property (nonatomic, strong) RWTBook *book;
@property (nonatomic, assign) NSUInteger currentPageIndex;
@property (nonatomic,strong) AVSpeechSynthesizer *synthesizer;
@property (nonatomic, assign) NSUInteger nextSpeechIndex;

@end

@implementation RWTPageViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];

//  [self setupBook:[RWTBook testBook]];
  NSString *path = [[NSBundle mainBundle] pathForResource:@"WhirlySquirrelly" ofType:@"plist"];
  [self setupBook:[RWTBook bookWithContentsOfFile:path]];

  UISwipeGestureRecognizer *swipeNext = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gotoNextPage)];
  swipeNext.direction = UISwipeGestureRecognizerDirectionLeft;
  [self.view addGestureRecognizer:swipeNext];

  UISwipeGestureRecognizer *swipePrevious = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gotoPreviousPage)];
  swipePrevious.direction = UISwipeGestureRecognizerDirectionRight;
  [self.view addGestureRecognizer:swipePrevious];
  
  [self startSpeaking];
}

#pragma mark - Private

- (RWTPage*)currentPage
{
  return [self.book.pages objectAtIndex:self.currentPageIndex];
}

- (void)setupBook:(RWTBook*)newBook
{
  self.book = newBook;
  self.currentPageIndex = 0;

  [self setupForCurrentPage];
}

- (void)setupForCurrentPage
{
  self.pageTextLabel.text = [self currentPage].displayText;
  self.pageImageView.image = [self currentPage].backgroundImage;
  self.nextSpeechIndex = 0;
}

- (void)gotoNextPage
{
  if ([self.book.pages count] == 0 || self.currentPageIndex == [self.book.pages count] - 1) {
    return;
  }

  self.currentPageIndex += 1;
  [self setupForCurrentPage];
    [self startSpeaking];
}

- (void)gotoPreviousPage
{
  if (self.currentPageIndex == 0) {
    return;
  }

  self.currentPageIndex -= 1;
  [self setupForCurrentPage];
    [self startSpeaking];
}

#pragma mark - Speech Management

- (void)speakNextUtterance
{
  // 1
  if (self.nextSpeechIndex < [[self currentPage].utterances count]) {
    // 2
    AVSpeechUtterance *utterance = [[self currentPage].utterances objectAtIndex:self.nextSpeechIndex];
    self.nextSpeechIndex    += 1;
    
    // 3
    [self.synthesizer speakUtterance:utterance];
  }
}

- (void)startSpeaking
{
  if (!self.synthesizer) {
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    // 1
    self.synthesizer.delegate = self;
  }
  
  [self speakNextUtterance];
}
#pragma mark - AVSpeechSynthesizerDelegate Protocol

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance*)utterance
{
  NSUInteger indexOfUtterance = [[self currentPage].utterances indexOfObject:utterance];
  if (indexOfUtterance == NSNotFound) {
    return;
  }
  
  [self speakNextUtterance];
}

@end
