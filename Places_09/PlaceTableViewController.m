//
//  PlaceTableViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PlaceTableViewController.h"

#define NUMBER_OF_SECTIONS 1

@implementation PlaceTableViewController
@synthesize flickrDataSource = _flickrDataSource;
@synthesize delegateToTransfer = _delegateToTransfer;

- (id)initWithStyle:(UITableViewStyle)style andWith:(FlickrDataSource *)theFlickrDataSource
{
    self = [super initWithStyle:style];
    if (self) {
		self.flickrDataSource = theFlickrDataSource;
	}
    return self;
}

#pragma mark - View lifecycle
- (void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections
{
	NSArray *sortedSection = [[UILocalizedIndexedCollation currentCollation] sortedArrayFromArray:sectionArray collationStringSelector:@selector(name)];
	[elementSections addObject:sortedSection];
}

- (void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
{
	RefinedElementForPlaces	*refinedElement = [[RefinedElementForPlaces alloc] init];
	refinedElement.name = [RefinedElementForPlaces extractNameFrom:rawElement];
	refinedElement.dictionary = rawElement;
	[temporaryDataElements addObject:refinedElement];
	[refinedElement release];
}

- (void)setTheSectionNumberForEach:(RefinedElement *)refinedElement
{
	NSInteger sectionNumber = [[UILocalizedIndexedCollation currentCollation] sectionForObject:refinedElement collationStringSelector:@selector(name)];
	refinedElement.sectionNumber = sectionNumber;
}

- (void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements
{
	for (RefinedElement *refinedElement in temporaryDataElements) {
		[self setTheSectionNumberForEach:refinedElement];
	}
}

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
    if ([[[self getTheElementSections] objectAtIndex:section] count] > 0) {
        return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
    }
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
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
//	NSArray *sectionArray = [[self getTheElementSections] objectAtIndex:indexPath.section];
//	RefinedElementForPlaces *refinedElement = (RefinedElementForPlaces *)[sectionArray objectAtIndex:indexPath.row];
//	RefinedElementForPlaces *refinedElement = [(NSArray *)[[self getTheElementSections] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	RefinedElement *refinedElement = [self getTheRefinedElementInTheElementSectionsWithThe:indexPath];
	
	NSString *contentString = [refinedElement.dictionary objectForKey:@"_content"];
	NSArray *arrayOfContentString = [contentString componentsSeparatedByString:@","];
	NSString *titleString = [arrayOfContentString objectAtIndex:0];
	cell.textLabel.text = [titleString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	
	if ([arrayOfContentString count] > 1)
	{
		NSString *subTitle = [contentString substringFromIndex:titleString.length +1];
		cell.detailTextLabel.text = [subTitle stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	}
	return cell;
}

#pragma mark - Table view delegate

//TODO: refactor this method.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
//	RefinedElementForPlaces *refinedElement = [(NSArray *)[[self getTheElementSections] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	RefinedElement *refinedElement = [self getTheRefinedElementInTheElementSectionsWithThe:indexPath];
	NSString *placeId = [refinedElement.dictionary objectForKey:@"place_id"];
	PictureListTableViewController *pltvc = [[PictureListTableViewController alloc] initWithStyle:UITableViewStylePlain andWith:[self.flickrDataSource retrievePhotoListForSpecific:placeId]];
	pltvc.delegate = self.delegateToTransfer;
	
	NSString *contentString = [refinedElement.dictionary objectForKey:@"_content"];
	NSArray *arrayOfContentString = [contentString componentsSeparatedByString:@","];
	NSString *titleString = [arrayOfContentString objectAtIndex:0];
	pltvc.title = [titleString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	
	[self.navigationController pushViewController:pltvc animated:YES];
	[pltvc release];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
