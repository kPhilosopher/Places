//
//  RefinedElementForPlaces.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RefinedElementForPlaces.h"

@implementation RefinedElementForPlaces

+(NSString *)extractNameFrom:(NSDictionary *)rawElement
{
	NSString *contentString = [rawElement objectForKey:@"_content"];
	NSArray *arrayOfContentString = [contentString componentsSeparatedByString:@","];
	NSString *titleString = [arrayOfContentString objectAtIndex:0];
	return [titleString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

-(void)dealloc
{
	[super dealloc];
}
@end

