//
//  IndexedTableViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "IndexedTableViewController.h"

@implementation IndexedTableViewController
@synthesize dataIndexer = _dataIndexer;

#pragma mark - Initialization

- (id)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	if (self) 
	{
		self.dataIndexer = [[[DataIndexer alloc] init] autorelease];
	}
	return self;
}

//#pragma mark - Convenience method
//
////TODO: see if I can change the location of this method.
//- (RefinedElement *)getTheRefinedElementInTheElementSectionsWithThe:(NSIndexPath *)indexPath;
//{
//	return [(NSArray *)[[self getTheElementSections] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//}

#pragma mark - Methods to be overridden

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

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setTheElementSectionsToTheFollowing:[self.dataIndexer returnTheIndexedSectionsOfTheGiven:[self getTheRawData]]];
}

- (void)dealloc
{
	[_dataIndexer release];
	[super dealloc];
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

#pragma mark - Helper method

//TODO: see if I can change the location of this method.
- (RefinedElement *)getTheRefinedElementInTheElementSectionsWithThe:(NSIndexPath *)indexPath;
{
	return [(NSArray *)[[self getTheElementSections] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}
@end
