//
//  TopPlacesTableViewControllerTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/29/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "TopPlacesTableViewControllerTests.h"

#import <UIKit/UIKit.h>

@implementation TopPlacesTableViewControllerTests
@synthesize rawDataForMock = _rawDataForMock;
@synthesize theElementSectionsMock = _theElementSectionsMock;
@synthesize controllerUnderTest = _controllerUnderTest;
@synthesize mockPlacesDataIndexer = _mockPlacesDataIndexer;
@synthesize mockFlickrDataSource = _mockFlickrDataSource;

- (void)setUp 
{
	[super setUp];
}

- (void)tearDown
{
	[_rawDataForMock release];
	[_controllerUnderTest release];
	[super tearDown];
}

- (void)setupTheMocksWithGivenRawData:(NSArray *)rawData givenElementSections:(NSMutableArray *)theElementSections
{
	self.rawDataForMock = rawData;
	self.theElementSectionsMock = theElementSections;
	self.mockFlickrDataSource = [OCMockObject mockForClass:[FlickrDataSource class]];
	self.mockPlacesDataIndexer = [OCMockObject mockForClass:[PlacesDataIndexer class]];
	
	[[[self.mockFlickrDataSource stub] andReturn:self.rawDataForMock] flickrTopPlacesArray];
	[[[self.mockPlacesDataIndexer stub] andReturn:self.theElementSectionsMock] returnTheIndexedSectionsOfTheGiven:self.rawDataForMock];
	[[self.mockFlickrDataSource expect] setTheElementSectionsForTopPlaces:self.theElementSectionsMock];
	
	[[[self.mockFlickrDataSource stub] andReturn:self.theElementSectionsMock] theElementSectionsForTopPlaces];
	
	self.controllerUnderTest = [[TopPlacesTableViewController alloc] initWithStyle:UITableViewStylePlain withTheFlickrDataSource:self.mockFlickrDataSource withTheDataIndexer:self.mockPlacesDataIndexer];

}

- (void)testFetchTheElementSections;
{
	[self setupTheMocksWithGivenRawData:[NSArray array] givenElementSections:[NSMutableArray array]];
	STAssertTrue(([[self.controllerUnderTest fetchTheElementSections] count] == 0),@"");
	
	
	
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
	[elementSections addObject:[NSMutableArray arrayWithObjects:element1, nil]];
	[elementSections addObject:[NSMutableArray array]];
	[elementSections addObject:[NSMutableArray arrayWithObjects:element2,element3, nil]];
	
	[self setupTheMocksWithGivenRawData:[NSArray array] givenElementSections:elementSections];
	STAssertTrue(([[self.controllerUnderTest fetchTheElementSections] count] == 3),@"");
}

- (void)testFetchTheRawData;
{
	[self setupTheMocksWithGivenRawData:[NSArray array] givenElementSections:[NSMutableArray array]];
	STAssertTrue(([[self.controllerUnderTest fetchTheRawData] count] == 0),@"");
	
	
	NSDictionary* dictionary1 = [NSDictionary dictionaryWithObjectsAndKeys:@"New York, NY, United States",@"_content", nil];
	NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys:@"London, England, United Kingdom",@"_content", nil];
	NSDictionary* dictionary3 = [NSDictionary dictionaryWithObjectsAndKeys:@"San Francisco, California, United States",@"_content", nil];
	NSMutableArray *rawData = [NSMutableArray arrayWithObjects:dictionary1, dictionary2, dictionary3, nil];
	
	[self setupTheMocksWithGivenRawData:rawData givenElementSections:[NSMutableArray array]];
	STAssertTrue(([[self.controllerUnderTest fetchTheRawData] count] == 3),@"");
}

- (void)testSetTheElementSectionsToTheFollowingArray
{
	[self setupTheMocksWithGivenRawData:[NSArray array] givenElementSections:[NSMutableArray array]];
	[self.mockFlickrDataSource verify];
	
	NSMutableArray *arrayToPass = [NSMutableArray array];
	[[self.mockFlickrDataSource expect] setTheElementSectionsForTopPlaces:arrayToPass];
	[self.controllerUnderTest setTheElementSectionsToTheFollowingArray:arrayToPass];
	[self.mockFlickrDataSource verify];
	
	STAssertThrows([self.controllerUnderTest setTheElementSectionsToTheFollowingArray:[NSMutableArray array]],@"");
}

- (void)

@end
