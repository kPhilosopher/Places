//
//  TabBarController.h
//  Places_09
//
//  Created by Jinwoo Baek on 11/7/11.
//

#import <UIKit/UIKit.h>
#import "TopPlacesTableViewController.h"
#import "MostRecentTableViewController.h"

@interface TabBarController : UITabBarController

extern NSString *PLTabBarViewAccessibilityLabel;

@property (retain) id <PictureListTableViewControllerDelegate> delegateToTransfer;

#pragma mark - Initialization

- (id)initWithDelegate:(id)delegate;

@end