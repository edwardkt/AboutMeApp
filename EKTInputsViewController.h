//
//  EKTInputsViewController.h
//  AboutMe
//  Name: Edward Tam
//  email: edwardkt@usc.edu
//  Created by Student on 5/5/13.
//  Copyright (c) 2013 USC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EKTListsViewController.h"

//completion handler defined
typedef void(^EKTInputsCompletionHandler)(NSString *inputText);

@interface EKTInputsViewController : UIViewController

@property (copy, nonatomic) EKTInputsCompletionHandler completionHandler;

@end
