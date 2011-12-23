//
//  TopPlacesTableViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/19/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "TopPlacesTableViewController.h"

@implementation TopPlacesTableViewController
@synthesize delegateToUpdateMostRecentPlaces = _delegateToUpdateMostRecentPlaces;

- (id)initWithStyle:(UITableViewStyle)style andWith:(FlickrDataSource *)theFlickrDataSource
{
    self = [super initWithStyle:style andWith:theFlickrDataSource];
    if (self) {
//		self.rawData = self.flickrDataSource.flickrTopPlacesArray;
		self.title = @"Top Places";
	}
	self.view.accessibilityLabel = @"topPlacesTableView";
    return self;
}

#pragma mark - Methods to override the IndexedTableViewController

- (void)setTheElementSectionsToTheFollowing:(NSMutableArray *)array
{
	self.flickrDataSource.theElementSectionsForTopPlaces = array;
}

- (NSMutableArray *)getTheElementSections
{
	return self.flickrDataSource.theElementSectionsForTopPlaces;
}

- (NSArray *)getTheRawData
{
	return self.flickrDataSource.flickrTopPlacesArray;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - Table view data source

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	RefinedElementForPlaces * refinedElement = [[(NSArray *)[self getTheElementSections] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	NSDictionary *dictionaryToAddToMostRecentList = refinedElement.dictionary;
	[self.flickrDataSource addToTheMostRecentListOfPlacesTheFollowing:dictionaryToAddToMostRecentList];
	[self.delegateToUpdateMostRecentPlaces reIndexTheMostRecentTableViewData];
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
