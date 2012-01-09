//
//  DataIndexer.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/26/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//
// !!!: This class is designed to be subclassed

#import <Foundation/Foundation.h>
#import "RefinedElement.h"

@interface DataIndexer : NSObject
{
	@private
	NSArray *_rawData;
	NSMutableArray *_theElementSections;
}

#pragma mark - Methods

- (NSMutableArray *)returnTheIndexedSectionsOfTheGiven:(NSArray *)rawData;

#pragma mark - Methods to override

- (void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements;
- (void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements;
- (NSInteger)setTheTotalNumberOfSections;
- (void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections;

@end
