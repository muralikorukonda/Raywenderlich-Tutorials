//
//  OTREpisodeViewController.m
//  OldTimeRadio
//
//  Created by Brian Moakley on 5/31/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

@import CoreData;
#import "OTREpisodeListingViewController.h"
#import "FSPlayerViewController.h"
#import "OTRLibrary.h"
#import "Episode.h"
#import "FSAudioController.h"

@interface OTREpisodeListingViewController ()<UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView * tableView;
@property (strong, nonatomic) NSFetchedResultsController * fetchController;

@end

@implementation OTREpisodeListingViewController

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchController.sections[section];
    return [sectionInfo objects].count;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchController.sections[indexPath.section];
    Episode * episode = [[sectionInfo objects] objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"EpisodeView" sender:episode];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"EpisodeView"])
    {
        Episode * episode = (Episode *) sender;
        FSPlayerViewController * fpViewController = segue.destinationViewController;
        fpViewController.currentEpisode = episode;
    
        FSAudioController * audioController = [[FSAudioController alloc] init];
        audioController.url = [NSURL URLWithString:episode.fileLocation];
        [audioController play];
        
        fpViewController.audioController = audioController;
        fpViewController.currentEpisode = episode;
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Episode * episode = [self.fetchController objectAtIndexPath:indexPath];
    cell.textLabel.text = episode.title;
    return cell;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    OTRLibrary * library = [OTRLibrary sharedLibrary];

    self.navigationController.title = @"Episodes";
    
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entityDescription = [NSEntityDescription entityForName:@"Episode" inManagedObjectContext:library.managedObjectContext];
    [fetchRequest setEntity:entityDescription];
    NSSortDescriptor * sort = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    [fetchRequest setSortDescriptors:@[sort]];
    
    self.fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:library.managedObjectContext sectionNameKeyPath:nil cacheName:@"EpisodeListing"];
    self.fetchController.delegate = self;
    [self.fetchController performFetch:nil];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
