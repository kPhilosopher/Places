//
//  AppDelegate.h
//  Places
//
//  Created by Jinwoo Baek on 10/31/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
@private
	TabBarController *tab_Bar_Controller;
}

@property (strong, nonatomic) UIWindow *window;
@property (retain) TabBarController *tab_Bar_Controller;
@end
