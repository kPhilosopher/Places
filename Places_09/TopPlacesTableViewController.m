//
//  TopPlacesTableViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/19/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "TopPlacesTableViewController.h"
#import "TopPlacesTableViewController-Internal.h"

@implementation TopPlacesTableViewController
@synthesize delegateToUpdateMostRecentPlaces = _delegateToUpdateMostRecentPlaces;

NSString *TopPlacesViewAccessibilityLabel = @"Top places table";

#pragma mark - Initialization

- (id)initWithStyle:(UITableViewStyle)style withTheFlickrDataSource:(FlickrDataSource *)theFlickrDataSource withTheDataIndexer:(DataIndexer *)dataIndexer;
{
    self = [super initWithStyle:style withTheFlickrDataSource:theFlickrDataSource withTheDataIndexer:dataIndexer];
    if (self) 
	{
		[self.flickrDataSource setupForTopPlacesArrayFromFlickr];
		self.title = @"Top Places";
		self.view.accessibilityLabel = TopPlacesViewAccessibilityLabel;
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refreshTheTopPlacesList)];
	}
    return self;
}

- (void)refreshTheTopPlacesList;
{
	[self.flickrDataSource setupForTopPlacesArrayFromFlickr];
	[self reIndexTheTableViewData];
}

#pragma mark - Methods to override the IndexedTableViewController

- (void)setTheElementSectionsToTheFollowingArray:(NSMutableArray *)array
{
	self.flickrDataSource.theElementSectionsForTopPlaces = array;
}

- (NSMutableArray *)fetchTheElementSections
{
	return self.flickrDataSource.theElementSectionsForTopPlaces;
}

- (NSArray *)fetchTheRawData
{
	return self.flickrDataSource.flickrTopPlacesArray;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	RefinedElement *refinedElement = [self getTheRefinedElementInTheElementSectionsWithTheIndexPath:indexPath];
	NSDictionary *dictionaryToAddToMostRecentList = refinedElement.dictionary;
	[self.flickrDataSource addToTheMostRecentListOfPlacesTheFollowing:dictionaryToAddToMostRecentList];
	[self.delegateToUpdateMostRecentPlaces reIndexTheTableViewData];
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
