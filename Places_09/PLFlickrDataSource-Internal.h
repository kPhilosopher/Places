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
	NSArray *PL_flickrTopPlaces;
    NSMutableArray *PL_flickrMostRecentPlacesArray;
	NSMutableArray *PL_theElementSectionsOfFlickrTopPlaces;
	NSMutableArray *PL_theElementSectionsOfFlickrMostRecentPlaces;
	NSMutableSet *PL_flickrMostRecentPlacesSet;
	FlickrDataHandler *PL_flickrDataHandler;
	NSString *PL_alertViewSwitch;
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
