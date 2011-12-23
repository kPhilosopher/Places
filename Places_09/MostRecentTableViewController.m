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

- (id)initWithStyle:(UITableViewStyle)style andWith:(FlickrDataSource *)theFlickrDataSource
{
	self = [super initWithStyle:style andWith:theFlickrDataSource];
    if (self) {
		self.title = @"Most Recent";
    }
	self.view.accessibilityLabel = @"mostRecentTableView";
    return self;
}

#pragma mark - Methods to override the IndexedTableViewController

- (void)setTheElementSectionsToTheFollowing:(NSMutableArray *)array
{
	self.flickrDataSource.theElementSectionsForMostRecentPlaces = array;
}

- (NSMutableArray *)getTheElementSections
{
	return self.flickrDataSource.theElementSectionsForMostRecentPlaces;
}

- (NSArray *)getTheRawData
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

- (void)reIndexTheMostRecentTableViewData
{
	[super viewDidLoad];
	[self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		NSArray *array = [[self getTheElementSections] objectAtIndex:indexPath.section];
		RefinedElementForPlaces *refinedPlace = [array objectAtIndex:indexPath.row];
		[self.flickrDataSource deleteFromMostRecentListThePlaceWithTheFollowing:refinedPlace.dictionary];
		[super viewDidLoad];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
		
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert)
	{
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

#pragma mark - Table view delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleDelete;
}

@end
