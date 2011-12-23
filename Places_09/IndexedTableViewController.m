//
//  IndexedTableViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "IndexedTableViewController.h"


@implementation IndexedTableViewController

- (RefinedElement *)getTheRefinedElementInTheElementSectionsWithThe:(NSIndexPath *)indexPath;
{
	return [(NSArray *)[[self getTheElementSections] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

#pragma mark - Methods to be overridden

- (void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections;
{
	return;
}

- (void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements;
{
	return;
}

- (void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements;
{
	return;
}

- (void)setTheElementSectionsToTheFollowing:(NSMutableArray *)array;
{
	return;
}

- (NSMutableArray *)getTheElementSections;
{
	return nil;
}

- (NSArray *)getTheRawData;
{
	return nil;
}

#pragma mark - View lifecycle

-(void) loadDataFromRawData
{
	[self setTheElementSectionsToTheFollowing:[[NSMutableArray alloc] init]];
	
	NSMutableArray *temporaryDataElements;
	if ([self getTheRawData]) {
		temporaryDataElements = [[NSMutableArray alloc] initWithCapacity:1];
		for (NSDictionary *rawElement in [self getTheRawData]) 
		{
			[self convertThe:rawElement IntoRefinedElementsAndAddTo:temporaryDataElements];
		}
	}
	else
		return;
	[self setTheSectionNumberForAllTheElementsIn:temporaryDataElements];
	
	NSInteger highSection = [[[UILocalizedIndexedCollation currentCollation] sectionTitles] count];
	NSMutableArray *sectionArrays = [[NSMutableArray alloc]initWithCapacity:highSection];
	
	for (int i = 0 ; i < highSection ; i++) 
	{
		NSMutableArray *sectionArray = [[NSMutableArray alloc] initWithCapacity:1];
		[sectionArrays addObject:sectionArray];
	}
	
	for (RefinedElement *element in temporaryDataElements) 
		[(NSMutableArray *)[sectionArrays objectAtIndex:element.sectionNumber] addObject:element];
	
	for (NSMutableArray *sectionArray in sectionArrays) 
		[self sortTheElementsInEach:sectionArray andAddTo:[self getTheElementSections]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self loadDataFromRawData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self getTheElementSections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(NSArray *)[[self getTheElementSections] objectAtIndex:section] count];
}

@end
