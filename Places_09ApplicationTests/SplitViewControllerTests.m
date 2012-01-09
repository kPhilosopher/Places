//
//  SplitViewControllerTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 1/6/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "SplitViewControllerTests.h"

#import <UIKit/UIKit.h>
#import "SplitViewController.h"
//#import "application_headers" as required

@implementation SplitViewControllerTests

- (void)testShouldAutorotateToInterfaceOrientation
{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		SplitViewController *splitVC = [[SplitViewController alloc] init];
		STAssertTrue([splitVC shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait],@"");
		STAssertTrue([splitVC shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeRight],@"");
		STAssertTrue([splitVC shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft],@"");
		STAssertFalse([splitVC shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown],@"");
	}
}

@end
