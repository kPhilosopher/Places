//
//  PLSplitViewControllerTests.m
//  Places_09
//
//  Created by Jinwoo Baek on 1/6/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "PLSplitViewControllerTests.h"

#import <UIKit/UIKit.h>
#import "PLSplitViewController.h"
//#import "application_headers" as required

@implementation PLSplitViewControllerTests

- (void)testShouldAutorotateToInterfaceOrientation
{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		PLSplitViewController *splitVC = [[PLSplitViewController alloc] init];
		STAssertTrue([splitVC shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortrait],@"");
		STAssertTrue([splitVC shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeRight],@"");
		STAssertTrue([splitVC shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft],@"");
		STAssertFalse([splitVC shouldAutorotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown],@"");
	}
}

@end
