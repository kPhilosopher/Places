//
//  ScrollableImageViewController.m
//  Places
//
//  Created by Jinwoo Baek on 11/4/11.
//  Copyright (c) 2011 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "ScrollableImageViewController.h"

@implementation ScrollableImageViewController
@synthesize image, imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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
	[scrollView release];
	[self.view addSubview:self.imageView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated
{
	if ([self.view isKindOfClass:[UIScrollView class]])
	{
		UIScrollView *scrollView = (UIScrollView *)self.view;
		[scrollView zoomToRect:[self getTheRectSizeThatWillUtilizeTheScreenSpace] animated:NO];
	}
}


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
	if (!image) {
		image = [[UIImage alloc] init];
	}
	return image;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)dealloc
{
	[image release];
	[imageView release];
	[super dealloc];
}
@end
