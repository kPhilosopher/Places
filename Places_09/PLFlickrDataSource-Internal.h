//
//  PLFlickrDataSource_Internal.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/20/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "PLFlickrDataSource.h"

@interface PLFlickrDataSource ()

extern NSString *keyForMostRecentArray;
extern NSString *keyForMostRecentSet;

@property (nonatomic ,retain) NSMutableSet *flickrMostRecentPlacesSet;
@property (nonatomic ,retain) FlickrDataHandler *flickrDataHandler;


- (void)P_updateMostRecentDataToStandardUserDefaults;
- (int)P_returnIndexOfFlickrMostRecentPlacesArrayThatContainsPlaceIDString:(NSString *)placeID;

@end
