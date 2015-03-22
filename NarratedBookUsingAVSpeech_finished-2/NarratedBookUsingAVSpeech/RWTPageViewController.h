//
//  RWTPageViewController.h
//  NarratedBookUsingAVSpeech
//
//  Created by Republic of Apps, LLC on 2/1/14.
//  Copyright (c) 2014 RepublicOfApps, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVFoundation;

// 1
@interface RWTPageViewController : UIViewController<AVSpeechSynthesizerDelegate>

@property (nonatomic, weak) IBOutlet UILabel *pageTextLabel;
@property (nonatomic, weak) IBOutlet UIImageView *pageImageView;

@end