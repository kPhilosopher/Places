//
//  PictureListDataIndexerTests.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/29/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

//  Logic unit tests contain unit test code that is designed to be linked into an independent test executable.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import "PictureListDataIndexer.h"
@interface PictureListDataIndexerTests : SenTestCase
{
	@private
	NSArray *_theElementSections;
	NSArray *_rawData;
	PictureListDataIndexer *_pictureListDataIndexer;
}

@property (retain) NSArray *theElementSections;
@property (retain) NSArray *rawData;
@property (retain) PictureListDataIndexer *pictureListDataIndexer;

@end