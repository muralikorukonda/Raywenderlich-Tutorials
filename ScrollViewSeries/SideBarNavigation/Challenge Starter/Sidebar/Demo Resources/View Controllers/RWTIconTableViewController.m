//
//  RWTIconTableViewController.m
//  Sidebar
//
//  Created by Main Account on 4/23/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTIconTableViewController.h"
#import "RWTIconSet.h"
#import "RWTIcon.h"
#import "RWTIconViewController.h"

@interface RWTIconTableViewController ()
@property (strong, nonatomic) NSArray *icons;
@end

@implementation RWTIconTableViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  NSArray *iconSets = [RWTIconSet iconSets];
  RWTIconSet *set = (RWTIconSet *)iconSets[self.iconSetIndex];
  self.icons = set.icons;
  self.navigationItem.title = set.name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.icons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IconCell"forIndexPath:indexPath];
  
  // Configure the cell
  RWTIcon *icon = self.icons[indexPath.row];
  cell.textLabel.text = icon.title;
  cell.detailTextLabel.text = icon.subtitle;
  cell.imageView.image = icon.image;
  
  return cell;  
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"ShowIcon"]) {
    RWTIconViewController *vc = (RWTIconViewController *)segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    RWTIcon *icon = self.icons[indexPath.row];
    vc.image = icon.image;
  }
}

- (IBAction)menuButtonTapped:(id)sender {
  if (self.delegate && [self.delegate respondsToSelector:@selector(iconTableViewControllerDidTapMenuButton:)]) {
    [self.delegate iconTableViewControllerDidTapMenuButton:self];
  }
}

@end
