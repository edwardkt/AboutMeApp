//
//  EKTInputsViewController.m
//  AboutMe
//  Name: Edward Tam
//  email: edwardkt@usc.edu
//  Created by Student on 5/5/13.
//  Copyright (c) 2013 USC. All rights reserved.
//

#import "EKTInputsViewController.h"
#import "EKTListsViewController.h"

@interface EKTInputsViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@end

@implementation EKTInputsViewController

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
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//checks if user typed in information
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *changedString = [textField.text
                               stringByReplacingCharactersInRange:range withString:string];
    [self validateSaveButtonForText:changedString];
    // Do not actually replace the text field's text!! // Return YES and let UIKit do it!
    return YES;
}

//enables save button when user types information
-(void)validateSaveButtonForText:(NSString *)text
{
    self.saveButton.enabled = ([_nameField.text length] > 0);
}

//when cancel button is pressed
- (IBAction)cancelButtonPressed:(id)sender
{
    if (self.completionHandler)
        self.completionHandler(nil);
}

//when save button is pressed
- (IBAction)saveButtonPressed:(id)sender
{
   if (self.completionHandler)
   {
       if([self.nameField.text length] > 0)
           self.completionHandler(self.nameField.text);
       else if([self.nameField.text length] == 0)
       { //print error if there is no input
           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR!" message:@"Please enter a name!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
           [alert show];
       }
       
   }
}

//when return is pressed, save input
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (self.completionHandler)
    {
        self.completionHandler(self.nameField.text);
    }
    return YES;
}

@end
