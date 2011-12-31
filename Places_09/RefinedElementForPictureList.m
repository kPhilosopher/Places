//
//  RefinedElementForPictureList.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RefinedElementForPictureList.h"

@implementation RefinedElementForPictureList

+ (NSString *)extractNameFrom:(NSDictionary *)rawElement
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

- (NSComparisonResult)compare:(RefinedElementForPictureList *)aRefinedElementPicture
{
	return [[NSNumber numberWithDouble:[self.name doubleValue]] compare:[NSNumber numberWithDouble:[aRefinedElementPicture.name doubleValue]]];
}

@end
