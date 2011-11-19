//
//  FlickrDataSource.m
//  Places
//
//  Created by Jinwoo Baek on 11/15/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "FlickrDataSource.h"

@implementation FlickrDataSource
@synthesize flickrTopPlacesArray, flickrFavoritePlacesArray;

-(NSArray *) flickrTopPlacesArray
{
    if (!flickrTopPlacesArray) 
	{
        id temporaryFlickrTopPlaces = [FlickrFetcher topPlaces];
        if ([temporaryFlickrTopPlaces isKindOfClass:[NSArray class]])
        {
			flickrTopPlacesArray = (NSArray *) temporaryFlickrTopPlaces;
        }
    }
	return flickrTopPlacesArray;
}

-(NSArray *) retrievePhotosAtSpecific:(NSString *)flickrPlaceId
{
	NSArray *arrayOfPhotos;
	id temporaryRetrievedPhotos = [FlickrFetcher photosAtPlace:flickrPlaceId];
	if ([temporaryRetrievedPhotos isKindOfClass:[NSArray class]])
	{
		arrayOfPhotos = (NSArray *) temporaryRetrievedPhotos;
	}
//	NSLog([arrayToReturn description]);
	return arrayOfPhotos;
}

-(BOOL)notifyRecentlyViewedPlaceWith:(int)index
{
	return YES;
}

-(void)dealloc
{
	[flickrTopPlacesArray release];
	[super dealloc];
}

@end