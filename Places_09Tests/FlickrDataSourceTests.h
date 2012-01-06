//
//  FlickrDataSourceTests.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/20/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

//  Logic unit tests contain unit test code that is designed to be linked into an independent test executable.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import <OCMock/OCMock.h>
#import "FlickrDataSource.h"
#import "FlickrDataSource-Internal.h"
#import "PlaceTableViewController.h"

@interface FlickrDataSourceTests : SenTestCase
{
	@private
	FlickrDataSource *_flickrDataSource;
	NSArray *_storedMostRecentPlacesArray;
	id _mockFlickrDataHandler;
	id _mockAlertDelegate;
}

@property (retain) FlickrDataSource *flickrDataSource;
@property (retain) NSArray *storedMostRecentPlacesArray;
@property (assign) id mockFlickrDataHandler;
@property (assign) id mockAlertDelegate;

@end