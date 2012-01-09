//
//  MostRecentTableViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 11/18/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "MostRecentTableViewController.h"

#define NUMBER_OF_SECTIONS 1

@implementation MostRecentTableViewController

- (id)initWithStyle:(UITableViewStyle)style withTheFlickrDataSource:(FlickrDataSource *)theFlickrDataSource withTheDataIndexer:(DataIndexer *)dataIndexer;
{
	self = [super initWithStyle:style withTheFlickrDataSource:theFlickrDataSource withTheDataIndexer:dataIndexer];
    if (self) {
		[self.flickrDataSource setupThePropertyForMostRecentPlaces];
		self.title = @"Most Recent";
		self.view.accessibilityLabel = @"mostRecentTableView";
    }
    return self;
}

#pragma mark - Methods to override the IndexedTableViewController

- (void)setTheElementSectionsToTheFollowingArray:(NSMutableArray *)array
{
	self.flickrDataSource.theElementSectionsForMostRecentPlaces = array;
}

- (NSMutableArray *)fetchTheElementSections
{
	return self.flickrDataSource.theElementSectionsForMostRecentPlaces;
}

- (NSArray *)fetchTheRawData
{
	return self.flickrDataSource.flickrMostRecentPlacesArray;
}

#pragma mark - View lifecycle

- (void) loadView
{
	[super loadView];
	self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
}

#pragma mark - Table view data source

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		//TODO: refactor the two lines into the helper method in the IndexerTableViewController
		NSArray *array = [[self fetchTheElementSections] objectAtIndex:indexPath.section];
		RefinedElementForPlaces *refinedPlace = [array objectAtIndex:indexPath.row];
		[self.flickrDataSource deleteFromMostRecentListThePlaceWithTheFollowing:refinedPlace.dictionary];
		[super viewDidLoad];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert)
	{ }   
}

#pragma mark - Table view delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleDelete;
}

@end