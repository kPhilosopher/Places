//
//  PlaceTableViewController.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureListTableViewController.h"
#import "IndexedTableViewController.h"

@interface PlaceTableViewController : IndexedTableViewController
{
	@private
	FlickrDataSource *flickrDataSource;
	id <PictureListTableViewControllerDelegateProtocol> delegateToTransfer;
}
@property (retain) FlickrDataSource *flickrDataSource;
@property (assign) id <PictureListTableViewControllerDelegateProtocol> delegateToTransfer;
- (id)initWithStyle:(UITableViewStyle)style andWith:(FlickrDataSource *)theFlickrDataSource;
@end