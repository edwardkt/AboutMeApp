//
//  EKTData.h
//  AboutMe
//  Name: Edward Tam
//  email: edwardkt@usc.edu
//  Created by Student on 5/5/13.
//  Copyright (c) 2013 USC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKTData : NSObject

@property (strong,nonatomic) NSMutableArray *names;

// returns the number of names entered
- (NSInteger) numberOfNames;

// Give index, returns name
- (NSString *)nameAtIndex: (NSUInteger) nameIndex;

//adds name
- (NSUInteger) addName: (NSString *)nameText;
@end
