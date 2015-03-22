//
//  MediaMessageDetailsItemTableViewCell.h
//  GCN
//
//  Created by Mina Malak on 3/9/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNSubSection.h"

@interface MediaMessageDetailsItemTableViewCell : UITableViewCell
{
    IBOutlet UILabel *lblName;
}
-(void) setUpItem :(GCNSubSection *)item;
@end
