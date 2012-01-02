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

- (void)testMethod_ExtractTheFirstStringWithCommaDelimeter
{
	NSString *input;
	NSString *output;
	
	input = nil;
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertNil(output,@"");
	
	input = @"";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertTrue([output isEqualToString:input],@"");
	
	input = @"The String";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertTrue([output isEqualToString:input],@"");
	
	input = @"The String   ";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertFalse([output isEqualToString:input],@"");
	
	input = @"   The String";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertFalse([output isEqualToString:input],@"");
	
	input = @"  The String  ";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertFalse([output isEqualToString:input],@"");
	
	input = @"My Name, Your Name, His/Her Name";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertTrue([output isEqualToString:@"My Name"],@"");
	
	input = @"My Name   , Your Name, His/Her Name";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertTrue([output isEqualToString:@"My Name"],@"");
	
	input = @"    My Name, Your Name, His/Her Name";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertTrue([output isEqualToString:@"My Name"],@"");
	
	
	input = @"   My Name   , Your Name, His/Her Name";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertTrue([output isEqualToString:@"My Name"],@"");
	
	
	input = @",My Name, Your Name, His/Her Name";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertTrue([output isEqualToString:@""],@"");
	
	input = @"     ,My Name, Your Name, His/Her Name";
	output = [input extractTheFirstStringWithCommaDelimeter];
	STAssertTrue([output isEqualToString:@""],@"");
}	

- (void)testMethod_EnumerateStringToDetermineTheExistanceOfCharacterOfSet
{
	NSString *input;
	BOOL output;
	NSCharacterSet *characterSet;
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@","];
	input = nil;
	output = [input enumerateStringToDetermineTheExistanceOfCharacterOfSet:characterSet];
	STAssertTrue(output == NO,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@","];
	input = @"";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterOfSet:characterSet];
	STAssertTrue(output == NO,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@","];
	input = @"Hello, World!";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterOfSet:characterSet];
	STAssertTrue(output == YES,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@"!"];
	input = @"Hello, World!";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterOfSet:characterSet];
	STAssertTrue(output == YES,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@","];
	input = @"Hello World!";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterOfSet:characterSet];
	STAssertTrue(output == NO,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@",!"];
	input = @",,,";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterOfSet:characterSet];
	STAssertTrue(output == YES,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@""];
	input = @"Hello, World!";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterOfSet:characterSet];
	STAssertTrue(output == NO,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@""];
	input = nil;
	output = [input enumerateStringToDetermineTheExistanceOfCharacterOfSet:characterSet];
	STAssertTrue(output == NO,@"");
	
	characterSet = [NSCharacterSet characterSetWithCharactersInString:@""];
	input = @"";
	output = [input enumerateStringToDetermineTheExistanceOfCharacterOfSet:characterSet];
	STAssertTrue(output == NO,@"");
}

@end
