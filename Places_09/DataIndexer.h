//
//  DataIndexer.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/26/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RefinedElement.h"

// !!!: This class is designed to be subclassed

@interface DataIndexer : NSObject
{
	@private
	NSArray *_rawData;
	NSMutableArray *_theElementSections;
}
- (NSMutableArray *)returnTheIndexedSectionsOfTheGiven:(NSArray *)rawData;
- (void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements;
- (void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements;
- (NSInteger)setTheTotalNumberOfSections;
- (void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections;

@end
