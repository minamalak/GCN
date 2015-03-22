//
//  TipHeaderDetailsTableViewCell.h
//  GCN
//
//  Created by Mina Malak on 2/27/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipHeaderDetailsTableViewCell : UITableViewCell
{
    IBOutlet UILabel *lblName;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageArrow;
-(void) setUpWithItems:(NSString *) item;
@end
