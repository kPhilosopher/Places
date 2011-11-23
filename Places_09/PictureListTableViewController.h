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

@interface PictureListTableViewController : UITableViewController
{
	@private
	NSArray *listOfPictures_theModel;
}

@property (retain) NSArray *listOfPictures_theModel;
@end
