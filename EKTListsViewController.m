//
//  EKTListsViewController.m
//  AboutMe
//  Name: Edward Tam
//  email: edwardkt@usc.edu
//  Created by Student on 5/6/13.
//  Copyright (c) 2013 USC. All rights reserved.
//

#import "EKTListsViewController.h"
#import "EKTData.h"
#import "EKTInputsViewController.h"

@interface EKTListsViewController ()

@property (strong, nonatomic) EKTData *model;

@end

@implementation EKTListsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //instantiating model object
    self.model = [[EKTData alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.model numberOfNames];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell
    cell.textLabel.text = [self.model nameAtIndex:indexPath.row];return cell;
}

//gives control to InputsViewController when segue occurs.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EKTInputsViewController *inputVC = segue.destinationViewController;
    // completion block
    inputVC.completionHandler = ^(NSString *text) {
        if (text != nil) {
            NSUInteger nameIndex = [self.model addName:text];
            NSIndexPath *indexPath = [NSIndexPath
                                      indexPathForRow:nameIndex inSection:0];
            [self.tableView insertRowsAtIndexPaths:@[indexPath]
                                  withRowAnimation:UITableViewRowAnimationFade];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    };
}

@end
