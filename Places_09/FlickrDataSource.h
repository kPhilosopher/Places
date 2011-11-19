//
//  FlickrDataSource.h
//  Places
//
//  Created by Jinwoo Baek on 11/15/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrFetcher.h"

@interface FlickrDataSource : NSObject
{
	NSArray *flickrTopPlacesArray;
    NSArray *flickrFavoritePlacesArray;
}

@property (nonatomic,retain) NSArray *flickrTopPlacesArray;
@property (nonatomic,retain) NSArray *flickrFavoritePlacesArray;

-(NSArray *) retrievePhotosAtSpecific:(NSString *)flickrPlaceId;
//-(NSArray *) retrieveTopPlacesFromFlickr;
-(BOOL) notifyRecentlyViewedPlaceWith:(int) index;
@end
