//
//  PLFlickrDataSourceTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/20/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//



#import "PLFlickrDataSourceTests.h"

@implementation PLFlickrDataSourceTests
@synthesize flickrDataSource = _flickrDataSource;
@synthesize storedMostRecentPlacesArray = _storedMostRecentPlacesArray;
@synthesize mockFlickrDataHandler = _mockFlickrDataHandler;
@synthesize mockAlertDelegate = _mockAlertDelegate;

- (void)setUp
{
    [super setUp];
	self.mockFlickrDataHandler = [OCMockObject mockForClass:[FlickrDataHandler class]];
	NSArray *mockTopPlacesArray = [NSArray arrayWithObjects:@"The array",@"Has These",@"Items", nil];
	[[[self.mockFlickrDataHandler stub] andReturn:mockTopPlacesArray] topPlacesFromFlickr];
	self.flickrDataSource = [[PLFlickrDataSource alloc] initWithFlickrDataHandler:self.mockFlickrDataHandler];
	
	self.mockAlertDelegate = [OCMockObject mockForClass:[PlaceTableViewController class]];
	self.flickrDataSource.alertDelegate = self.mockAlertDelegate;
}

- (void)tearDown
{
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:keyForMostRecentArray];
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:keyForMostRecentSet];
	[[NSUserDefaults standardUserDefaults] synchronize];
    [super tearDown];
}

- (void)testProperty_FlickrTopPlacesArray
{	
	id elementInArray = [self.flickrDataSource.flickrTopPlaces objectAtIndex:0];
	STAssertTrue([[elementInArray description] isEqualToString:@"The array"],@"");
	elementInArray = [self.flickrDataSource.flickrTopPlaces objectAtIndex:1];
	STAssertTrue([[elementInArray description] isEqualToString:@"Has These"],@"");
	elementInArray = [self.flickrDataSource.flickrTopPlaces objectAtIndex:2];
	STAssertTrue([[elementInArray description] isEqualToString:@"Items"],@"");
	
	//if there is a network error.
	self.mockFlickrDataHandler = [OCMockObject mockForClass:[FlickrDataHandler class]];
	id emptyValue = nil;
	[[[self.mockFlickrDataHandler stub] andReturn:OCMOCK_VALUE(emptyValue)] topPlacesFromFlickr];
	self.flickrDataSource = [[PLFlickrDataSource alloc] initWithFlickrDataHandler:self.mockFlickrDataHandler];
	
	self.mockAlertDelegate = [OCMockObject mockForClass:[PlaceTableViewController class]];
	self.flickrDataSource.alertDelegate = self.mockAlertDelegate;

	[[self.mockAlertDelegate expect] displayAlertViewWithTitle:alertTitle withMessage:alertMessage];
	[self.flickrDataSource setupFlickrTopPlacesWithFlickrFetcher];
	[self.mockAlertDelegate verify];
}

- (void)testMethod_01_RemoveFromTheMostRecentPlacesCollectionsTheFollowingDictionary
{
	NSDictionary *dictionaryToAdd = [NSDictionary dictionaryWithObjectsAndKeys:@"title_01",@"_content",@"1234",@"place_id", nil];
	[self.flickrDataSource.flickrMostRecentPlacesArray addObject:dictionaryToAdd];
	[self.flickrDataSource.flickrMostRecentPlacesSet addObject:dictionaryToAdd];
	STAssertTrue(([self.flickrDataSource.flickrMostRecentPlacesArray count] == 1),@"");
	
	dictionaryToAdd = [NSDictionary dictionaryWithObjectsAndKeys:@"title_02",@"_content",@"2345",@"place_id", nil];
	[self.flickrDataSource.flickrMostRecentPlacesArray addObject:dictionaryToAdd];
	[self.flickrDataSource.flickrMostRecentPlacesSet addObject:dictionaryToAdd];
	STAssertTrue(([self.flickrDataSource.flickrMostRecentPlacesArray count] == 2),@"");
	
	dictionaryToAdd = [NSDictionary dictionaryWithObjectsAndKeys:@"title_03",@"_content",@"3456",@"place_id", nil];
	[self.flickrDataSource.flickrMostRecentPlacesArray addObject:dictionaryToAdd];
	[self.flickrDataSource.flickrMostRecentPlacesSet addObject:dictionaryToAdd];
	STAssertTrue(([self.flickrDataSource.flickrMostRecentPlacesArray count] == 3),@"");
	
	NSArray *copyOfArray = [NSArray arrayWithArray:self.flickrDataSource.flickrMostRecentPlacesArray];
	for (NSDictionary *dictionaryToDelete in copyOfArray) 
	{
		[self.flickrDataSource removeFromTheMostRecentPlacesCollectionsTheFollowingDictionary:dictionaryToDelete];
	}
	STAssertTrue(([self.flickrDataSource.flickrMostRecentPlacesArray count] == 0),@"");
}

