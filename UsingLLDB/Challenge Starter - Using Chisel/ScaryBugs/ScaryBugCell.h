//
//  ScaryBugCell.h
//  ScaryBugs
//
//  Created by Main Account on 10/31/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScaryBugCell : UITableViewCell

@property (weak) IBOutlet UIImageView * bugImageView;
@property (weak) IBOutlet UILabel * bugTitleLabel;
@property (weak) IBOutlet UILabel * bugSubtitleLabel;
@property (weak) IBOutlet UIImageView * bugScaryImage;

@end
