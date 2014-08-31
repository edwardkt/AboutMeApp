//
//  EKTViewController.m
//  AboutMe
//  Name: Edward Tam
//  email: edwardkt@usc.edu
//  Created by ITP Student on 5/2/13.
//  Copyright (c) 2013 USC. All rights reserved.
//

#import "EKTViewController.h"

@interface EKTViewController ()
@property (weak, nonatomic) IBOutlet UITextView *AboutMeText;
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;

@end

@implementation EKTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //enable scrolling of textfield and scrollview
    _AboutMeText.scrollEnabled = YES;
    UIScrollView *scrollView = (UIScrollView *)self.ScrollView;
    [self.ScrollView setMaximumZoomScale:2.0];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1024);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//zooms in when you pinch
-(IBAction) zoomMeIn: (UIPinchGestureRecognizer *)recognizer
{
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform,recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

@end
