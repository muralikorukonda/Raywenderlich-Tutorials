//
//  MasterViewController.m
//  ScaryBugs
//
//  Created by Main Account on 10/31/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ScaryBugCell.h"

@implementation MasterViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bugs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScaryBugCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    ScaryBug * bug = [self.bugs objectAtIndex:indexPath.row];
    cell.bugTitleLabel.text = bug.name;
    cell.bugImageView.image = bug.image;
    cell.bugSubtitleLabel.text = [NSString stringWithFormat:@"Scary Factor: %d/5", (int) bug.howScary];
    cell.bugScaryImage.hidden = bug.howScary != 5;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (([segue.identifier isEqualToString:@"showDetail"])) {
        DetailViewController * detailViewController = (DetailViewController *) 
          segue.destinationViewController;
        NSIndexPath * selectedIndex = self.tableView.indexPathForSelectedRow;
        ScaryBug * bug = self.bugs[selectedIndex.row];
        detailViewController.bug = bug;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

@end
