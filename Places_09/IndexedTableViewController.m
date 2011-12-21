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

//-(void)setTheSectionNumberForEach:(RefinedElement *)refinedElement
//{
////	NSInteger sectionNumber = [[UILocalizedIndexedCollation currentCollation] sectionForObject:refinedElement collationStringSelector:@selector(name)];
////	refinedElement.sectionNumber = sectionNumber;
//}

-(void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements
{
//	for (RefinedElement *refinedElement in temporaryDataElements) {
//		[self setTheSectionNumberForEach:refinedElement];
//	}
}

-(void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
{
//	RefinedElement *refinedElement = [[RefinedElement alloc] init];
//	refinedElement.name = [RefinedElement extractNameFrom:rawElement];
//	refinedElement.dictionary = rawElement;
//	[temporaryDataElements addObject:refinedElement];
//	[refinedElement release];
}

-(void) loadDataFromRawData
{
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
	[self setTheSectionNumberForAllTheElementsIn:temporaryDataElements];
	//	for (RefinedElement *refinedElement in temporaryDataElements) {
	//		[self setTheSectionNumberForEach:refinedElement];
	//	}
	//create a function that can be transferred down to be overriden.
	NSInteger highSection = [[[UILocalizedIndexedCollation currentCollation] sectionTitles] count];
	NSMutableArray *sectionArrays = [[NSMutableArray alloc]initWithCapacity:highSection];
	for (int i = 0 ; i < highSection ; i++) {
		NSMutableArray *sectionArray = [[NSMutableArray alloc] initWithCapacity:1];
		[sectionArrays addObject:sectionArray];
	}
	
	for (RefinedElement *element in temporaryDataElements) 
	{
		[(NSMutableArray *)[sectionArrays objectAtIndex:element.sectionNumber] addObject:element];
	}
	
	for (NSMutableArray *sectionArray in sectionArrays) 
	{
		[self sortTheElementsInEach:sectionArray andAddTo:(NSMutableArray *)self.theElementSections];
	}

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self loadDataFromRawData];
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

-(NSArray *)rawData
{
	if (!rawData) {
		rawData = [[NSArray alloc] init];
	}
	return rawData;
}


@end
