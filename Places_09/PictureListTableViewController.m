//
//  PictureListTableViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 11/21/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PictureListTableViewController.h"

#define NUMBER_OF_SECTIONS 1


@implementation PictureListTableViewController
@synthesize listOfPictures_theModel, delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
//TODO: Implement how to rearrange the elements
-(void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections
{
}

-(void)setTheSectionNumberForEach:(RefinedElement *)refinedElement
{
}

-(void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
{
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

-(void) bunchOfTests
{
	NSLog( [self.listOfPictures_theModel description]);
//	NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithInt:1], @"key1", [NSNumber numberWithInt:2], @"key2", nil];
//	id key2stuff = [dictionary objectForKey:@"key2"];
//	id key3stuff = [dictionary objectForKey:@"key3"];
//	id key1stuff = [dictionary objectForKey:@"key1"];
//	if (!key3stuff) {
//		NSLog(@"works the way i want it");
	}
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
//	NSLog( [self.listOfPictures_theModel description]);
	[self bunchOfTests];
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.listOfPictures_theModel count];
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
    NSDictionary *cellDictionary = [self.listOfPictures_theModel objectAtIndex:indexPath.row];
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
//	else
//	{
//		if (temporaryDescriptionString && [temporaryDescriptionString isKindOfClass:[NSString class]]) {
//			titleString = (NSString *)temporaryDescriptionString;
//		}
//	}
//	
//	if (!titleString || [titleString length] == 0) {
//		titleString = @"Unknown";
//	}
	cell.textLabel.text = [titleString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	if (!([subTitleString length] == 0)) {
		cell.detailTextLabel.text = [subTitleString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
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
	ScrollableImageViewController *imageController = [self.delegate retrieveScrollableImageViewControllerFor:self];
	UIImage *image = [UIImage imageWithData:[FlickrFetcher imageDataForPhotoWithFlickrInfo:[self.listOfPictures_theModel objectAtIndex:indexPath.row] format:FlickrFetcherPhotoFormatLarge]];
	if (imageController.view.window == nil) 
		[self.navigationController pushViewController:imageController animated:YES];
	[imageController initiateTheImageSetupWithGiven:image];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
