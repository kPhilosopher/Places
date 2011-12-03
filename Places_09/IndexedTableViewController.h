//
//  IndexedTableViewController.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/2/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrDataSource.h"
#import "RefinedElementForPlaces.h"

@interface IndexedTableViewController : UITableViewController
{
	@private
	NSMutableArray *theElementSections;
	NSArray *rawData;
}
@end

@interface IndexedTableViewController()
@property (retain) NSMutableArray *theElementSections;
@property (retain) NSArray *rawData;
@end
