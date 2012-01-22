//
//  PLFlickrDataSource.m
//  Places_09
//
//  Created by Jinwoo Baek on 11/15/11.
//

#import "PLFlickrDataSource.h"
#import "PLFlickrDataSource-Internal.h"

@implementation PLFlickrDataSource

@synthesize flickrTopPlaces = PL_flickrTopPlaces;
@synthesize flickrMostRecentPlacesArray = PL_flickrMostRecentPlacesArray;
@synthesize flickrMostRecentPlacesSet = PL_flickrMostRecentPlacesSet;
@synthesize theElementSectionsOfFlickrTopPlaces = PL_theElementSectionsOfFlickrTopPlaces;
@synthesize theElementSectionsOfFlickrMostRecentPlaces = PL_theElementSectionsOfFlickrMostRecentPlaces;
@synthesize flickrDataHandler = PL_flickrDataHandler;
@synthesize alertViewSwitch = PL_alertViewSwitch;

const int PLMaximumOfMostRecentPlacesList = 10;
const int PLIndexIsNegativeOne = -1;

NSString *PLKeyForMostRecentArray = @"mostRecentArrayKey";
NSString *PLKeyForMostRecentSet = @"mostRecentSetKey";
NSString *PLPlaceID = @"place_id";
NSString *PLAlertSwitchOff = @"AlertOff";
NSString *PLAlertSwitchOn = @"AlertOn";

#pragma mark - Initialization sequence

- (id)init
{
	self = [super init];
	return [self initWithFlickrDataHandler:[[[FlickrDataHandler alloc] init] autorelease]];
}

- (id)initWithFlickrDataHandler:(FlickrDataHandler *)flickrDataHandler;
{
	self = [super init];
	self.flickrDataHandler = flickrDataHandler;
	self.alertViewSwitch = PLAlertSwitchOff;
	return self;
}

#pragma mark - Data setup

- (void)setupFlickrTopPlacesWithFlickrFetcher;
{
	id undeterminedFlickrTopPlaces = [self.flickrDataHandler topPlacesFromFlickr];
	if ([undeterminedFlickrTopPlaces isKindOfClass:[NSArray class]])
			self.flickrTopPlaces = (NSArray *)undeterminedFlickrTopPlaces;
	else	[self PL_mutateKeyValueObservedPropertyAlertViewSwitchToPLAlertSwitchOn];
}

- (void)setupThePropertiesOfMostRecentPlacesWithNSUserDefaults;
{
	self.flickrMostRecentPlacesArray = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:PLKeyForMostRecentArray]];
	self.flickrMostRecentPlacesSet = [NSMutableSet setWithSet:[NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:PLKeyForMostRecentSet]]];
}

#pragma mark - Flickr Public Method

- (NSArray *)photoListWithFlickrPlaceID:(NSString *)placeID
{
	NSArray *flickrPhotoList = nil;
	id undeterminedFlickrPhotoList = [self.flickrDataHandler photoListWithPlaceIDString:placeID];
	if ([undeterminedFlickrPhotoList isKindOfClass:[NSArray class]])
		flickrPhotoList = (NSArray *)undeterminedFlickrPhotoList;
	else
		[self PL_mutateKeyValueObservedPropertyAlertViewSwitchToPLAlertSwitchOn];
	return flickrPhotoList;
}

- (void)addToTheMostRecentPlacesCollectionsTheFollowingDictionary:(NSDictionary *)dictionary;
{
	NSString *placeID;
	id undeterminedPlaceID = [dictionary objectForKey:PLPlaceID];
	if ([undeterminedPlaceID isKindOfClass:[NSString class]])
	{
		placeID = (NSString *)undeterminedPlaceID;
		[self RD_determineIfMostRecentPlacesSetIncludesPlaceIDString:placeID];
		[self RD_enqueueIntoTheMostRecentPlacesArrayTheFollowingDictionary:dictionary];
		[self RD_dequeueIfTheMostRecentPlacesArrayReachesMaximumSize];
		[self PL_updateMostRecentPlacesCollectionsInStandardUserDefaults];
	}
	//TODO: should I notify the user about a corrupt dictionary?
}


