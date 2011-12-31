//
//  TopPlacesTableViewControllerTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/29/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "TopPlacesTableViewControllerTests.h"

#import <UIKit/UIKit.h>
//#import "application_headers" as required

@implementation TopPlacesTableViewControllerTests

// All code under test is in the iOS Application
- (void) setUp {
	RefinedElement *element1 = [[RefinedElement alloc] init];
	element1.name = @"Acorn";
	element1.dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Acorn, MA",@"_content",nil];
	RefinedElement *element2 = [[RefinedElement alloc] init];
	element2.name = @"Calgary";
	element2.dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"   Calgary, AB   , Canada  ",@"_content",nil];
	RefinedElement *element3 = [[RefinedElement alloc] init];
	element3.name = @"Cairo";
	element3.dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Cairo, Cairo, Egypt",@"_content",nil];
	
	NSMutableArray *elementSections = [[NSMutableArray alloc] init];
	[elementSections addObject:[NSArray arrayWithObjects:element1, nil]];
	[elementSections addObject:[NSArray array]];
	[elementSections addObject:[NSArray arrayWithObjects:element2,element3, nil]];
	
    FlickrDataSource *flickrDataSource = [[FlickrDataSource alloc] init];
	flickrDataSource.theElementSectionsForTopPlaces = elementSections;
	id mockDataIndexer = [OCMockObject mockForClass:[DataIndexer Class]];
	
//    TopPlacesTableViewController* controller = [[TopPlacesTableViewController alloc] initWithStyle:UITableViewStylePlain andWith:flickrDataSource];
}

- (void) testPopulatesCell {
    id tableView = [OCMockObject mockForClass:[UITableView class]];
    [[tableView stub] dequeueReusableCellWithIdentifier:[OCMConstraint any]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(NSUInteger)0
                                                inSection:(NSUInteger)0];
	
    UITableViewCell *cell = [controller tableView:tableView
                            cellForRowAtIndexPath:indexPath];
    assertThat(@&quot;California&quot;, equalTo(cell.text));
}
@end
