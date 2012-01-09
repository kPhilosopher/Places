//
//  FlickrDataSource_Hidden.h
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
extern NSString *alertTitle;
extern NSString *alertMessage;

@property (nonatomic,retain) NSMutableSet *flickrMostRecentPlacesSet;
@property (retain) FlickrDataHandler *flickrDataHandler;

- (void)setThePropertyForMostRecentPlaces;
- (void)updateMostRecentDataToStandardUserDefaults;
- (int)returnIndexOf_flickrMostRecentPlacesArray_ThatContains:(NSString *)placed_idOfItsDictionary;

@end