//
//  OTRSitesViewController.m
//  OldTimeRadio
//
//  Created by Brian Moakley on 6/2/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "OTRSitesViewController.h"
#import "OTRLibrary.h"
#import "Site.h"

@interface OTRSitesViewController () <UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController * fetchController;

@end

@implementation OTRSitesViewController

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchController.sections[section];
    return [sectionInfo objects].count;
}

-(UIBarPosition) positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchController.sections[indexPath.section];
    Site * site = [[sectionInfo objects] objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"PlayEpisode" sender:site];

}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Site * site = [self.fetchController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = site.name;
    return cell;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    OTRLibrary * sharedLibrary = [OTRLibrary sharedLibrary];
    
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entityDescription = [NSEntityDescription entityForName:@"Site" inManagedObjectContext:sharedLibrary.managedObjectContext];
    [fetchRequest setEntity:entityDescription];
    NSSortDescriptor * sort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [fetchRequest setSortDescriptors:@[sort]];
    
    self.fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:sharedLibrary.managedObjectContext sectionNameKeyPath:nil cacheName:@"SiteListing"];
    self.fetchController.delegate = self;
    [self.fetchController performFetch:nil];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
