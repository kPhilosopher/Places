//
//  PLAppDelegate.h
//  Places_09
//
//  Created by Jinwoo Baek on 10/31/11.
//

#import <UIKit/UIKit.h>
#import "PLTabBarController.h"

@interface PLAppDelegate : UIResponder <UIApplicationDelegate, PictureListTableViewControllerDelegate>

extern NSString *PLTitleOfScrollableViewController;

#pragma  mark - Property

@property (strong, nonatomic) UIWindow *window;
@property (retain) PLTabBarController *tabBarController;
@property (retain) ScrollableImageViewController *scrollableImageVC;
@property (retain) UISplitViewController *splitVC;

@end
