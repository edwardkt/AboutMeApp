//
//  EKTData.m
//  AboutMe
//  Name: Edward Tam
//  email: edwardkt@usc.edu
//  Created by Student on 5/5/13.
//  Copyright (c) 2013 USC. All rights reserved.
//

#import "EKTData.h"

//declaring array to save names
NSString *const UserDefaultsKeyAnswerArray = @"NameArray";
@implementation EKTData

//loading names
/*- (NSMutableArray *) names
{
    if (!_names)
    {
        _names = [[NSMutableArray alloc]
                    initWithObjects:@"Edward", @"Jessica", nil];
    }
    return _names;
}*/

//creating a list of names for contacts
- (NSMutableArray *) names
{
    if (!_names)
    {
        NSArray *storedNames = [[NSUserDefaults standardUserDefaults] objectForKey:UserDefaultsKeyAnswerArray];
        if (storedNames)
        {
            _names = [storedNames mutableCopy];
        }
        else
        {
            _names = [[NSMutableArray alloc]
                    init];
        }
    }
    return _names;
}

//saves the data
- (void) save
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.names forKey:UserDefaultsKeyAnswerArray];
    [defaults synchronize];
}

//given name, returns index
- (NSUInteger) addName: (NSString *)nameText
{
    NSUInteger nameIndex = 0;
    [self.names insertObject:nameText
                       atIndex:nameIndex];
    [self save];
    return nameIndex;
}


//returns number of names
- (NSInteger) numberOfNames
{
    return [self.names count];
}

//given the index, returns the name
- (NSString *)nameAtIndex: (NSUInteger) nameIndex
{
    return self.names[nameIndex];
}

@end
