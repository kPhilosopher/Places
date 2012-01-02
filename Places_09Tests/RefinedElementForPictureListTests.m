//
//  RefinedElementForPictureListTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/31/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RefinedElementForPictureListTests.h"

@implementation RefinedElementForPictureListTests

- (NSDictionary *)returnTheRawDictionaryDataToAddWithGivenTimeLapse:(NSString *)timeLapse
{
	NSDictionary *dictionaryToReturn = [NSDictionary dictionaryWithObjectsAndKeys:timeLapse,@"dateupload", nil];
	return dictionaryToReturn;
}

- (NSString *)returnTheSecondsConvertedFromGivenHours:(NSString *)hours
{
	int seconds = (int)([hours floatValue] * -60 * 60);
	NSDate *date = [NSDate dateWithTimeIntervalSinceNow:seconds];
	int timeInSeconds = (int)[date timeIntervalSince1970];
	return [NSString stringWithFormat:@"%d",timeInSeconds];
}

- (void)setUp
{
	[super setUp];
}

- (void)tearDown
{
	[super tearDown];
}

- (void)testMethod_extractNameFromDictionaryDictionary
{
	NSString *timeLapse;
	NSString *input;
	NSString *output;
	
	input = @"0.46";
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:input];
	output = [RefinedElementForPictureList extractNameFromDictionary:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse]];
	STAssertTrue((int)([input doubleValue] *10) == (int)([output doubleValue]*10),@"The method extractNameFromDictionary does not output a correct string.");
	
	input = @"0.5";
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:input];
	output = [RefinedElementForPictureList extractNameFromDictionary:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse]];
	STAssertTrue((int)([input doubleValue] *10) == (int)([output doubleValue]*10),@"The method extractNameFromDictionary does not output a correct string.");
	
	input = @"1.2";
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:input];
	output = [RefinedElementForPictureList extractNameFromDictionary:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse]];
	STAssertTrue((int)([input doubleValue] *10) == (int)([output doubleValue]*10),@"The method extractNameFromDictionary does not output a correct string.");
	
	input = @"1";
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:input];
	output = [RefinedElementForPictureList extractNameFromDictionary:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse]];
	STAssertTrue((int)([input doubleValue] *10) == (int)([output doubleValue]*10),@"The method extractNameFromDictionary does not output a correct string.");
	
	input = @"0.8";
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:input];
	output = [RefinedElementForPictureList extractNameFromDictionary:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse]];
	STAssertTrue((int)([input doubleValue] *10) == (int)([output doubleValue]*10),@"The method extractNameFromDictionary does not output a correct string.");
	
	input = @"0.7";
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:input];
	output = [RefinedElementForPictureList extractNameFromDictionary:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse]];
	STAssertTrue((int)([input doubleValue] *10) == (int)([output doubleValue]*10),@"The method extractNameFromDictionary does not output a correct string.");
	
	input = @"2";
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:input];
	output = [RefinedElementForPictureList extractNameFromDictionary:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse]];
	STAssertTrue((int)([input doubleValue] *10) == (int)([output doubleValue]*10),@"The method extractNameFromDictionary does not output a correct string.");
	
	input = @"2";
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:input];
	output = [RefinedElementForPictureList extractNameFromDictionary:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse]];
	STAssertTrue((int)([input doubleValue] *10) == (int)([output doubleValue]*10),@"The method extractNameFromDictionary does not output a correct string.");
	
	input = @"200000";
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:input];
	output = [RefinedElementForPictureList extractNameFromDictionary:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse]];
	STAssertTrue((int)([input doubleValue] *10) == (int)([output doubleValue]*10),@"The method extractNameFromDictionary does not output a correct string.");
	
	input = @"200000.46";
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:input];
	output = [RefinedElementForPictureList extractNameFromDictionary:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse]];
	STAssertTrue((int)([input doubleValue] *10) == (int)([output doubleValue]*10),@"The method extractNameFromDictionary does not output a correct string.");
}

- (void)testMethod_Compare
{
	RefinedElementForPictureList *refinedElement1 = [[RefinedElementForPictureList alloc] init];
	RefinedElementForPictureList *refinedElement2 = [[RefinedElementForPictureList alloc] init];
	
	refinedElement1.name = nil;
	refinedElement2.name = nil;
	STAssertTrue([refinedElement1 compare:refinedElement2] == 0,@"The method should return 0 when both refinedElements are nil");
	
	refinedElement2.name = @"10";
	STAssertTrue([refinedElement1 compare:refinedElement2] == 0,@"The method should return 0 when either of refinedElement is nil");
	
	refinedElement1.name = @"-10";
	refinedElement2.name = nil;
	STAssertTrue([refinedElement1 compare:refinedElement2] == 0,@"The method should return 0 when either of refinedElement is nil");
	
	//refinedElement1 is larger
	refinedElement1.name = @"110";
	refinedElement2.name = @"10";
	STAssertTrue([refinedElement1 compare:refinedElement2] == 1,@"The method should return 0 when either of refinedElement is nil");
	
	refinedElement1.name = @"110";
	refinedElement2.name = @"0";
	STAssertTrue([refinedElement1 compare:refinedElement2] == 1,@"The method should return 0 when either of refinedElement is nil");
	
	refinedElement1.name = @"110";
	refinedElement2.name = @"-10";
	STAssertTrue([refinedElement1 compare:refinedElement2] == 1,@"The method should return 0 when either of refinedElement is nil");
	
	refinedElement1.name = @"0";
	refinedElement2.name = @"-10";
	STAssertTrue([refinedElement1 compare:refinedElement2] == 1,@"The method should return 0 when either of refinedElement is nil");
	
	refinedElement1.name = @"-10";
	refinedElement2.name = @"-110";
	STAssertTrue([refinedElement1 compare:refinedElement2] == 1,@"The method should return 0 when either of refinedElement is nil");
	
	//refinedElement2 is larger
	refinedElement1.name = @"10";
	refinedElement2.name = @"110";
	STAssertTrue([refinedElement1 compare:refinedElement2] == -1,@"The method should return 0 when either of refinedElement is nil");
	
	refinedElement1.name = @"0";
	refinedElement2.name = @"110";
	STAssertTrue([refinedElement1 compare:refinedElement2] == -1,@"The method should return 0 when either of refinedElement is nil");
	
	refinedElement1.name = @"-10";
	refinedElement2.name = @"110";
	STAssertTrue([refinedElement1 compare:refinedElement2] == -1,@"The method should return 0 when either of refinedElement is nil");
	
	refinedElement1.name = @"-10";
	refinedElement2.name = @"0";
	STAssertTrue([refinedElement1 compare:refinedElement2] == -1,@"The method should return 0 when either of refinedElement is nil");
	
	refinedElement1.name = @"-110";
	refinedElement2.name = @"-10";
	STAssertTrue([refinedElement1 compare:refinedElement2] == -1,@"The method should return 0 when either of refinedElement is nil");
	
	//equals
	refinedElement1.name = @"0";
	refinedElement2.name = @"0";
	STAssertTrue([refinedElement1 compare:refinedElement2] == 0,@"The method should return 0 when both are 0");
	
	
	refinedElement1.name = @"10";
	refinedElement2.name = @"10";
	STAssertTrue([refinedElement1 compare:refinedElement2] == 0,@"The method should return 0 when both have the same positive number");
	
	refinedElement1.name = @"-10";
	refinedElement2.name = @"-10";
	STAssertTrue([refinedElement1 compare:refinedElement2] == 0,@"The method should return 0 when both have the same negative number");
	
}

@end