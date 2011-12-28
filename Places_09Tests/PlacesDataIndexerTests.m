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
	self.placesDataIndexer = [[[PlacesDataIndexer alloc] init] autorelease];
	NSMutableArray *testData = [[NSMutableArray alloc] init];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Beirut", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Seoul", @"_content", nil]];
//	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"8Baghdad", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Seattle", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"London", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Tripoli", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Hong Kong", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"South Park", @"_content", nil]];
	[testData addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Tripoli", @"_content", nil]];
	self.rawData = [testData autorelease];
}

- (void)tearDown;
{
	self.placesDataIndexer = nil;
	self.rawData = nil;
    [super tearDown];
}

- (void)testReturnTheIndexedSectionsOfTheGivenRawData;
{
	NSArray *theElementSections = [self.placesDataIndexer returnTheIndexedSectionsOfTheGiven:self.rawData];
	NSLog([NSString stringWithFormat:@"%d",[theElementSections count]]);
	NSLog([theElementSections description]);
	STAssertTrue(([theElementSections count] == 6),@"The element sections array does not have the correct number of sections.");
}
@end
