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
	NSArray *_flickrTopPlacesArray;
    NSMutableArray *_flickrMostRecentPlacesArray;
	NSMutableArray *_theElementSectionsForTopPlaces;
	NSMutableArray *_theElementSectionsForMostRecentPlaces;
	NSMutableSet *_flickrMostRecentPlacesSet;
}

@property (nonatomic,retain) NSArray *flickrTopPlacesArray;
@property (nonatomic,retain) NSMutableArray *flickrMostRecentPlacesArray;
@property (nonatomic,retain) NSMutableArray *theElementSectionsForTopPlaces;
@property (nonatomic,retain) NSMutableArray *theElementSectionsForMostRecentPlaces;

- (NSArray *)retrievePhotoListForSpecific:(NSString *)flickrPlaceId;
- (void)addToTheMostRecentListOfPlacesTheFollowing:(NSDictionary *)dictionaryToAddToMostRecentList;
- (void)deleteFromMostRecentListThePlaceWithTheFollowing:(NSDictionary *)dictionaryToDelete;

@end