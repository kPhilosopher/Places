//
//  DataObjectForPlaces.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "DataObjectForPlaces.h"

@implementation DataObjectForPlaces
@synthesize name, dictionary, sectionNumber;


-(void)dealloc
{
	[name release];
	[dictionary release];
	[super dealloc];
}

@end
