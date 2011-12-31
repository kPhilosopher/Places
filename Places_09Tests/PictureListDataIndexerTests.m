//
//  PictureListDataIndexerTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/29/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PictureListDataIndexerTests.h"

@implementation PictureListDataIndexerTests
@synthesize theElementSections = _theElementSections;
@synthesize rawData = _rawData;
@synthesize pictureListDataIndexer = _pictureListDataIndexer;

- (NSDictionary *)returnTheRawDictionaryDataToAddWithGivenTimeLapse:(NSString *)timeLapse TitleText:(NSString *)titleText andDescriptionText:(NSString *)descriptionText
{
	NSDictionary *descriptionTextDictionary = [NSDictionary dictionaryWithObjectsAndKeys:descriptionText,@"_content", nil];
	NSDictionary *dictionaryToReturn = [NSDictionary dictionaryWithObjectsAndKeys:titleText,@"title",descriptionTextDictionary,@"description",timeLapse,@"dateupload", nil];
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
	NSMutableArray *testData = [[NSMutableArray alloc] init];
	
	NSString *timeLapse;
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"0"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"Fixing" 
															 andDescriptionText:@"Boxers"]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"1.99"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"1.99" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"1.1"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"1.1" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"1"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"1" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"1.1"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"1.1" 
															 andDescriptionText:@"1"]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"1.1"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"1.1" 
															 andDescriptionText:@"2"]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"1.2"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"1.2" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"1.9"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"1.9" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"23.8"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"23.8" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"23"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"23" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"22"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"23.3"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"23.3" 
															 andDescriptionText:@""]];

	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"20"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"1" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"20"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"2" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"20"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"3" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"20"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"4" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"20"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"5" 
															 andDescriptionText:@""]];
	
	timeLapse = [self returnTheSecondsConvertedFromGivenHours:@"5000"];
	[testData addObject:[self returnTheRawDictionaryDataToAddWithGivenTimeLapse:timeLapse 
																	  TitleText:@"test" 
															 andDescriptionText:@"thisout"]];
	
	self.rawData = [testData autorelease];
	self.pictureListDataIndexer = [[[PictureListDataIndexer alloc] init] autorelease];
	self.theElementSections = [self.pictureListDataIndexer returnTheIndexedSectionsOfTheGiven:self.rawData];
}

- (void)tearDown
{
	[_theElementSections release];
	[_rawData release];
	[_pictureListDataIndexer release];
	[super tearDown];
}

- (void)testTheElementSections
{
	STAssertNotNil(self.theElementSections,@"The element sections should not be nil.");
	STAssertTrue(([self.theElementSections count] == 6),@"The element sections should have a count of 6 sections");
	STAssertTrue(([[self.theElementSections objectAtIndex:0] count] == 1),@"The first section's count is incorrect");
	STAssertTrue(([[self.theElementSections objectAtIndex:1] count] == 7),@"The second section's count is incorrect");
	STAssertTrue(([[self.theElementSections objectAtIndex:2] count] == 5),@"The third section's count is incorrect");
	STAssertTrue(([[self.theElementSections objectAtIndex:3] count] == 1),@"The fourth section's count is incorrect");
	STAssertTrue(([[self.theElementSections objectAtIndex:4] count] == 3),@"The fifth section's count is incorrect");
	STAssertTrue(([[self.theElementSections objectAtIndex:5] count] == 1),@"The sixth section's count is incorrect");
}

- (void)testSection
{
	RefinedElement *refinedElement = [[self.theElementSections objectAtIndex:0] objectAtIndex:0];
	STAssertTrue(([refinedElement.name intValue] == 0),@"The first section's 'name' should have the lowest value.");
	
	NSString *titleString = [refinedElement.dictionary objectForKey:@"title"];
	STAssertTrue([titleString isEqualToString:@"Fixing"],@"The title does not match the inputted title");
	
	NSString *subtitle = [[refinedElement.dictionary objectForKey:@"description"] objectForKey:@"_content"];
	STAssertTrue([subtitle isEqualToString:@"Boxers"],@"The subtitle does not match the inputted subtitle");
}

