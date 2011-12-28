//
//  PlacesDataIndexer.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/26/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PlacesDataIndexer.h"

@implementation PlacesDataIndexer

- (void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
{
	RefinedElementForPlaces	*refinedElement = [[RefinedElementForPlaces alloc] init];
	refinedElement.name = [RefinedElementForPlaces extractNameFrom:rawElement];
	refinedElement.dictionary = rawElement;
	[temporaryDataElements addObject:refinedElement];
	[refinedElement release];
}

- (void)setTheSectionNumberForEach:(RefinedElement *)refinedElement
{
	refinedElement.sectionNumber = [[UILocalizedIndexedCollation currentCollation] sectionForObject:refinedElement collationStringSelector:@selector(name)];
}

- (void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements
{
	for (RefinedElement *refinedElement in temporaryDataElements)
		[self setTheSectionNumberForEach:refinedElement];
}

- (NSInteger)setTheTotalNumberOfSections
{
	return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] count];
}

- (void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections
{
	NSArray *sortedSection = [[UILocalizedIndexedCollation currentCollation] sortedArrayFromArray:sectionArray collationStringSelector:@selector(name)];
	[elementSections addObject:sortedSection];
}

@end
