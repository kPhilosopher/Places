//
//  NSString+TitleExtractor.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/26/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "NSString+TitleExtractor.h"

@implementation NSString (TitleExtractor)

- (NSString *)extractTheFirstStringWithCommaDelimeter;
{
//	NSString *contentString = [refinedElement.dictionary objectForKey:@"_content"];
	NSArray *arrayOfContentString = [self componentsSeparatedByString:@","];
	NSString *titleString = [arrayOfContentString objectAtIndex:0];
	return [titleString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL)enumerateStringToDetermineTheExistanceOfCharacterOfSet:(NSCharacterSet *)aSet;
{
	BOOL verdict = NO;
	for (int index = 0; index < [self length]; index++) 
	{
		char characterInString = [self characterAtIndex:index];
		if ([aSet characterIsMember:characterInString])
			verdict = YES;
	}
	return verdict;
}
											  

@end
