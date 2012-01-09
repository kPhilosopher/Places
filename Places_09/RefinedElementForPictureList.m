//
//  RefinedElementForPictureList.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RefinedElementForPictureList.h"

@implementation RefinedElementForPictureList

#pragma mark - Class methods

+ (NSString *)extractNameFromDictionary:(NSDictionary *)rawElement
{
	NSDate *endDate = [NSDate date];
	NSString *dateUpload = [rawElement objectForKey:@"dateupload"];
	NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:[dateUpload intValue]];
	NSCalendar *gregorian = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
	NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit;
	NSDateComponents *components = [gregorian components:unitFlags
												fromDate:startDate
												  toDate:endDate 
												 options:0];
	double minute = (double)[components minute]/60.0;
	double number = minute + (double)[components hour];
	NSString *string = [NSString stringWithFormat:@"%.2f",number];
	return string;
}

#pragma mark - Methods

- (NSComparisonResult)compare:(RefinedElementForPictureList *)aRefinedElementPicture;
{
	int result;
	NSNumberFormatter *formatter = [[[NSNumberFormatter alloc] init] autorelease];
	if ([formatter numberFromString:self.name] && [formatter numberFromString:aRefinedElementPicture.name])
		result = [[NSNumber numberWithDouble:[self.name doubleValue]] compare:[NSNumber numberWithDouble:[aRefinedElementPicture.name doubleValue]]];
	else	result = 0;
	return result;
}
@end
