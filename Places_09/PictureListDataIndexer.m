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

- (void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections
{
	[elementSections addObject:sectionArray];
}

- (void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
{
	RefinedElementForPictureList *refinedElement = [[RefinedElementForPictureList alloc] init];
	refinedElement.name = [RefinedElementForPictureList extractNameFrom:rawElement];
	refinedElement.dictionary = rawElement;
	[temporaryDataElements addObject:refinedElement];
	[refinedElement release];
}

//TODO: see if I can find way to index with each hour being a section (I need to find a way to account for fluctuation of the hours)
- (void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements
{
	self.highSection = 0;
	for (RefinedElementForPictureList *refinedElement in temporaryDataElements) 
	{
		refinedElement.sectionNumber = [refinedElement.name intValue];
		if (self.highSection < refinedElement.sectionNumber)
			self.highSection = refinedElement.sectionNumber;
	}
}

- (NSInteger)setTheTotalNumberOfSections
{
	return self.highSection+1;
}
@end
