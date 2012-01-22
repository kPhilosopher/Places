//
//  PLSplitViewController.m
//  Places_09
//
//  Created by Jinwoo Baek on 12/23/11.
//

#import "PLSplitViewController.h"

@implementation PLSplitViewController

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
			interfaceOrientation == UIInterfaceOrientationLandscapeRight ||
			interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
