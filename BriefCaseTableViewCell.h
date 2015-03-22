//
//  BriefCaseTableViewCell.h
//  GCN
//
//  Created by Mina Malak on 3/9/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNMediaMessage.h"

@interface BriefCaseTableViewCell : UITableViewCell
{
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblDate;
}
-(void) setUpItem :(GCNMediaMessage *) item;
@end
