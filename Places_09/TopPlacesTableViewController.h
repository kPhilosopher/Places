//
//  TopPlacesTableViewController.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/19/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceTableViewController.h"
#import "DataReloadForTableViewControllerProtocol.h"

@interface TopPlacesTableViewController : PlaceTableViewController
{
	@private
	id<DataReloadForTableViewControllerProtocol> _delegateToUpdateMostRecentPlaces;
}

@property (retain) id<DataReloadForTableViewControllerProtocol> delegateToUpdateMostRecentPlaces;

@end
