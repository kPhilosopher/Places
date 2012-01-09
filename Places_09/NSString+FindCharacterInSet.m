//
//  NSString+FindCharacterInSet.m
//  Places_09
//
//  Created by Jinwoo Baek on 1/8/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "NSString+FindCharacterInSet.h"

@implementation NSString (FindCharacterInSet)

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
