//
//  ObservatoryTableViewCell.h
//  GCN
//
//  Created by Mina Malak on 2/28/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNReport.h"

@interface ObservatoryTableViewCell : UITableViewCell
{
    IBOutlet UILabel *lblTitle;
    IBOutlet UILabel *lblDetails;
}
-(void)setUpItem :(GCNReport *) item;
@end
