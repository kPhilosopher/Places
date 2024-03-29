//
//  ScrollableImageViewController.m
//  Places
//
//  Created by Jinwoo Baek on 11/4/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "ScrollableImageViewController.h"

@interface ScrollableImageViewController()

@property (nonatomic, retain) UIImage *image;
@end

@implementation ScrollableImageViewController
@synthesize image = _image;
@synthesize imageView = _imageView;
@synthesize imageDictionary = _imageDictionary;

NSString *ScrollableImageViewAccessibilityLabel = @"Scrollable image";
NSString *ScrollableImageBackBarButtonAccessibilityLabel = @"Back";
//TODO: restructure to imageView being a subview not the main view.
//TODO: download the image in here with multi-threading.
- (id)init
{
	self = [super init];
	if (self)
	{
//		self.view.accessibilityLabel = ScrollableImageViewAccessibilityLabel;
//		self.navigationItem.backBarButtonItem.accessibilityLabel = ScrollableImageBackBarButtonAccessibilityLabel;
//		self.navigationItem.backBarButtonItem.title = @"whatwhat";
	}
	return self;
}

#pragma mark - Split View Delegate Methods

- (void)splitViewController:(UISplitViewController*)svc popoverController:(UIPopoverController*)pc willPresentViewController:(UIViewController *)aViewController
{
}

- (void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc
{
	barButtonItem.title = aViewController.title;
	self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)button
{
	self.navigationItem.rightBarButtonItem = nil;
}


#pragma mark - View lifecycle


-(CGRect) getTheRectSizeThatWillUtilizeTheScreenSpace
{
	CGRect theRectToReturn = CGRectMake(0, 0, 0, 0);
	CGRect screenRect = self.view.bounds;
	CGFloat imageRatio = self.imageView.bounds.size.height / self.imageView.bounds.size.width;
	CGFloat screenRatio = screenRect.size.height / screenRect.size.width;
	if (imageRatio > screenRatio)
	{
		theRectToReturn.size.height = screenRatio * self.imageView.bounds.size.width;
		theRectToReturn.size.width = self.imageView.bounds.size.width;
	}
	else
	{
		theRectToReturn.size.width = self.imageView.bounds.size.height / screenRatio;
		theRectToReturn.size.height = self.imageView.bounds.size.height;
	}
	return theRectToReturn;
}

-(void) initiateTheImageSetupWithGiven:(UIImage *)givenImage
{
	self.image = givenImage;
	[self loadView];
	if ([self.view isKindOfClass:[UIScrollView class]])
	{
		UIScrollView *scrollView = (UIScrollView *)self.view;
		[scrollView zoomToRect:[self getTheRectSizeThatWillUtilizeTheScreenSpace] animated:YES];
	}
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	self.imageView = [[UIImageView alloc] initWithImage:self.image];
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	scrollView.delegate = self;
	scrollView.minimumZoomScale = 0.2;
	scrollView.maximumZoomScale = 4;
	scrollView.contentSize = self.imageView.bounds.size;
	self.view = scrollView;
	self.view.accessibilityLabel = ScrollableImageViewAccessibilityLabel;
	[scrollView release];
	[self.view addSubview:self.imageView];
//	[super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//-(void) viewWillAppear:(BOOL)animated
//{
	//multi-thread it
//	
//	[self initiateTheImageSetupWithGiven:self.image];
//	[super viewWillAppear:animated];
//	if ([self.view isKindOfClass:[UIScrollView class]])
//	{
//		UIScrollView *scrollView = (UIScrollView *)self.view;
//		[scrollView zoomToRect:[self getTheRectSizeThatWillUtilizeTheScreenSpace] animated:YES];
//	}
//}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return self.imageView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	
}

-(UIImage *) image
{
	if (!_image) {
		_image = [[UIImage alloc] init];
	}
	return _image;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	
	[self loadView];
	if ([self.view isKindOfClass:[UIScrollView class]])
	{
		UIScrollView *scrollView = (UIScrollView *)self.view;
		[scrollView zoomToRect:[self getTheRectSizeThatWillUtilizeTheScreenSpace] animated:YES];
	}
    return ((interfaceOrientation == UIInterfaceOrientationPortrait) || 
			(interfaceOrientation == UIInterfaceOrientationLandscapeRight) || 
			(interfaceOrientation == UIInterfaceOrientationLandscapeLeft));
}

-(void)dealloc
{
	[_image release];
	[_imageView release];
	[super dealloc];
}
@end
