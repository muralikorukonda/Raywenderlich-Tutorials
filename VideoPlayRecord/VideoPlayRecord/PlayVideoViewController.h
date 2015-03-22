//
//  PlayVideoViewController.h
//  VideoPlayRecord
//
//  Created by Murali Korukonda on 23/6/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PlayVideoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)playVideo:(id)sender;
// For opening UIImagePickerController
-(BOOL)startMediaBrowserFromViewController:(UIViewController*)controller usingDelegate:(id )delegate;

@end
