//
//  TipTableViewCell.h
//  GCN
//
//  Created by Mina Malak on 2/25/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipTableViewCell : UITableViewCell
{
    IBOutlet UILabel *lblName;
}
-(void) setUpWithItem :(NSDictionary *) item;
@end
