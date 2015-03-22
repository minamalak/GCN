//
//  ObservatoryTableViewCell.m
//  GCN
//
//  Created by Mina Malak on 2/28/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "ObservatoryTableViewCell.h"

@implementation ObservatoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUpItem :(GCNReport *) item
{
    [lblTitle setText:item.Title];
    [lblDetails setText:item.Description];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
