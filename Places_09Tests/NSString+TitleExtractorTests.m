//
//  NSString+TitleExtractorTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 1/1/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "NSString+TitleExtractorTests.h"

@implementation NSString_TitleExtractorTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testMethod_initialStringWithDelimiterSet
{
	NSString *input;
	NSString *output;
	
	input = nil;
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertNil(output,@"");
	
	input = @"";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertTrue([output isEqualToString:input],@"");
	
	input = @"The String";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertTrue([output isEqualToString:input],@"");
	
	input = @"The String   ";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertFalse([output isEqualToString:input],@"");
	
	input = @"   The String";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertFalse([output isEqualToString:input],@"");
	
	input = @"  The String  ";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertFalse([output isEqualToString:input],@"");
	
	input = @"My Name, Your Name, His/Her Name";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertTrue([output isEqualToString:@"My Name"],@"");
	
	input = @"My Name   , Your Name, His/Her Name";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertTrue([output isEqualToString:@"My Name"],@"");
	
	input = @"    My Name, Your Name, His/Her Name";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertTrue([output isEqualToString:@"My Name"],@"");
	
	
	input = @"   My Name   , Your Name, His/Her Name";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertTrue([output isEqualToString:@"My Name"],@"");
	
	
	input = @",My Name, Your Name, His/Her Name";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertTrue([output isEqualToString:@""],@"");
	
	input = @"     ,My Name, Your Name, His/Her Name";
	output = [input initialStringWithDelimiterSet:[NSString characterSetWithComma]];
	STAssertTrue([output isEqualToString:@""],@"");
}	

- (void)testMethod_enumerateStringToDetermineTheExistanceOfCharacterInSet
{
	NSString *input;
	BOOL output;
	NSCharacterSet *characterSet;
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@","];
	input = nil;
	output = [input enumerateStringToDetermineTheExistanceOfCharacterInSet:characterSet];
	STAssertTrue(output == NO,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@","];
	input = @"";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterInSet:characterSet];
	STAssertTrue(output == NO,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@","];
	input = @"Hello, World!";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterInSet:characterSet];
	STAssertTrue(output == YES,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@"!"];
	input = @"Hello, World!";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterInSet:characterSet];
	STAssertTrue(output == YES,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@","];
	input = @"Hello World!";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterInSet:characterSet];
	STAssertTrue(output == NO,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@",!"];
	input = @",,,";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterInSet:characterSet];
	STAssertTrue(output == YES,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@""];
	input = @"Hello, World!";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterInSet:characterSet];
	STAssertTrue(output == NO,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@""];
	input = nil;
	output = [input enumerateStringToDetermineTheExistanceOfCharacterInSet:characterSet];
	STAssertTrue(output == NO,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@""];
	input = @"";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterInSet:characterSet];
	STAssertTrue(output == NO,@"");
}

@end
