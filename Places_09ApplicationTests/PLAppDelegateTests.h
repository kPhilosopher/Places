//
//  PLAppDelegateTests.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/19/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "PLAppDelegate.h"

@interface PLAppDelegateTests : SenTestCase
{
	@private
	PLAppDelegate *PL_appDelegate;
}
@property (retain) PLAppDelegate *appDelegate;
@end
