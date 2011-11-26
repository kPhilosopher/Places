//
//  ScrollableImageViewController.h
//  Places
//
//  Created by Jinwoo Baek on 11/4/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollableImageViewController : UIViewController <UIScrollViewDelegate>
{
	@private
	UIImage *image;
	UIImageView *viewWithImage;
}
@property (nonatomic, retain) UIImage *image;
@property (retain) UIImageView *imageView;
@end
