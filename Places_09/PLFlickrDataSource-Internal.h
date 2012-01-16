//
//  PLFlickrDataSource_Internal.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/20/11.
//


#import <Foundation/Foundation.h>
#import "PLFlickrDataSource.h"

@interface PLFlickrDataSource ()
{
@private
	NSArray *_flickrTopPlaces;
    NSMutableArray *_flickrMostRecentPlacesArray;
	NSMutableArray *_theElementSectionsOfFlickrTopPlaces;
	NSMutableArray *_theElementSectionsOfFlickrMostRecentPlaces;
	NSMutableSet *_flickrMostRecentPlacesSet;
	FlickrDataHandler *_flickrDataHandler;
	NSString *_alertViewSwitch;
}

extern NSString *PLKeyForMostRecentArray;
extern NSString *PLKeyForMostRecentSet;

#pragma mark - Property

@property (nonatomic, retain) NSMutableSet *flickrMostRecentPlacesSet;
@property (nonatomic, retain) FlickrDataHandler *flickrDataHandler;

#pragma mark - Convenience method

- (void)PL_updateMostRecentPlacesCollectionsInStandardUserDefaults;
- (int)PL_indexOfFlickrMostRecentPlacesArrayContainingPlaceIDString:(NSString *)placeID;
- (void)PL_mutateKeyValueObservedPropertyAlertViewSwitchToAlertSwitchOn;

#pragma mark - Readability method

- (void)RD_removeFromFlickrMostRecentPlacesArrayTheDictionaryWithTheFollowingPlaceIDString:(NSString *)placeID;
- (void)RD_enqueueIntoTheMostRecentPlacesArrayTheFollowingDictionary:(NSDictionary *)dictionary;
- (void)RD_dequeueIfTheMostRecentPlacesArrayReachesMaximumSize;
- (void)RD_determineIfMostRecentPlacesSetIncludesPlaceIDString:(NSString *)placeID;
- (void)RD_jumpOutOfForLoopWithCounter:(int)counter;

@end
