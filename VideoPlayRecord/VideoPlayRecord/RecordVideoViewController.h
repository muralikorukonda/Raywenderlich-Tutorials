//
//  RecordVideoViewController.h
//  VideoPlayRecord
//
//  Created by Murali Korukonda on 23/6/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface RecordVideoViewController : UIViewController

- (IBAction)recordAndPlay:(id)sender;
-(BOOL)startCameraControllerFromViewController:(UIViewController *)viewController usingDelegate:(id)delegate;
-(void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void*)contextInfo;
@end
