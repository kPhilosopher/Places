//
//  PLFlickrDataSource.h
//  Places_09
//
//  Created by Jinwoo Baek on 11/15/11.
//

#import <Foundation/Foundation.h>
#import "FlickrDataHandler.h"

@interface PLFlickrDataSource : NSObject

extern NSString *PLAlertSwitchOff;
extern NSString *PLAlertSwitchOn;
extern NSString *PLPlaceID;

#pragma mark - Property

@property (nonatomic, retain) NSArray *flickrTopPlaces;
@property (nonatomic, retain) NSMutableArray *flickrMostRecentPlacesArray;
@property (nonatomic, retain) NSMutableArray *theElementSectionsOfFlickrTopPlaces;
@property (nonatomic, retain) NSMutableArray *theElementSectionsOfFlickrMostRecentPlaces;
@property (assign) NSString *alertViewSwitch;

#pragma mark - Public method

- (id)initWithFlickrDataHandler:(FlickrDataHandler *)flickrDataHandler;
- (NSArray *)photoListWithFlickrPlaceID:(NSString *)placeID;
- (void)addToTheMostRecentPlacesCollectionsTheFollowingDictionary:(NSDictionary *)dictionaryToAddToMostRecentList;
- (void)removeFromTheMostRecentPlacesCollectionsTheFollowingDictionary:(NSDictionary *)dictionaryToDelete;
//TODO: add tests for these methods.
- (void)setupFlickrTopPlacesWithFlickrFetcher;
- (void)setupThePropertiesOfMostRecentPlacesWithNSUserDefaults;

@end
