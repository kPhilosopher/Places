//
//  FlickrDataSource.h
//  Places
//
//  Created by Jinwoo Baek on 11/15/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrDataHandler.h"
#import "DisplayAlertViewProtocol.h"

@interface FlickrDataSource : NSObject
{
	@private
	NSArray *_flickrTopPlacesArray;
    NSMutableArray *_flickrMostRecentPlacesArray;
	NSMutableArray *_theElementSectionsForTopPlaces;
	NSMutableArray *_theElementSectionsForMostRecentPlaces;
	NSMutableSet *_flickrMostRecentPlacesSet;
	FlickrDataHandler *_flickrDataHandler;
	id<DisplayAlertViewProtocol> _alertDelegate;
}

@property (nonatomic,retain) NSArray *flickrTopPlacesArray;
@property (nonatomic,retain) NSMutableArray *flickrMostRecentPlacesArray;
@property (nonatomic,retain) NSMutableArray *theElementSectionsForTopPlaces;
@property (nonatomic,retain) NSMutableArray *theElementSectionsForMostRecentPlaces;
@property (assign) id<DisplayAlertViewProtocol> alertDelegate;

- (id)initWithFlickrDataHandler:(FlickrDataHandler *)flickrDataHandler;
- (NSArray *)getPhotoListForSpecificFlickrPlaceID:(NSString *)flickrPlaceId;
- (void)addToTheMostRecentListOfPlacesTheFollowing:(NSDictionary *)dictionaryToAddToMostRecentList;
- (void)deleteFromMostRecentListThePlaceWithTheFollowing:(NSDictionary *)dictionaryToDelete;
- (void)setupForTopPlacesArrayFromFlickr;

@end