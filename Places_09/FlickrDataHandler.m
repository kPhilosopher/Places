//
//  FlickrDataHandler.m
//  Places_09
//
//  Created by Jinwoo Baek on 1/2/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "FlickrDataHandler.h"

@implementation FlickrDataHandler

- (NSArray *)getTopPlacesFromFlickr;
{
	return [FlickrFetcher topPlaces];
}

- (NSArray *)getPhotoListsAtPlace:(NSString *)flickrPlaceId;
{
	return [FlickrFetcher photosAtPlace:flickrPlaceId];
}

@end