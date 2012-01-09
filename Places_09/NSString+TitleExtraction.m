//
//  NSString+TitleExtractor.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/26/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "NSString+TitleExtraction.h"

@implementation NSString (TitleExtraction)

- (NSString *)extractTheFirstStringWithCommaDelimeter;
{
	NSArray *arrayOfContentString = [self componentsSeparatedByString:@","];
	NSString *titleString = [arrayOfContentString objectAtIndex:0];
	return [titleString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end