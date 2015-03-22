//
//  OTRFavoritesViewController.m
//  OldTimeRadio
//
//  Created by Brian Moakley on 6/2/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "OTRFavoritesViewController.h"
#import "OTRLibrary.h"
#import "Episode.h"
#import "FSAudioController.h"
#import "FSPlayerViewController.h"
#import "Favorite.h"
#import "Episode.h"

@interface OTRFavoritesViewController () <UINavigationBarDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController * fetchController;
@end

@implementation OTRFavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(UIBarPosition) positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchController.sections[section];
    return [sectionInfo objects].count;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchController.sections[indexPath.section];
    Episode * episode = [[sectionInfo objects] objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"PlayEpisode" sender:episode];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Favorite * favorite = [self.fetchController objectAtIndexPath:indexPath];
    Episode * episode = (Episode *) favorite.episode;
    
    cell.textLabel.text = episode.title;
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PlayEpisode"])
    {
        Favorite * favorite = (Favorite *) sender;
        FSAudioController * audioController = [[FSAudioController alloc] init];
        FSPlayerViewController * fpViewController = segue.destinationViewController;
        fpViewController.currentEpisode = (Episode *) favorite.episode;
        
        Episode * episode = (Episode *) favorite.episode;
        audioController.url = [NSURL URLWithString:episode.fileLocation];
        [audioController play];
        
        fpViewController.audioController = audioController;
        fpViewController.currentEpisode = (Episode *)favorite.episode;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    OTRLibrary * library = [OTRLibrary sharedLibrary];

    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entityDescription = [NSEntityDescription entityForName:@"Favorite" inManagedObjectContext:library.managedObjectContext];
    [fetchRequest setEntity:entityDescription];
    NSSortDescriptor * sort = [[NSSortDescriptor alloc] initWithKey:@"episode.title" ascending:YES];
    [fetchRequest setSortDescriptors:@[sort]];
    
    self.fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:library.managedObjectContext sectionNameKeyPath:nil cacheName:@"FavoriteListing"];
    self.fetchController.delegate = self;
    [self.fetchController performFetch:nil];
    
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
