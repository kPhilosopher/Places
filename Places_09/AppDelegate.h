//
//  AppDelegate.h
//  Places_09
//
//  Created by Jinwoo Baek on 10/31/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, PictureListTableViewControllerDelegateProtocol>
{
@private
	TabBarController *_tab_Bar_Controller;
	ScrollableImageViewController *_scrollableImageVC;
	UISplitViewController *_splitVC;
}

@property (strong, nonatomic) UIWindow *window;
@property (retain) TabBarController *tab_Bar_Controller;
@property (retain) ScrollableImageViewController *scrollableImageVC;
@property (retain) UISplitViewController *splitVC;

@end
