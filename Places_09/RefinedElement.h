//
//  RefinedElement.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//
// !!!: This class is designed to be subclassed

#import <Foundation/Foundation.h>

@interface RefinedElement : NSObject
{
@private
	NSDictionary *_dictionary;
	NSInteger _sectionNumber;
	NSString *_name;
}
@property (retain) NSDictionary *dictionary;
@property NSInteger sectionNumber;
@property (copy) NSString *name;

#pragma mark - Class methods

+(NSString *)extractNameFromDictionary:(NSDictionary *)rawElement;

@end