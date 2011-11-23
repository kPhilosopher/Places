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
	@private
	NSArray *flickrTopPlacesArray;
    NSMutableArray *flickrMostRecentPlacesArray;
	NSMutableSet *flickrMostRecentPlacesSet;
}

@property (nonatomic,retain) NSArray *flickrTopPlacesArray;
@property (nonatomic,retain) NSMutableArray *flickrMostRecentPlacesArray;

-(NSArray *) retrievePhotoListForSpecific:(NSString *)flickrPlaceId;
-(void) setThePropertyToTheTopPlacesFromFlickr;
-(void) addToTheMostRecentListOfPlacesTheFollowing:(NSDictionary *)dictionary;
@end
