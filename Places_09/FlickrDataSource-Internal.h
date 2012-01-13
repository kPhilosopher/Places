//
//  FlickrDataSource_Internal.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/20/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "FlickrDataSource.h"

@interface FlickrDataSource ()

extern NSString *keyForMostRecentArray;
extern NSString *keyForMostRecentSet;

@property (nonatomic ,retain) NSMutableSet *flickrMostRecentPlacesSet;
@property (nonatomic ,retain) FlickrDataHandler *flickrDataHandler;


- (void)updateMostRecentDataToStandardUserDefaults;
- (int)returnIndexOf_flickrMostRecentPlacesArray_ThatContains:(NSString *)placed_idOfItsDictionary;

@end