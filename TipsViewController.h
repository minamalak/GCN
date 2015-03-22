//
//  TipsViewController.h
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNViewController.h"

@interface TipsViewController : GCNViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *arrayTips;
    IBOutlet UITableView *theTable;
    
}
@end
