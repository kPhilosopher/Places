//
//  PictureListTableViewControllerTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 1/8/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PictureListTableViewControllerTests.h"

#import <UIKit/UIKit.h>

@implementation PictureListTableViewControllerTests

//- (void)setUp
//{
//	setup]
//}

// All code under test is in the iOS Application
- (void)testAppDelegate
{
    id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
}

@end
