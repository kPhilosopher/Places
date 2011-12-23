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
@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style andWith:(NSArray *)pictureList
{
    self = [super initWithStyle:style];
    if (self) {
		if (pictureList)
		{
			self.listOfPictures_theModel = pictureList;
		}
    }
	self.view.accessibilityLabel = @"pictureListTableView";
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Methods to override the IndexedTableViewController

- (void)setTheElementSectionsToTheFollowing:(NSMutableArray *)array
{
	self.listOfPicturesIndexed_theModel = array;
}

- (NSMutableArray *)getTheElementSections
{
	return self.listOfPicturesIndexed_theModel;
}

- (NSArray *)getTheRawData
{
	return self.listOfPictures_theModel;
}

#pragma mark - View lifecycle

-(void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections
{
	[elementSections addObject:sectionArray];
}

-(void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
{
	RefinedElementForPictureList *refinedElement = [[RefinedElementForPictureList alloc] init];
	refinedElement.name = [RefinedElementForPictureList extractNameFrom:rawElement];
	refinedElement.dictionary = rawElement;
	[temporaryDataElements addObject:refinedElement];
	[refinedElement release];
}

-(void)setTheSectionNumberForEach:(RefinedElement *)refinedElement
{
//	NSInteger sectionNumber = [[UILocalizedIndexedCollation currentCollation] sectionForObject:refinedElement collationStringSelector:@selector(name)];
//	refinedElement.sectionNumber = sectionNumber;
}

-(void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements
{
	RefinedElement *previousRefinedElement;
	for (RefinedElement *refinedElement in temporaryDataElements) {
		if (previousRefinedElement == nil) {
			refinedElement.sectionNumber = 0;
		}
		else if([previousRefinedElement.name intValue] < [refinedElement.name intValue])
		{
			refinedElement.sectionNumber = previousRefinedElement.sectionNumber+1;
		}
		else
		{
			refinedElement.sectionNumber = previousRefinedElement.sectionNumber;
		}
		previousRefinedElement = refinedElement;
	}
}

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

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//	return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([[[self getTheElementSections] objectAtIndex:section] count] > 0)
	{
		RefinedElement *refinedElement = [[[self getTheElementSections] objectAtIndex:section] objectAtIndex:0];
		if ([refinedElement.name intValue] == 0) {
			return @"Right Now";
		}
        return [refinedElement.name stringByAppendingString:@" Hour(s) Ago"];
    }
    return nil;
}

//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
//}


-(void) bunchOfTests
{
//	NSLog( [self.listOfPictures_theModel description]);
//	NSDictionary *dictionary = [self.listOfPictures_theModel objectAtIndex:0];
//	NSLog([dictionary objectForKey:@"dateupload"]);
//	NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithInt:1], @"key1", [NSNumber numberWithInt:2], @"key2", nil];
//	id key2stuff = [dictionary objectForKey:@"key2"];
//	id key3stuff = [dictionary objectForKey:@"key3"];
//	id key1stuff = [dictionary objectForKey:@"key1"];
//	if (!key3stuff) {
//		NSLog(@"works the way i want it");
}

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
	RefinedElement *refinedElement = [[[self getTheElementSections] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
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
	if (!([subTitleString length] == 0)) {
		cell.detailTextLabel.text = [subTitleString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	}
	return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	ScrollableImageViewController *imageController = [self.delegate retrieveScrollableImageViewControllerFor:self];
	RefinedElement *refinedElement = [[[self getTheElementSections] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	NSDictionary *dictionaryWithPictureInfo = refinedElement.dictionary;
	UIImage *image = [UIImage imageWithData:[FlickrFetcher imageDataForPhotoWithFlickrInfo:dictionaryWithPictureInfo format:FlickrFetcherPhotoFormatLarge]];
	if (imageController.view.window == nil) 
		[self.navigationController pushViewController:imageController animated:YES];
	[imageController initiateTheImageSetupWithGiven:image];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
