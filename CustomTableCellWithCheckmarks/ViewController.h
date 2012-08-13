//
//  ViewController.h
//  CustomTableCellWithCheckmarks
//
//  Created by Michael Luton on 8/9/12.
//  Copyright (c) 2012 Michael Luton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSMutableArray *states;
    int selectedState;
}

@property (strong, nonatomic) IBOutlet UITableViewCell *stateCell;

@end
