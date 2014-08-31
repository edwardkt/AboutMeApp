//
//  EKTLoverViewController.m
//  AboutMe
//  Name: Edward Tam
//  email: edwardkt@usc.edu
//  Created by ITP Student on 5/2/13.
//  Copyright (c) 2013 USC. All rights reserved.
//

#import "EKTLoverViewController.h"

@interface EKTLoverViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (weak, nonatomic) IBOutlet UITextView *LoverTextField;

@end

@implementation EKTLoverViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //makes scrollview scrollable
    _LoverTextField.scrollEnabled = YES;
    UIScrollView *scrollView = (UIScrollView *)self.ScrollView;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1024);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//zooms in when pinching screen.
-(IBAction) zoomMeIn: (UIPinchGestureRecognizer *)recognizer
{
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform,recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

@end
