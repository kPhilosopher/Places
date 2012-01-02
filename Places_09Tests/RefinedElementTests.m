//
//  RefinedElementTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 1/1/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RefinedElementTests.h"
#define SECTION_NUMBER 4
#define NAME_STRING @"String Test"

@implementation RefinedElementTests
@synthesize refinedElement = _refinedElement;

- (void)setUp
{
    [super setUp];
	self.refinedElement = [[[RefinedElement alloc] init] autorelease];
	self.refinedElement.dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"testValue",@"testKey", nil];
	self.refinedElement.name = NAME_STRING;
	self.refinedElement.sectionNumber = SECTION_NUMBER;
}

- (void)tearDown
{
	[_refinedElement release];
    [super tearDown];
}

- (void)testProperty_Dictionary
{
	STAssertTrue([[self.refinedElement.dictionary objectForKey:@"testKey"] isEqualToString:@"testValue"],@"The dictionary property is broken.");
}

- (void)testProperty_Name
{
	STAssertTrue([self.refinedElement.name isEqualToString:NAME_STRING],@"The name property is broken.");
}

- (void)testProperty_SectionNumber
{
	STAssertTrue((self.refinedElement.sectionNumber == SECTION_NUMBER),@"The section number property is broken.");
}

@end