- (void)testSectionWithVaryingHours
{
	NSArray *sectionArray = [self.theElementSections objectAtIndex:1];
	
	RefinedElementForPictureList *refinedElement = [sectionArray objectAtIndex:0];
	STAssertTrue(([[refinedElement.dictionary objectForKey:@"title"] isEqualToString:@"1"]),@"The ordering of the element in this section is incorrect");
	refinedElement = [sectionArray objectAtIndex:1];
	STAssertTrue(([[refinedElement.dictionary objectForKey:@"title"] isEqualToString:@"1.1"]),@"The ordering of the element in this section is incorrect");	
	refinedElement = [sectionArray objectAtIndex:2];
	STAssertTrue(([[refinedElement.dictionary objectForKey:@"title"] isEqualToString:@"1.1"]),@"The ordering of the element in this section is incorrect");	
	refinedElement = [sectionArray objectAtIndex:3];
	STAssertTrue(([[refinedElement.dictionary objectForKey:@"title"] isEqualToString:@"1.1"]),@"The ordering of the element in this section is incorrect");	
	refinedElement = [sectionArray objectAtIndex:4];
	STAssertTrue(([[refinedElement.dictionary objectForKey:@"title"] isEqualToString:@"1.2"]),@"The ordering of the element in this section is incorrect");	
	refinedElement = [sectionArray objectAtIndex:5];
	STAssertTrue(([[refinedElement.dictionary objectForKey:@"title"] isEqualToString:@"1.9"]),@"The ordering of the element in this section is incorrect");	
	refinedElement = [sectionArray objectAtIndex:6];
	STAssertTrue(([[refinedElement.dictionary objectForKey:@"title"] isEqualToString:@"1.99"]),@"The ordering of the element in this section is incorrect");
}

- (void)testSectionWithRangeOfSameHourValuesInTheRawData
{
	NSArray *sectionArray = [self.theElementSections objectAtIndex:2];
	
	RefinedElementForPictureList *refinedElement = [sectionArray objectAtIndex:0];
	STAssertTrue(([refinedElement.name intValue] == 20),@"An element is not in the correct section");
	refinedElement = [sectionArray objectAtIndex:1];
	STAssertTrue(([refinedElement.name intValue] == 20),@"An element is not in the correct section");
	refinedElement = [sectionArray objectAtIndex:2];
	STAssertTrue(([refinedElement.name intValue] == 20),@"An element is not in the correct section");
	refinedElement = [sectionArray objectAtIndex:3];
	STAssertTrue(([refinedElement.name intValue] == 20),@"An element is not in the correct section");
	refinedElement = [sectionArray objectAtIndex:4];
	STAssertTrue(([refinedElement.name intValue] == 20),@"An element is not in the correct section");
}

- (void)testSectionWithFluctuatingHourValueInTheInputArray
{
	NSArray *sectionArray = [self.theElementSections objectAtIndex:3];
	STAssertTrue(([sectionArray count] == 1),@"The section setting algorithm has a bug");
	RefinedElementForPictureList *refinedElement = [sectionArray objectAtIndex:0];
	STAssertTrue(([refinedElement.name intValue] == 22),@"The section setting algorithm has a bug");
}

- (void)testCombinationOfVaryingHourValuesAndFluctuationOfHourValuesInTheInputArray
{
	NSArray *sectionArray = [self.theElementSections objectAtIndex:4];
	RefinedElementForPictureList *refinedElement = [sectionArray objectAtIndex:0];
	STAssertTrue([[refinedElement.dictionary objectForKey:@"title"] isEqualToString:@"23"],@"The algorithm that sorts the elements in each section, or the section setting algorithm has a bug");
	refinedElement = [sectionArray objectAtIndex:1];
	STAssertTrue([[refinedElement.dictionary objectForKey:@"title"] isEqualToString:@"23.3"],@"The algorithm that sorts the elements in each section, or the section setting algorithm has a bug");
	refinedElement = [sectionArray objectAtIndex:2];
	STAssertTrue([[refinedElement.dictionary objectForKey:@"title"] isEqualToString:@"23.8"],@"The algorithm that sorts the elements in each section, or the section setting algorithm has a bug");
}

- (void)testHighValueHour
{
	NSArray *sectionArray = [self.theElementSections objectAtIndex:5];
	
	RefinedElementForPictureList *refinedElement = [sectionArray objectAtIndex:0];
	NSString *titleString = [refinedElement.dictionary objectForKey:@"title"];
	STAssertTrue([titleString isEqualToString:@"test"],@"The title does not match the inputted title");
	
	NSString *subtitle = [[refinedElement.dictionary objectForKey:@"description"] objectForKey:@"_content"];
	STAssertTrue([subtitle isEqualToString:@"thisout"],@"The subtitle does not match the inputted subtitle");
}

@end