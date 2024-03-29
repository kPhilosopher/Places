//
//  RefinedElement.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RefinedElement.h"

@implementation RefinedElement
@synthesize dictionary = _dictionary;
@synthesize sectionNumber = _sectionNumber;
@synthesize name = _name;

#pragma mark - View lifecycle

- (void)dealloc
{
	[_name release];
	[_dictionary release];
	[super dealloc];
}

#pragma mark - Class methods

+ (NSString *)extractNameFromDictionary:(NSDictionary *)rawElement
{
	return nil;
}

@end
