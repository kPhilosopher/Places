//
//  PLAppDelegate_Internal.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/20/11.
//

#import "PLAppDelegate.h"

@interface PLAppDelegate ()
{
@private
	PLTabBarController *PL_tabBarController;
	ScrollableImageViewController *PL_scrollableImageVC;
	PLSplitViewController *PL_splitVC;
}

#pragma mark - Readability method

- (void)RD_setupTheAppDelegateWindow;
- (void)RD_initializeTabBarController;
- (void)RD_setupForScrollableImageViewController;
- (void)RD_determineTheSetupSequenceForDifferingDevices;
- (BOOL)RD_determineIfTheDeviceIsiPadOrNot;
- (void)RD_setupForiPad;
- (void)RD_setupForiPhoneOriPod;
- (void)RD_runKIFIfRunningIntegrationTest;
- (void)RD_setupSplitViewControllerWithNavigationController:(UINavigationController*)navcon;

@end
