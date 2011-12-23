//
//  MostRecentTableViewController.h
//  Places_09
//
//  Created by Jinwoo Baek on 11/18/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceTableViewController.h"
#import "DataReloadForMostRecentTableViewControllerProtocol.h"

@interface MostRecentTableViewController : PlaceTableViewController <DataReloadForMostRecentTableViewControllerProtocol>
{
}
@end
