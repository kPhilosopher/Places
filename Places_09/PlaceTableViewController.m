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

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//	return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.rawData count];
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
	if (self.rawData == nil) {
		self.rawData = [NSArray array];
	}
    NSDictionary *dictionaryOfCell = [self.rawData objectAtIndex:indexPath.row];
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
	PictureListTableViewController *pltvc = [[PictureListTableViewController alloc] init];
	pltvc.delegate = self.delegateToTransfer;
 	NSString *placeId = [[self.rawData objectAtIndex:indexPath.row] objectForKey:@"place_id"];
	pltvc.listOfPictures_theModel = [self.flickrDataSource retrievePhotoListForSpecific:placeId];
	[self.navigationController pushViewController:pltvc animated:YES];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[pltvc release];
}

@end
