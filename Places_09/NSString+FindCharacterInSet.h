//
//  NSString+FindCharacterInSet.h
//  Places_09
//
//  Created by Jinwoo Baek on 1/8/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FindCharacterInSet)

- (BOOL)enumerateStringToDetermineTheExistanceOfCharacterOfSet:(NSCharacterSet *)aSet;

@end
