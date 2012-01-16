//
//  RefinedElementForPlaces.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RefinedElementForPlaces.h"

@implementation RefinedElementForPlaces

+(NSString *)extractNameFromDictionary:(NSDictionary *)rawElement
{
	return [[rawElement objectForKey:@"_content"] initialStringWithDelimiterSet:[NSString characterSetWithComma]];
}

@end