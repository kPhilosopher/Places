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
@synthesize flickrDataSource, delegateToTransfer;

- (id)initWithStyle:(UITableViewStyle)style andWith:(FlickrDataSource *)theFlickrDataSource
{
    self = [super initWithStyle:style];
    if (self) {
		self.flickrDataSource = theFlickrDataSource;
	}
    return self;
}

#pragma mark - View lifecycle
-(void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections
{
	NSArray *sortedSection = [[UILocalizedIndexedCollation currentCollation] sortedArrayFromArray:sectionArray collationStringSelector:@selector(name)];
	[elementSections addObject:sortedSection];
}



-(void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
{
	RefinedElementForPlaces	*refinedElement = [[RefinedElementForPlaces alloc] init];
	refinedElement.name = [RefinedElementForPlaces extractNameFrom:rawElement];
	refinedElement.dictionary = rawElement;
	[temporaryDataElements addObject:refinedElement];
	[refinedElement release];
}

-(void)setTheSectionNumberForEach:(RefinedElement *)refinedElement
{
	NSInteger sectionNumber = [[UILocalizedIndexedCollation currentCollation] sectionForObject:refinedElement collationStringSelector:@selector(name)];
	refinedElement.sectionNumber = sectionNumber;
}

-(void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements
{
	for (RefinedElement *refinedElement in temporaryDataElements) {
		[self setTheSectionNumberForEach:refinedElement];
	}
}



//-(void)setTheSectionNumberForEach:(RefinedElement *)refinedElement
//{
//	NSInteger sectionNumber = [[UILocalizedIndexedCollation currentCollation] sectionForObject:refinedElement collationStringSelector:@selector(name)];
//	refinedElement.sectionNumber = sectionNumber;
//}
//
//-(void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
//{
//	RefinedElementForPlaces *refinedElement = [[RefinedElementForPlaces alloc] init];
//	refinedElement.name = [RefinedElementForPlaces extractNameFrom:rawElement];
//	refinedElement.dictionary = rawElement;
//	[temporaryDataElements addObject:refinedElement];
//	[refinedElement release];
//}

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc
{
	[flickrDataSource release];
	[super dealloc];
}

#pragma mark - Table view data source

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
	return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([[self.theElementSections objectAtIndex:section] count] > 0) {
        return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	NSArray *sectionArray = [self.theElementSections objectAtIndex:indexPath.section];
//	if (self.rawData == nil) {
//		self.rawData = [NSArray array];
//	}
//  NSDictionary *dictionaryOfCell = [self.rawData objectAtIndex:indexPath.row];
	RefinedElementForPlaces *refinedElement = (RefinedElementForPlaces *)[sectionArray objectAtIndex:indexPath.row];
	NSDictionary *dictionaryOfCell = refinedElement.dictionary;
	NSString *contentString = [dictionaryOfCell objectForKey:@"_content"];
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
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	
	RefinedElementForPlaces *refinedElement = [(NSArray *)[self.theElementSections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	NSString *placeId = [refinedElement.dictionary objectForKey:@"place_id"];
	PictureListTableViewController *pltvc = [[PictureListTableViewController alloc] initWithStyle:UITableViewStylePlain andWith:[self.flickrDataSource retrievePhotoListForSpecific:placeId]];
	NSString *contentString = [refinedElement.dictionary objectForKey:@"_content"];
	NSArray *arrayOfContentString = [contentString componentsSeparatedByString:@","];
	pltvc.title = [arrayOfContentString objectAtIndex:0];
	pltvc.delegate = self.delegateToTransfer;
	[self.navigationController pushViewController:pltvc animated:YES];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[pltvc release];
}

@end
