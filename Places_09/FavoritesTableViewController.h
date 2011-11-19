//
//  FavoritesTableViewController.h
//  Places
//
//  Created by Jinwoo Baek on 11/7/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrDataSource.h"

@interface FavoritesTableViewController : UITableViewController
{
	FlickrDataSource *flickrDataSource;
}
@property (retain) FlickrDataSource *flickrDataSource;
@end
