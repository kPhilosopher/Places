//
//  PlaceTableViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

//#import "PlaceTableViewController.h"
#import "PlaceTableViewController-Internal.h"

#define NUMBER_OF_SECTIONS 1

@implementation PlaceTableViewController
@synthesize flickrDataSource = _flickrDataSource;
@synthesize delegateToTransfer = _delegateToTransfer;

- (id)initWithStyle:(UITableViewStyle)style andWith:(FlickrDataSource *)theFlickrDataSource
{
    self = [super initWithStyle:style];
    if (self) {
		self.dataIndexer = [[[PlacesDataIndexer alloc] init] autorelease];
		self.flickrDataSource = theFlickrDataSource;
		self.flickrDataSource.alertDelegate = self;
	}
    return self;
}

#pragma mark - View lifecycle

- (void)dealloc
{
	[_flickrDataSource release];
	[super dealloc];
}

#pragma mark - Table view data source

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
	return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([[[self getTheElementSections] objectAtIndex:section] count] > 0)
        return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

//TODO: refactor this method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
        cell = 
		[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
	
	cell.detailTextLabel.text = @"";
	cell.textLabel.text = @"";
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	RefinedElement *refinedElement = [self getTheRefinedElementInTheElementSectionsWithThe:indexPath];
	NSString *contentString = [refinedElement.dictionary objectForKey:@"_content"];
	cell.textLabel.text = [contentString extractTheFirstStringWithCommaDelimeter];
	
	if ([contentString enumerateStringToDetermineTheExistanceOfCharacterOfSet:[self characterSetWithOnlyComma]])
	{
		int startingIndexOfSubTitle = [contentString rangeOfCharacterFromSet:[self characterSetWithOnlyComma]].location + 1;
		NSString *subTitle = [contentString substringFromIndex:startingIndexOfSubTitle +1];
		cell.detailTextLabel.text = [subTitle stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	}
	return cell;
}

#pragma mark - Table view delegate

//TODO: refactor this method.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	RefinedElement *refinedElement = [self getTheRefinedElementInTheElementSectionsWithThe:indexPath];
	NSString *placeId = [refinedElement.dictionary objectForKey:@"place_id"];
	PictureListTableViewController *pltvc = [[PictureListTableViewController alloc] initWithStyle:UITableViewStylePlain andWith:[self.flickrDataSource getPhotoListForSpecificFlickrPlaceID:placeId]];
	pltvc.delegate = self.delegateToTransfer;
	
	NSString *contentString = [refinedElement.dictionary objectForKey:@"_content"];
	pltvc.title = [contentString extractTheFirstStringWithCommaDelimeter];
	
	[self.navigationController pushViewController:pltvc animated:YES];
	[pltvc release];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

#pragma mark - Helper method

- (NSCharacterSet *)characterSetWithOnlyComma;
{
	return [NSCharacterSet characterSetWithCharactersInString:@","];
}

#pragma mark - Protocol implementation

- (void)displayAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message;
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

@end