//
//  PictureListDataIndexer.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/26/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PictureListDataIndexer.h"

@implementation PictureListDataIndexer

-(void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections
{
	[elementSections addObject:sectionArray];
}

-(void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements
{
	RefinedElementForPictureList *refinedElement = [[RefinedElementForPictureList alloc] init];
	refinedElement.name = [RefinedElementForPictureList extractNameFrom:rawElement];
	refinedElement.dictionary = rawElement;
	[temporaryDataElements addObject:refinedElement];
	[refinedElement release];
}

-(void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements
{
	RefinedElement *previousRefinedElement;
	for (RefinedElement *refinedElement in temporaryDataElements) {
		if (previousRefinedElement == nil) {
			refinedElement.sectionNumber = 0;
		}
		else if([previousRefinedElement.name intValue] < [refinedElement.name intValue])
		{
			refinedElement.sectionNumber = previousRefinedElement.sectionNumber+1;
		}
		else
		{
			refinedElement.sectionNumber = previousRefinedElement.sectionNumber;
		}
		previousRefinedElement = refinedElement;
	}
}
@end
