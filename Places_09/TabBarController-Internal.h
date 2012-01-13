//
//  TabBarController_Internal.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/20/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//
#import "TabBarController.h"

@interface TabBarController()

- (void)setup;
- (void)allocInitTheNavigationViewControllers;
- (void)setupTheCustomTableViewControllers;
- (void)pushViewControllersToNavigationViewControllers;
- (void)setTabBarItemToSystemItems;
- (void)releaseViewControllersThatArePushedIntoTheViewControllerHierarchy;
- (void)setDelegateToTransferForTableViewControllers;
- (void)allocInitThePlaceTableViewControllersWithTheSameFlickrDataSource;
- (void)addTheNavigationControllersToThisTabBarController;

@end