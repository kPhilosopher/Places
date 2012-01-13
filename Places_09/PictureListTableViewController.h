//
//  PictureListTableViewController.h
//  Places_09
//
//  Created by Jinwoo Baek on 11/21/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollableImageViewController.h"
#import "FlickrFetcher.h"
#import "IndexedTableViewController.h"
#import "PictureListDataIndexer.h"

@class PictureListTableViewController;

@protocol PictureListTableViewControllerDelegate

-(ScrollableImageViewController *)getScrollableImageViewControllerForRequestor:(id)requestor;

@end

@interface PictureListTableViewController : IndexedTableViewController
{
	@private
	NSArray *_listOfPictures_theModel;
	NSMutableArray *_listOfPicturesIndexed_theModel;
	id <PictureListTableViewControllerDelegate> _delegate;
}

extern NSString *PictureListViewAccessibilityLabel;
extern NSString *PictureListBackBarButtonAccessibilityLabel;

@property (retain) NSArray *listOfPictures_theModel;
@property (retain) NSMutableArray *listOfPicturesIndexed_theModel;
@property (retain) id <PictureListTableViewControllerDelegate> delegate;
- (id)initWithStyle:(UITableViewStyle)style withPictureList:(NSArray *)pictureList;
@end
