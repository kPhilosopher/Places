//
//  AppDelegateTests.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/19/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import "AppDelegate.h"

@interface AppDelegateTests : SenTestCase
{
	@private
	AppDelegate *_appDelegate;
}
@property (retain) AppDelegate *appDelegate;
@end
