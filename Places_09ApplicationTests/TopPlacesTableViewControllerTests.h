//
//  TopPlacesTableViewControllerTests.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/29/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import <OCMock/OCMock.h>
#import "TopPlacesTableViewController.h"
#import "FlickrDataSource.h"
#import "PlacesDataIndexer.h"
#import "RefinedElementForPlaces.h"

@interface TopPlacesTableViewControllerTests : SenTestCase
{
	@private
	NSArray *_rawDataForMock;
	NSMutableArray *_theElementSectionsMock;
	TopPlacesTableViewController *_controllerUnderTest;
	id _mockFlickrDataSource;
	id _mockPlacesDataIndexer;
}

@property (retain) NSArray *rawDataForMock;
@property (retain) NSMutableArray *theElementSectionsMock;
@property (retain) TopPlacesTableViewController *controllerUnderTest;
@property (assign) id mockFlickrDataSource;
@property (assign) id mockPlacesDataIndexer;

@end
