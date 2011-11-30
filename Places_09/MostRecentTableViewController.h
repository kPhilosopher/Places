//
//  MostRecentTableViewController.h
//  Places_09
//
//  Created by Jinwoo Baek on 11/18/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrDataSource.h"
#import "PictureListTableViewController.h"

@interface MostRecentTableViewController : UITableViewController
{
	FlickrDataSource *flickrDataSource;
	id <PictureListTableViewControllerDelegateProtocol> delegateToTransfer;
}
@property (retain) FlickrDataSource *flickrDataSource;
@property (retain) id <PictureListTableViewControllerDelegateProtocol> delegateToTransfer;
@end
