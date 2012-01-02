//
//  PictureListDataIndexer.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/26/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PictureListDataIndexer.h"

@implementation PictureListDataIndexer
@synthesize highSection = _highSection;

- (void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
{
	RefinedElementForPictureList *refinedElement = [[RefinedElementForPictureList alloc] init];
	refinedElement.name = [RefinedElementForPictureList extractNameFromDictionary:rawElement];
	refinedElement.dictionary = rawElement;
	[temporaryDataElements addObject:refinedElement];
	[refinedElement release];
}

- (void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements
{
	
	NSMutableSet *setOfHours = [NSMutableSet set];
	self.highSection = 0;
	for (RefinedElementForPictureList *refinedElement in temporaryDataElements) 
	{
		[setOfHours addObject:[NSNumber numberWithInt:[refinedElement.name intValue]]];
	}
	JBBPriorityQueue *priorityQueue = [[JBBPriorityQueue alloc] initWithClass:[NSNumber class] ordering:NSOrderedAscending];
	for (NSNumber *number in setOfHours) 
	{
		[priorityQueue addObject:number];
	}
	self.highSection = [priorityQueue count];
	
	NSMutableArray *copiedArray = [NSMutableArray arrayWithArray:temporaryDataElements];
	for (int indexForSections = 0; indexForSections < self.highSection; indexForSections++) 
	{
		NSNumber *temporaryHourNumber = [priorityQueue removeFirstObject];
		for (int indexForEachElement = 0; indexForEachElement < [copiedArray count]; indexForEachElement++) 
		{
			RefinedElementForPictureList *refinedElement = [copiedArray objectAtIndex:indexForEachElement];
			if ([temporaryHourNumber intValue] == [refinedElement.name intValue])
			{
				refinedElement.sectionNumber = indexForSections;
				[copiedArray removeObjectAtIndex:indexForEachElement];
				indexForEachElement = indexForEachElement - 1;
			}
		}
	}
	[priorityQueue release];
}

- (void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections
{
	NSMutableArray *temporarySection = [NSMutableArray arrayWithCapacity:[sectionArray count]];
	JBBPriorityQueue *priorityQueue = [[JBBPriorityQueue alloc] initWithClass:[RefinedElementForPictureList class] ordering:NSOrderedAscending];
	for (RefinedElementForPictureList *refinedElement in sectionArray)
		[priorityQueue addObject:refinedElement];
	int upperLimit = [priorityQueue count];
	for (int index = 0; index < upperLimit; index++) 
		[temporarySection addObject:[priorityQueue removeFirstObject]];
	[elementSections addObject:temporarySection];
	[priorityQueue release];
}

- (NSInteger)setTheTotalNumberOfSections
{
	return self.highSection;
}

@end