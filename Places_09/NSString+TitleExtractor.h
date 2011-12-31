//
//  NSString+TitleExtractor.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/26/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

//TODO: build logic unit test for this class.
@interface NSString (TitleExtractor)

- (NSString *)extractTheFirstStringWithCommaDelimeter;
- (BOOL)enumerateStringToDetermineTheExistanceOfCharacterOfSet:(NSCharacterSet *)aSet;
@end
