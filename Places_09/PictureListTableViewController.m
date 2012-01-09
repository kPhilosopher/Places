//
//  PictureListTableViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 11/21/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PictureListTableViewController.h"

@implementation PictureListTableViewController
@synthesize listOfPictures_theModel = _listOfPictures_theModel;
@synthesize listOfPicturesIndexed_theModel = _listOfPicturesIndexed_theModel;
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewStyle)style andWith:(NSArray *)pictureList
{
    self = [super initWithStyle:style];
    if (self) {
		if (pictureList)
		{
			self.dataIndexer = [[[PictureListDataIndexer alloc] init] autorelease];
			self.listOfPictures_theModel = pictureList;
		}
    }
	self.view.accessibilityLabel = @"pictureListTableView";
    return self;
}

#pragma mark - Methods to override the IndexedTableViewController

- (void)setTheElementSectionsToTheFollowingArray:(NSMutableArray *)array
{
	self.listOfPicturesIndexed_theModel = array;
}

- (NSMutableArray *)fetchTheElementSections
{
	return self.listOfPicturesIndexed_theModel;
}

- (NSArray *)fetchTheRawData
{
	return self.listOfPictures_theModel;
}

#pragma mark - View lifecycle

- (void)dealloc
{
	[_listOfPictures_theModel release];
	[_listOfPicturesIndexed_theModel release];
	[super dealloc];
}

#pragma mark - Table view data source
//TODO: refactor this method.
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([[[self fetchTheElementSections] objectAtIndex:section] count] > 0)
	{
		RefinedElement *refinedElement = [[[self fetchTheElementSections] objectAtIndex:section] objectAtIndex:0];
		if ([refinedElement.name intValue] == 0) {
			return @"Right Now";
		}
        return [[NSString stringWithFormat:@"%d",[refinedElement.name intValue]] stringByAppendingString:@" Hour(s) Ago"];
    }
    return nil;
}

//TODO: refactor this method.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.detailTextLabel.text = @"";
	cell.textLabel.text = @"";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	RefinedElement *refinedElement = [self getTheRefinedElementInTheElementSectionsWithTheIndexPath:indexPath];
	NSDictionary *cellDictionary = refinedElement.dictionary;
	id temporaryTitleString = [cellDictionary objectForKey:@"title"];
	id temporaryDescriptionDictionary = [cellDictionary objectForKey:@"description"];
	id temporaryDescriptionString = nil;
	if ([temporaryDescriptionDictionary isKindOfClass:[NSDictionary class]]) {
		temporaryDescriptionString = [temporaryDescriptionDictionary objectForKey:@"_content"];
	}
	
	NSString *titleString = nil;
	NSString *subTitleString = nil;
	if ([temporaryTitleString isKindOfClass:[NSString class]])
	{
		titleString = (NSString *)temporaryTitleString;
	}
	if ([temporaryDescriptionString isKindOfClass:[NSString class]]) {
		subTitleString = (NSString *)temporaryDescriptionString;
	}
	
	if ([titleString length] == 0) 
	{
		titleString = subTitleString;		
		if ([subTitleString length] == 0) {
			titleString = @"Unknown";
		}
		subTitleString = @"";
	}

	cell.textLabel.text = [titleString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	if (!([subTitleString length] == 0))
	{
		cell.detailTextLabel.text = [subTitleString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	}
	return cell;
}

#pragma mark - Table view delegate

- (BOOL)currentDeviceIsiPad_DetermineThatWith:(UIViewController *)imageController
{
	return imageController.view.window == nil;
}

//TODO: refactor this method. Also, stop the flow into the image controller if the data given from the FlickrFetcher is not valid.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	RefinedElement *refinedElement = [self getTheRefinedElementInTheElementSectionsWithTheIndexPath:indexPath];
	UIImage *image = [UIImage imageWithData:[FlickrFetcher imageDataForPhotoWithFlickrInfo:refinedElement.dictionary format:FlickrFetcherPhotoFormatLarge]];
	
	ScrollableImageViewController *imageController = [self.delegate getScrollableImageViewControllerForRequestor:self];
	if ([self currentDeviceIsiPad_DetermineThatWith:imageController]) 
		[self.navigationController pushViewController:imageController animated:YES];
	[imageController initiateTheImageSetupWithGiven:image];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end