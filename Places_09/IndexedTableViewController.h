//
//  IndexedTableViewController.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrDataSource.h"
#import "RefinedElementForPlaces.h"


// !!!: This class is designed to be subclassed

@interface IndexedTableViewController : UITableViewController
{
	@private
}

// !!!: Must override these methods by subclassing to use this class.
- (void)sortTheElementsInEach:(NSMutableArray *)sectionArray andAddTo:(NSMutableArray *)elementSections;
- (void)setTheSectionNumberForAllTheElementsIn:(NSMutableArray *)temporaryDataElements;
- (void)convertThe:(NSDictionary *)rawElement IntoRefinedElementsAndAddTo:(NSMutableArray *)temporaryDataElements;
- (void)setTheElementSectionsToTheFollowing:(NSMutableArray *)array;
- (NSMutableArray *)getTheElementSections;
- (NSArray *)getTheRawData;
@end