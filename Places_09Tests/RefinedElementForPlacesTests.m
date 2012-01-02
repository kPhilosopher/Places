//
//  RefinedElementForPlacesTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 1/1/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RefinedElementForPlacesTests.h"

@implementation RefinedElementForPlacesTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testMethod_ExtractNameFromDictionary
{
	NSString *inputString;
	NSDictionary *inputDictionary = [[NSDictionary alloc] init];
	NSString *output;
	
	inputString = nil;
	inputDictionary = [NSDictionary dictionaryWithObjectsAndKeys:inputString,@"_content", nil];
	output = [RefinedElementForPlaces extractNameFromDictionary:inputDictionary];
	STAssertNil(output,@"");
	
	inputString = @"Test";
	inputDictionary = nil;
	output = [RefinedElementForPlaces extractNameFromDictionary:inputDictionary];
	STAssertNil(output,@"");
	
	inputString = @"Test";
	inputDictionary = [NSDictionary dictionaryWithObjectsAndKeys:inputString,@"_content", nil];
	output = [RefinedElementForPlaces extractNameFromDictionary:inputDictionary];
	STAssertTrue([output isEqualToString:inputString],@"");
	
	inputString = @"Test,This,Out";
	inputDictionary = [NSDictionary dictionaryWithObjectsAndKeys:inputString,@"_content", nil];
	output = [RefinedElementForPlaces extractNameFromDictionary:inputDictionary];
	STAssertTrue([output isEqualToString:@"Test"],@"");
}

@end
