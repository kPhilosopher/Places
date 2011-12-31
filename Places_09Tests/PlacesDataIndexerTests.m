//
//  PlacesDataIndexerTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/27/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PlacesDataIndexerTests.h"

@implementation PlacesDataIndexerTests
@synthesize placesDataIndexer = _placesDataIndexer;
@synthesize rawData = _rawData;


- (void)setUp;
{
    [super setUp];
	NSMutableArray *testData = [[NSMutableArray alloc] init];
	
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"South Park", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Seattle", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Beirut", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"8Baghdad", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"London", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Seoul", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Cairo", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Hong Kong", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Cairo", @"_content", nil]];
	self.rawData = [testData autorelease];
}

- (void)tearDown;
{
	self.placesDataIndexer = nil;
	self.rawData = nil;
    [super tearDown];
}

- (void)testWithTestDataInput;
{
	self.placesDataIndexer = [[[PlacesDataIndexer alloc] init] autorelease];
	NSArray *theElementSections = [self.placesDataIndexer returnTheIndexedSectionsOfTheGiven:self.rawData];
	STAssertTrue(([theElementSections count] == 27),@"The element sections array does not have the correct number of sections.");
	
	//A (empty section)
	STAssertTrue(([[theElementSections objectAtIndex:0] count] == 0),@"the section with A should not have any elements in it.");
	
	//B (existance of certain object)
	STAssertTrue(([[theElementSections objectAtIndex:1] count] == 1),@"The B section's member count is off");
	RefinedElement *elementForB = (RefinedElement *)[[theElementSections objectAtIndex:1] objectAtIndex:0];
	STAssertTrue([elementForB.name isEqualToString:@"Beirut"],@"The B section does not have the Beirut dictionary _content");
	STAssertTrue((elementForB.sectionNumber == 1),@"The section number of the element is not correct");
	
	//C (duplicate)
	RefinedElement *elementForC_01 = (RefinedElement *)[[theElementSections objectAtIndex:2] objectAtIndex:0];
	RefinedElement *elementForC_02 = (RefinedElement *)[[theElementSections objectAtIndex:2] objectAtIndex:1];
	STAssertTrue([elementForC_01.name isEqualToString:elementForC_02.name],@"The two elements in the C section does not have the same string sequence.");
	STAssertTrue(([[theElementSections objectAtIndex:2] count] == 2),@"The C section does not have the correct number of sections.");
	
	//S (ordering)
	RefinedElement *elementForS_01 = (RefinedElement *)[[theElementSections objectAtIndex:18] objectAtIndex:0];
	RefinedElement *elementForS_02 = (RefinedElement *)[[theElementSections objectAtIndex:18] objectAtIndex:1];
	RefinedElement *elementForS_03 = (RefinedElement *)[[theElementSections objectAtIndex:18] objectAtIndex:2];
	STAssertTrue([elementForS_01.name isEqualToString:@"Seattle"], @"The first element in the S section is not 'Seattle'");
	STAssertTrue([elementForS_02.name isEqualToString:@"Seoul"], @"The second element in the S section is not 'Seoul'");
	STAssertTrue([elementForS_03.name isEqualToString:@"South Park"], @"The third element in the S section is not 'South Park'");
	
	//#
	STAssertTrue(([[theElementSections objectAtIndex:26] count] == 1),@"The # section's member count is off");
	RefinedElement *elementForSharp = (RefinedElement *)[[theElementSections objectAtIndex:26] objectAtIndex:0];
	STAssertTrue([elementForSharp.name isEqualToString:@"8Baghdad"],@"The # section element is incorrect");
}

- (void)testNilDataInput
{
	self.placesDataIndexer = [[[PlacesDataIndexer alloc] init] autorelease];
	NSArray *theElementSectionsWithNilData = [self.placesDataIndexer returnTheIndexedSectionsOfTheGiven:nil];
	STAssertNil((theElementSectionsWithNilData),@"The element sections array should be nil");
}

- (void)testEmptyDataInput
{
	self.placesDataIndexer = [[[PlacesDataIndexer alloc] init] autorelease];
	NSArray *emptyArray = [[NSArray alloc] init];
	NSArray *theElementSectionsWithEmptyData = [self.placesDataIndexer returnTheIndexedSectionsOfTheGiven:emptyArray];
	STAssertTrue(([theElementSectionsWithEmptyData count] == 27),@"The element sections should have empty sections.");
	STAssertTrue([[theElementSectionsWithEmptyData objectAtIndex:0] count] == 0,@"The first section of the empty section should be empty");
}
@end
