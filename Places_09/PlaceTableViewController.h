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
#import "NSString+TitleExtractor.h"
#import "DataReloadForTableViewControllerProtocol.h"

@interface PlaceTableViewController : IndexedTableViewController <DataReloadForTableViewControllerProtocol>
{
	@private
	FlickrDataSource *_flickrDataSource;
	id <PictureListTableViewControllerDelegateProtocol> _delegateToTransfer;
}

@property (retain) FlickrDataSource *flickrDataSource;
@property (assign) id <PictureListTableViewControllerDelegateProtocol> delegateToTransfer;

- (id)initWithStyle:(UITableViewStyle)style withTheFlickrDataSource:(FlickrDataSource *)theFlickrDataSource withTheDataIndexer:(DataIndexer *)dataIndexer;

@end
