//
//  RefinedElementForPictureList.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RefinedElement.h"
@interface RefinedElementForPictureList : RefinedElement
{
	@private
	NSDate *hoursSinceUpload;
}
@property (retain) NSDate *hoursSinceUpload;
@end
