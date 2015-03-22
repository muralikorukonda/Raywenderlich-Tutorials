//
//  DetailViewController.h
//  ScaryBugs
//
//  Created by Main Account on 10/31/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScaryBug.h"

@interface DetailViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong) ScaryBug * bug;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

- (IBAction)imageTapped:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)textFieldEditingChanged:(id)sender;


@end
