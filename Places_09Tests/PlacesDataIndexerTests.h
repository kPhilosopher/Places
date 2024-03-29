//
//  PlacesDataIndexerTests.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/27/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

//  Logic unit tests contain unit test code that is designed to be linked into an independent test executable.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import "PlacesDataIndexer.h"

@interface PlacesDataIndexerTests : SenTestCase
{
	@private
	PlacesDataIndexer *_placesDataIndexer;
	NSArray *_rawData;
}
@property (retain) PlacesDataIndexer *placesDataIndexer;
@property (retain) NSArray *rawData;
@end
