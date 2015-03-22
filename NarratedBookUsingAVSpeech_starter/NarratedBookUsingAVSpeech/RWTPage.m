//
//  RWTPage.m
//  NarratedBookUsingAVSpeech
//
//  Created by Republic of Apps, LLC on 2/1/14.
//  Copyright (c) 2014 RepublicOfApps, LLC. All rights reserved.
//

#import "RWTPage.h"

#pragma mark - External Constants

NSString* const RWTPageAttributesKeyUtterances = @"utterances";
NSString* const RWTPageAttributesKeyBackgroundImage = @"backgroundImage";

#pragma mark - Class Extension

@interface RWTPage ()
@property (nonatomic, strong, readwrite) NSString *displayText;
@property (nonatomic, strong, readwrite) UIImage *backgroundImage;
@property (nonatomic, strong, readwrite) NSArray *utterances;
@end

@implementation RWTPage

#pragma mark - Public

+ (instancetype)pageWithAttributes:(NSDictionary*)attributes
{
  RWTPage *page = [[RWTPage alloc] init];
  
  if ([[attributes objectForKey:RWTPageAttributesKeyUtterances] isKindOfClass:[NSString class]]) {
    page.displayText = [attributes objectForKey:RWTPageAttributesKeyUtterances];
    page.backgroundImage = [attributes objectForKey:RWTPageAttributesKeyBackgroundImage];
    // 1
    page.utterances  = @[[[AVSpeechUtterance alloc] initWithString:page.displayText]];
  } else if ([[attributes objectForKey:RWTPageAttributesKeyUtterances] isKindOfClass:[NSArray class]]) {
    NSMutableArray *utterances = [NSMutableArray arrayWithCapacity:31];
    NSMutableString *displayText = [NSMutableString stringWithCapacity:101];
    
    for (NSDictionary *utteranceAttributes in [attributes objectForKey:RWTPageAttributesKeyUtterances]) {
      NSString *utteranceString =
      [utteranceAttributes objectForKey:RWTUtteranceAttributesKeyUtteranceString];
      NSDictionary *utteranceProperties =
      [utteranceAttributes objectForKey:RWTUtteranceAttributesKeyUtteranceProperties];
      
      AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:utteranceString];
      [utterance setValuesForKeysWithDictionary:utteranceProperties];
      
      if (utterance) {
        [utterances addObject:utterance];
        [displayText appendString:utteranceString];
      }
    }
    
    page.displayText = displayText;
    page.backgroundImage = [UIImage imageNamed:[attributes objectForKey:RWTPageAttributesKeyBackgroundImage]];
    // 2
    page.utterances  = [utterances copy];
  }
  
  return page;
}

@end
