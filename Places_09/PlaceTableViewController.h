//
//  PlaceTableViewController.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrDataSource.h"
#import "PictureListTableViewController.h"

@interface PlaceTableViewController : UITableViewController
{
	FlickrDataSource *flickrDataSource;
	NSArray *flickrArray;
	id <PictureListTableViewControllerDelegateProtocol> delegateToTransfer;
}
@property (retain) FlickrDataSource *flickrDataSource;
@property (retain) NSArray *flickrArray;
@property (assign) id <PictureListTableViewControllerDelegateProtocol> delegateToTransfer;
- (id)initWithStyle:(UITableViewStyle)style and:(FlickrDataSource *)theFlickrDataSource;
@end

