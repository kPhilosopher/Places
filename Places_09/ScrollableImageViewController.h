//
//  ScrollableImageViewController.h
//  Places
//
//  Created by Jinwoo Baek on 11/4/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollableImageViewController : UIViewController <UIScrollViewDelegate, UISplitViewControllerDelegate>
{
	@private
	UIImage *_image;
	UIImageView *_viewWithImage;
	NSDictionary *_imageDictionary;
}

extern NSString *ScrollableImageViewAccessibilityLabel;
extern NSString *ScrollableImageBackBarButtonAccessibilityLabel;

@property (retain) UIImageView *imageView;
@property (retain) NSDictionary *imageDictionary;

-(void) initiateTheImageSetupWithGiven:(UIImage *)givenImage;

@end
