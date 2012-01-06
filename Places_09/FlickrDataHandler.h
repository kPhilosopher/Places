//
//  FlickrDataHandler.h
//  Places_09
//
//  Created by Jinwoo Baek on 1/2/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlickrFetcher.h"

@interface FlickrDataHandler : NSObject

- (NSArray *)getTopPlacesFromFlickr;
- (NSArray *)getPhotoListsAtPlace:(NSString *)flickrPlaceId;
@end