- (void)testMethod_02_AddToTheMostRecentPlacesCollectionsTheFollowingDictionary
{
	STAssertTrue([self.flickrDataSource.flickrMostRecentPlacesArray count] == 0,@"");
	
	NSDictionary *dictionaryToAdd_01 = [NSDictionary dictionaryWithObjectsAndKeys:@"title_01",@"_content",@"1234",@"place_id", nil];
	STAssertNotNil(self.flickrDataSource.flickrMostRecentPlacesArray, @"") ;
	
	[self.flickrDataSource addToTheMostRecentPlacesCollectionsTheFollowingDictionary:dictionaryToAdd_01];

	STAssertTrue([self.flickrDataSource.flickrMostRecentPlacesArray count] == 1,@"");
	STAssertTrue([[[self.flickrDataSource.flickrMostRecentPlacesArray objectAtIndex:0] objectForKey:@"_content"] isEqualToString:[dictionaryToAdd_01 objectForKey:@"_content"]],@"");
	
	//check if duplicates are handled
	[self.flickrDataSource addToTheMostRecentPlacesCollectionsTheFollowingDictionary:dictionaryToAdd_01];
	STAssertTrue([self.flickrDataSource.flickrMostRecentPlacesArray count] == 1,@"");
	
	//add a second dictionary
	NSDictionary *dictionaryToAdd_02 = [NSDictionary dictionaryWithObjectsAndKeys:@"title_02",@"_content",@"2345",@"place_id", nil];
	[self.flickrDataSource addToTheMostRecentPlacesCollectionsTheFollowingDictionary:dictionaryToAdd_02];
	STAssertTrue([self.flickrDataSource.flickrMostRecentPlacesArray count] == 2,@"");
	
	NSDictionary *dictionaryToAdd_03 = [NSDictionary dictionaryWithObjectsAndKeys:@"title_03",@"_content",@"3456",@"place_id", nil];
	[self.flickrDataSource addToTheMostRecentPlacesCollectionsTheFollowingDictionary:dictionaryToAdd_03];
	STAssertTrue([self.flickrDataSource.flickrMostRecentPlacesArray count] == 3,@"");
	
	//check ordering
	STAssertTrue([[[self.flickrDataSource.flickrMostRecentPlacesArray objectAtIndex:0] objectForKey:@"_content"] isEqualToString:[dictionaryToAdd_03 objectForKey:@"_content"]],@"");
	
	[self.flickrDataSource addToTheMostRecentPlacesCollectionsTheFollowingDictionary:dictionaryToAdd_02];
	STAssertTrue([self.flickrDataSource.flickrMostRecentPlacesArray count] == 3,@"");
	STAssertTrue([[[self.flickrDataSource.flickrMostRecentPlacesArray objectAtIndex:0] objectForKey:@"_content"] isEqualToString:[dictionaryToAdd_02 objectForKey:@"_content"]],@"");
	
	NSArray *copyOfArray = [NSArray arrayWithArray:self.flickrDataSource.flickrMostRecentPlacesArray];
	for (NSDictionary *dictionaryToDelete in copyOfArray) 
	{
		[self.flickrDataSource removeFromTheMostRecentPlacesCollectionsTheFollowingDictionary:dictionaryToDelete];
	}
}

- (void)testMethod_03_PhotoListWithFlickrPlaceID
{
	NSArray *mockPhotoList_01 = [[NSArray alloc] initWithObjects:@"first", nil];
	[[[self.mockFlickrDataHandler stub] andReturn:mockPhotoList_01] photoListWithPlaceIDString:@"mockPhotoList_01"];
	
	NSArray *mockPhotoList_02 = [[NSArray alloc] initWithObjects:@"second", nil];
	[[[self.mockFlickrDataHandler stub] andReturn:mockPhotoList_02] photoListWithPlaceIDString:@"mockPhotoList_02"];
	
	NSArray *mockPhotoList_03 = [[NSArray alloc] initWithObjects:@"third", nil];
	[[[self.mockFlickrDataHandler stub] andReturn:mockPhotoList_03] photoListWithPlaceIDString:@"mockPhotoList_03"];
	
	id emptyValue = nil;
	[[[self.mockFlickrDataHandler stub] andReturn:OCMOCK_VALUE(emptyValue)] photoListWithPlaceIDString:@"empty"];
	
	STAssertTrue([[[self.flickrDataSource photoListWithFlickrPlaceID:@"mockPhotoList_03"] objectAtIndex:0] isEqualToString:@"third"],@"");
	STAssertTrue([[[self.flickrDataSource photoListWithFlickrPlaceID:@"mockPhotoList_02"] objectAtIndex:0] isEqualToString:@"second"],@"");
	STAssertTrue([[[self.flickrDataSource photoListWithFlickrPlaceID:@"mockPhotoList_01"] objectAtIndex:0] isEqualToString:@"first"],@"");
	
	[[self.mockAlertDelegate expect] displayAlertViewWithTitle:alertTitle withMessage:alertMessage];
	
	STAssertTrue([[self.flickrDataSource photoListWithFlickrPlaceID:@"empty"] count] == 0,@"");
	[self.mockAlertDelegate verify];
}

@end