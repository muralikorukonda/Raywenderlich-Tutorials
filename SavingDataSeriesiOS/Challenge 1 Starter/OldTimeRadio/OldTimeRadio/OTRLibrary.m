//
//  OTRLibrary.m
//  OldTimeRadio
//
//  Created by Brian Moakley on 6/1/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

@import CoreData;
#import "OTRLibrary.h"
#import "OTRShow.h"
#import "OTREpisode.h"
#import "OTRFavorite.h"
#import "OTRSite.h"
#import "FMDB.h"
#import "FMDBManager.h"
#import "Site.h"
#import "RadioShow.h"
#import "Episode.h"
#import "Favorite.h"

@interface OTRLibrary()


@property (strong, nonatomic) NSPersistentStore * presistentStore;
@property (strong, nonatomic) NSPersistentStoreCoordinator * persistentStoreCoordinator;
@property (strong, nonatomic) NSManagedObjectModel * managedObjectModel;
@property (strong, nonatomic) NSArray * shows;
@property (strong, nonatomic) NSArray * episodes;
@property (strong, nonatomic) NSArray * favorites;
@property (strong, nonatomic) NSArray * sites;

@end

@implementation OTRLibrary

- (id)init
{
    self = [super init];
    if (self)
    {
        _episodes = [[NSMutableArray alloc] init];
        _shows = [[NSMutableArray alloc] init];
        _sites = [[NSMutableArray alloc] init];
        _favorites = [[NSMutableArray alloc] init];
    }
    return self;
}



+ (instancetype)sharedLibrary {
    static OTRLibrary *sharedMyManager = nil;
    @synchronized(self) {
        if (sharedMyManager == nil)
        {
            sharedMyManager = [[self alloc] init];
        }
    }
    return sharedMyManager;
}

-(void) initializeLibrary
{
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription * radioEntity = [NSEntityDescription entityForName:@"RadioShow" inManagedObjectContext:self.managedObjectContext];
    NSEntityDescription * episodes = [NSEntityDescription entityForName:@"Episode" inManagedObjectContext:self.managedObjectContext];
    NSEntityDescription * favorite = [NSEntityDescription entityForName:@"Favorite" inManagedObjectContext:self.managedObjectContext];
    NSEntityDescription * site = [NSEntityDescription entityForName:@"Site" inManagedObjectContext:self.managedObjectContext];
    
    fetchRequest.entity = radioEntity;

    self.shows = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];

    fetchRequest.entity = episodes;

    self.episodes = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    fetchRequest.entity = favorite;
    
    self.favorites = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    fetchRequest.entity = site;
    
    self.sites = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
}


-(NSManagedObjectContext *) managedObjectContext
{
    if (_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }
    if (self.persistentStoreCoordinator != nil)
    {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return _managedObjectContext;
}

-(NSPersistentStoreCoordinator *) persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSURL * documentDirectory = [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL * storeFile = [documentDirectory URLByAppendingPathComponent:@"otr.sqlite"];
    
    NSError * error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeFile options:nil error:&error])
    {
        NSLog(@"Error: %@", error);
    }
    return _persistentStoreCoordinator;
}


-(NSManagedObjectModel *) managedObjectModel
{
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    NSURL * modelURL = [[NSBundle mainBundle] URLForResource:@"otr" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

-(void) buildLibraryFromPlist
{
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"old_time_radio" ofType:@"plist"];
    NSURL * plistURL = [NSURL fileURLWithPath:plistPath];
    NSData * data = [NSData dataWithContentsOfURL:plistURL options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary * plist = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:nil errorDescription:nil];
    
    NSArray * shows = plist[@"Shows"];
    
    NSMutableArray * newShows = [[NSMutableArray alloc]init];
    for (NSDictionary * show in shows)
    {
        RadioShow * newShow = [NSEntityDescription insertNewObjectForEntityForName:@"RadioShow" inManagedObjectContext:self.managedObjectContext];
        newShow.title = show[@"Title"];
        newShow.thumbnailFileName = show[@"Thumbnail"];
        newShow.showDescription = show[@"Description"];
        newShow.showId = show[@"Id"];

        [newShows addObject:newShow];
    }

    NSMutableArray * newEpisodes = [[NSMutableArray alloc] init];
    NSArray * episodes = plist[@"Episodes"];
    for (NSDictionary * episode in episodes)
    {
        NSNumber * episodeNumber = @([episode[@"Episode Id"] intValue]);
        Episode * newEpisode = [NSEntityDescription insertNewObjectForEntityForName:@"Episode" inManagedObjectContext:self.managedObjectContext];
        newEpisode.title = episode[@"Title"];
        newEpisode.broadcastDate = episode[@"Broadcast Date"];
        newEpisode.fileLocation = episode[@"File Location"];
        newEpisode.episodeId = episodeNumber;
        
        NSNumber * showNumber = episode[@"Show Id"];
        
        for (RadioShow * radioShow in newShows)
        {
            if (radioShow.showId == showNumber)
            {
                [radioShow addEpisodesObject:newEpisode];
                newEpisode.parentShow = radioShow;
            }
        }
        [newEpisodes addObject:newEpisode];
        
    }
    
    NSArray * sites = plist[@"Sites"];
    for (NSDictionary * site in sites)
    {
        NSNumber * isFree = site[@"Is Free"];
        NSNumber * isMembershipRequired = site[@"Membership Required"];
        
        Site * newSite = [NSEntityDescription insertNewObjectForEntityForName:@"Site" inManagedObjectContext:self.managedObjectContext];
        newSite.name = site[@"Name"];
        newSite.address = site[@"Address"];
        newSite.isFree = isFree;
        newSite.isMembershipRequired = isMembershipRequired;
    }

    NSArray * favorites = plist[@"Favorites"];
    for (NSDictionary * favorite in favorites)
    {
        NSNumber * episodeNumber = favorite[@"Episode Id"];
        Favorite * newFavorite = [NSEntityDescription insertNewObjectForEntityForName:@"Favorite" inManagedObjectContext:self.managedObjectContext];
        newFavorite.note = favorite[@"Note"];
        newFavorite.favoriteDate = favorite[@"Favorite Date"];
        for (Episode * episode in newEpisodes)
        {
            if (episode.episodeId.intValue == episodeNumber.intValue)
            {
                newFavorite.episode = episode;
                episode.favorite = newFavorite;
            }
        }
        
    }
    
    NSError * error;
    if (![self.managedObjectContext save:&error])
    {
        NSLog(@"Error: %@", error);
    }

}

@end
