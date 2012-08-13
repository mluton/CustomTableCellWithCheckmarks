//
//  ViewController.m
//  CustomTableCellWithCheckmarks
//
//  Created by Michael Luton on 8/9/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize stateCell;

- (void)viewDidLoad
{
    [super viewDidLoad];

	states = [[NSMutableArray alloc] initWithObjects:@"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming", nil];
    selectedState = -1;
}

- (void)viewDidUnload
{
    [self setStateCell:nil];
    [super viewDidUnload];
}

#pragma mark - Table View


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [states count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"StateTableCell" owner:self options:NULL];
        cell = stateCell;
    }
    
    UILabel *stateName = (UILabel*)[cell viewWithTag:1];
    stateName.text = [states objectAtIndex:indexPath.row];

    if (selectedState == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int previousSelection = selectedState;
    selectedState = indexPath.row;
    
    NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:previousSelection inSection:0];
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:selectedState inSection:0];

    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    [indexPaths addObject:oldIndexPath];

    if (oldIndexPath.row != newIndexPath.row) {
        [indexPaths addObject:newIndexPath];
    }
    
    [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}

@end
