//
//  DetailViewController.m
//  ScaryBugs
//
//  Created by Main Account on 10/31/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated {
    self.textField.text = self.bug.name;
    self.imageView.image = self.bug.image;
    self.slider.value = self.bug.howScary;
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setImageView:nil];
    [self setSlider:nil];
    [super viewDidUnload];
}

- (IBAction)imageTapped:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = NO;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)sliderValueChanged:(id)sender {
    self.bug.howScary = self.slider.value;
}

- (IBAction)textFieldEditingChanged:(id)sender {
    self.bug.name = self.textField.text;
}

-(void)imagePickerController:(UIImagePickerController *)picker 
  didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.bug.image = image;
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
}
-(void)viewDidAppear:(BOOL)animated{
    
}

@end
