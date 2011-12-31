//
//  PictureListDataIndexer.h
//  Places_09
//
//  Created by Jinwoo Baek on 12/26/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataIndexer.h"
#import "RefinedElementForPictureList.h"
#import "JBBPriorityQueue.h"

@interface PictureListDataIndexer : DataIndexer
{
	@private
	NSInteger _highSection;
}
@property NSInteger highSection;
@end
