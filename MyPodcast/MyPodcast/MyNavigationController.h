//
//  MyNavigationControllerViewController.h
//  MyPodcast
//
//  Created by Murali Korukonda on 17/6/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Podcast;
@interface MyNavigationController : UINavigationController

@property (strong,nonatomic) Podcast *podcast;
@end
