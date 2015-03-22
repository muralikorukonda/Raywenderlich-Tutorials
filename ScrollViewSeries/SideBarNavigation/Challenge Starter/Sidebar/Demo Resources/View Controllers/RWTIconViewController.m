//
//  RWTIconViewController.m
//  Sidebar
//
//  Created by Main Account on 4/23/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTIconViewController.h"

@interface RWTIconViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation RWTIconViewController

- (void)viewWillAppear:(BOOL)animated {
  self.imageView.image = self.image;
}

@end
