//
//  RWTMenuViewController.m
//  Sidebar
//
//  Created by Main Account on 4/23/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTMenuViewController.h"

@interface RWTMenuViewController ()

@end

@implementation RWTMenuViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

  if (indexPath.row == 0) {
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuViewControllerDidTapSummer:)]) {
      [self.delegate menuViewControllerDidTapSummer:self];
    }
  } else if (indexPath.row == 1) {
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuViewControllerDidTapWinter:)]) {
      [self.delegate menuViewControllerDidTapWinter:self];
    }
  }

}

@end
