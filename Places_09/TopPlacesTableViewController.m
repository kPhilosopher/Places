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
    if (self) 
	{
		self.title = @"Top Places";
		self.view.accessibilityLabel = @"topPlacesTableView";
//TODO: allow this bar button to refresh the TopPlaces by retrieving a new set of data from FlickrFetcher.
		//		self.navigationItem.rightBarButtonItem = [UIBarButtonItem ]
	}
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	RefinedElement *refinedElement = [self getTheRefinedElementInTheElementSectionsWithThe:indexPath];
	NSDictionary *dictionaryToAddToMostRecentList = refinedElement.dictionary;
	[self.flickrDataSource addToTheMostRecentListOfPlacesTheFollowing:dictionaryToAddToMostRecentList];
	[self.delegateToUpdateMostRecentPlaces reIndexTheMostRecentTableViewData];
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end