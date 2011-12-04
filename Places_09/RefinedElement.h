//
//  RefinedElement.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RefinedElement : NSObject
{
@private
	NSDictionary *dictionary;
	NSInteger sectionNumber;
	NSString *name;
}
@property (retain) NSDictionary *dictionary;
@property NSInteger sectionNumber;
@property (copy) NSString *name;
+(NSString *)extractNameFrom:(NSDictionary *)rawElement;
@end