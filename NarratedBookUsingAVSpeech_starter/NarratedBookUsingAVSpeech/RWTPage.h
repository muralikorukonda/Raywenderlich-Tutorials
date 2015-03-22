//
//  RWTPage.h
//  NarratedBookUsingAVSpeech
//
//  Created by Republic of Apps, LLC on 2/1/14.
//  Copyright (c) 2014 RepublicOfApps, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AVFoundation;

extern NSString* const RWTPageAttributesKeyUtterances;
extern NSString* const RWTPageAttributesKeyBackgroundImage;
NSString* const RWTUtteranceAttributesKeyUtteranceString = @"utteranceString";
NSString* const RWTUtteranceAttributesKeyUtteranceProperties = @"utteranceProperties";

@interface RWTPage : NSObject

@property (nonatomic, strong, readonly) NSString *displayText;
@property (nonatomic, strong, readonly) UIImage *backgroundImage;
@property (nonatomic, strong, readonly) NSArray *utterances;

+ (instancetype)pageWithAttributes:(NSDictionary*)attributes;

@end
