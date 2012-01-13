//
//  PlaceTableViewController.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//
// !!!: This class is designed to be subclassed.

#import <UIKit/UIKit.h>
#import "PictureListTableViewController.h"
#import "IndexedTableViewController.h"
#import "PlacesDataIndexer.h"
#import "NSString+TitleExtraction.h"
#import "NSString+FindCharacterInSet.h"
#import "TableViewControllerDataReloading.h"

@interface PlaceTableViewController : IndexedTableViewController <TableViewControllerDataReloading>
{
	@private
	FlickrDataSource *_flickrDataSource;
	id <PictureListTableViewControllerDelegate> _delegateToTransfer;
}

extern NSString *PlacesTableViewAccessibilityLabel;

@property (retain) FlickrDataSource *flickrDataSource;
@property (assign) id <PictureListTableViewControllerDelegate> delegateToTransfer;

- (id)initWithStyle:(UITableViewStyle)style withTheFlickrDataSource:(FlickrDataSource *)theFlickrDataSource withTheDataIndexer:(DataIndexer *)dataIndexer;

@end