- (void)removeFromTheMostRecentPlacesCollectionsTheFollowingDictionary:(NSDictionary *)dictionaryToDelete;
{
//	[self.flickrMostRecentPlacesSet removeObject:[dictionaryToDelete valueForKey:PLPlaceID]];
	if ([self.flickrMostRecentPlacesSet member:[dictionaryToDelete valueForKey:PLPlaceID]])
	{
		int indexToRemove = [self PL_indexOfFlickrMostRecentPlacesArrayContainingPlaceIDString:
							 [dictionaryToDelete valueForKey:PLPlaceID]];
		if ([self RD_nonNegativeValueIsReturnedWithIndexToRemove:indexToRemove])
		{
			[self.flickrMostRecentPlacesSet removeObject:[dictionaryToDelete valueForKey:PLPlaceID]];
			[self.flickrMostRecentPlacesArray removeObjectAtIndex:indexToRemove];
			[self PL_updateMostRecentPlacesCollectionsInStandardUserDefaults];
		}
	}
}

#pragma mark - Convenience method

- (void)PL_mutateKeyValueObservedPropertyAlertViewSwitchToPLAlertSwitchOn;
{
	self.alertViewSwitch = PLAlertSwitchOn;
}

- (void)PL_updateMostRecentPlacesCollectionsInStandardUserDefaults;
{
	[[NSUserDefaults standardUserDefaults] setObject:self.flickrMostRecentPlacesArray forKey:PLKeyForMostRecentArray];
	[[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self.flickrMostRecentPlacesSet] forKey:PLKeyForMostRecentSet];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (int)PL_indexOfFlickrMostRecentPlacesArrayContainingPlaceIDString:(NSString *)placeID;
{
	int indexToRemove = PLIndexIsNegativeOne;
	for (int counter = 0; self.flickrMostRecentPlacesArray.count > counter ; counter++) 
	{
		if ([[self.flickrMostRecentPlacesArray objectAtIndex:counter] isKindOfClass:[NSDictionary class]])
		{
			NSDictionary *dictionary = [self.flickrMostRecentPlacesArray objectAtIndex:counter];
			if ([[dictionary objectForKey:PLPlaceID] isEqual:placeID])
			{
				indexToRemove = counter;
				[self RD_jumpOutOfForLoopWithCounter:counter];
			}
		}
	}
	return indexToRemove;
}

#pragma mark - Readability method

- (void)RD_jumpOutOfForLoopWithCounter:(int)counter;
{
	counter = self.flickrMostRecentPlacesArray.count;
}

- (void)RD_determineIfMostRecentPlacesSetIncludesPlaceIDString:(NSString *)placeID;
{
	if ([self.flickrMostRecentPlacesSet containsObject:placeID])
		[self RD_removeFromFlickrMostRecentPlacesArrayTheDictionaryWithTheFollowingPlaceIDString:placeID];
	else	
		[self.flickrMostRecentPlacesSet addObject:placeID];
}
- (void)RD_removeFromFlickrMostRecentPlacesArrayTheDictionaryWithTheFollowingPlaceIDString:(NSString *)placeID;
{
	int indexToRemove = [self PL_indexOfFlickrMostRecentPlacesArrayContainingPlaceIDString:placeID];
	if (indexToRemove != PLIndexIsNegativeOne)
		[self.flickrMostRecentPlacesArray removeObjectAtIndex:indexToRemove];
}
- (void)RD_enqueueIntoTheMostRecentPlacesArrayTheFollowingDictionary:(NSDictionary *)dictionary;
{
	[self.flickrMostRecentPlacesArray insertObject:dictionary atIndex:0];
}
- (void)RD_dequeueIfTheMostRecentPlacesArrayReachesMaximumSize;
{
	if ([self.flickrMostRecentPlacesArray count] > PLMaximumOfMostRecentPlacesList) 
		[self.flickrMostRecentPlacesArray removeLastObject];
}

- (BOOL)RD_nonNegativeValueIsReturnedWithIndexToRemove:(int)indexToRemove;
{
	return (indexToRemove > PLIndexIsNegativeOne);
}

#pragma mark - Property

- (NSMutableArray *)flickrMostRecentPlacesArray
{
	if (!PL_flickrMostRecentPlacesArray)
		PL_flickrMostRecentPlacesArray = [[NSMutableArray alloc] init];
	return PL_flickrMostRecentPlacesArray;
}

- (NSMutableSet *)flickrMostRecentPlacesSet
{
	if (!PL_flickrMostRecentPlacesSet)
		PL_flickrMostRecentPlacesSet = [[NSMutableSet alloc] init];
	return PL_flickrMostRecentPlacesSet;
}

#pragma mark - Dealloc
- (void)dealloc
{
	[PL_flickrMostRecentPlacesArray release];
	[PL_flickrMostRecentPlacesSet release];
	[PL_flickrTopPlaces release];
	[super dealloc];
}

@end