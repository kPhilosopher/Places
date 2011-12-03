//
//  IndexedTableViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "IndexedTableViewController.h"


@implementation IndexedTableViewController
@synthesize theElementSections, rawData;

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


-(void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections
{
//	NSArray *sortedSection = [[UILocalizedIndexedCollation currentCollation] sortedArrayFromArray:sectionArray collationStringSelector:@selector(name)];
//	[elementSections addObject:sortedSection];
}
//
-(void)setTheSectionNumberForEach:(RefinedElement *)refinedElement
{
//	NSInteger sectionNumber = [[UILocalizedIndexedCollation currentCollation] sectionForObject:refinedElement collationStringSelector:@selector(name)];
//	refinedElement.sectionNumber = sectionNumber;
}
//
-(void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
{
//	RefinedElementForPlaces *refinedElement = [[RefinedElementForPlaces alloc] init];
//	refinedElement.name = [RefinedElementForPlaces extractNameFrom:rawElement];
//	refinedElement.dictionary = rawElement;
//	[temporaryDataElements addObject:refinedElement];
//	[refinedElement release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.theElementSections = [[NSMutableArray alloc] init];
	
	NSMutableArray *temporaryDataElements;
	if (self.rawData) {
		temporaryDataElements = [[NSMutableArray alloc] initWithCapacity:1];
		for (NSDictionary *rawElement in self.rawData) {
			[self convertThe:rawElement IntoRefinedElementsAndAddTo:temporaryDataElements];
		}
	}
	else
	{
		return;
	}
	for (RefinedElementForPlaces *refinedElement in temporaryDataElements) {
		[self setTheSectionNumberForEach:refinedElement];
	}
	
	NSInteger highSection = [[[UILocalizedIndexedCollation currentCollation] sectionTitles] count];
	NSMutableArray *sectionArrays = [[NSMutableArray alloc]initWithCapacity:highSection];
	for (int i = 0 ; i < highSection ; i++) {
		NSMutableArray *sectionArray = [[NSMutableArray alloc] initWithCapacity:1];
		[sectionArrays addObject:sectionArray];
	}
	
	for (RefinedElementForPlaces *element in temporaryDataElements) {
		[(NSMutableArray *)[sectionArrays objectAtIndex:element.sectionNumber] addObject:element];
	}
	
	for (NSMutableArray *sectionArray in sectionArrays) {
		[self sortTheElementsInEach:sectionArray andAddTo:(NSMutableArray *)self.theElementSections];
	}
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
	[rawData release];
	[theElementSections release];
	[super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.theElementSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(NSArray *)[self.theElementSections objectAtIndex:section] count];
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//    }
//    
//    // Configure the cell...
//    
//    return cell;
//}

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

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     [detailViewController release];
//     */
//}

@end
