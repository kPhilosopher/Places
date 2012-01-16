//
//  AppDelegate.h
//  Places_09
//
//  Created by Jinwoo Baek on 10/31/11.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, PictureListTableViewControllerDelegate>

extern NSString *PLTitleOfScrollableViewController;

#pragma  mark - Property

@property (strong, nonatomic) UIWindow *window;
@property (retain) TabBarController *tabBarController;
@property (retain) ScrollableImageViewController *scrollableImageVC;
@property (retain) UISplitViewController *splitVC;

@end
