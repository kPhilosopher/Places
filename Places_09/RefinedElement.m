//
//  RefinedElement.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RefinedElement.h"

@implementation RefinedElement
@synthesize dictionary, sectionNumber, name;

-(void)dealloc
{
	[name release];
	[dictionary release];
	[super dealloc];
}

+(NSString *)extractNameFrom:(NSDictionary *)rawElement
{
	return nil;
}

@end
