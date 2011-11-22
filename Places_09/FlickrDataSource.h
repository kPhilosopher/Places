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
    NSMutableArray *flickrMostRecentPlacesArray;
}

@property (nonatomic,retain) NSArray *flickrTopPlacesArray;
@property (nonatomic,retain) NSMutableArray *flickrMostRecentPlacesArray;

-(NSArray *) retrievePhotoListForSpecific:(NSString *)flickrPlaceId;
-(void) setThePropertyToTheTopPlacesFromFlickr;
-(void) addToTheMostRecentListOfPlacesAsTheIndexOfTopPlacesUsing:(NSIndexPath *)indexPath;
-(BOOL) notifyRecentlyViewedPlaceWith:(int) index;
-(NSDictionary *) getTheDictionaryFromMostRecentListAt:(NSIndexPath *) indexPath;
@end
