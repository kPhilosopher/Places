//
//  DataIndexer.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/26/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "DataIndexer.h"

@interface DataIndexer()
@property (retain) NSArray *rawData;
@property (retain) NSMutableArray *theElementSections;
@end

@implementation DataIndexer
@synthesize rawData = _rawData;
@synthesize theElementSections = _theElementSections;

#pragma mark - Indexing Sequence
//TODO: Refactor this method.
- (NSMutableArray *)returnTheIndexedSectionsOfTheGiven:(NSArray *)rawData;
{
	self.rawData = rawData;
	self.theElementSections = [[NSMutableArray alloc] init];
	NSMutableArray *temporaryDataElements;
	if (self.rawData)
	{
		temporaryDataElements = [[NSMutableArray alloc] initWithCapacity:1];
		for (NSDictionary *rawElement in self.rawData) 
			[self convertThe:rawElement IntoRefinedElementsAndAddTo:temporaryDataElements];
	}
	else
		return nil;
	[self setTheSectionNumberForAllTheElementsIn:temporaryDataElements];
	NSInteger highSection = [self setTheTotalNumberOfSections];
	
	NSMutableArray *sectionArrays = [[NSMutableArray alloc]initWithCapacity:highSection];
	
	for (int i = 0 ; i < highSection ; i++) 
	{
		NSMutableArray *sectionArray = [[NSMutableArray alloc] initWithCapacity:0];
		[sectionArrays addObject:sectionArray];
	}
	
	for (RefinedElement *element in temporaryDataElements) 
		[(NSMutableArray *)[sectionArrays objectAtIndex:element.sectionNumber] addObject:element];
	
	for (NSMutableArray *sectionArray in sectionArrays) 
		[self sortTheElementsInEach:sectionArray andAddTo:self.theElementSections];
	return self.theElementSections;
}


#pragma mark - Methods to be overridden

- (void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements;
{
	return;
}

- (void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements;
{
	return;
}

- (NSInteger)setTheTotalNumberOfSections;
{
	return 0;
}

- (void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections;
{
	return;
}

@end
