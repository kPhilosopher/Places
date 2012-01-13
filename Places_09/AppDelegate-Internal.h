//
//  AppDelegate_Internal.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/20/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

- (void)setupTheAppDelegateWindow;
- (void)initializeTabBarController;
- (void)setupForScrollableImageViewController;
- (void)determineTheSetupSequenceForDifferingDevices;
- (BOOL)determineIfTheDeviceIsiPadOrNot;
- (void)setupForiPad;
- (void)setupForiPhoneOriPod;
- (void)runKIFIfRunningIntegrationTest;
- (void)setupSplitViewController:(UINavigationController*)navcon;

@end
