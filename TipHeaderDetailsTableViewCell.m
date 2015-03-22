//
//  TipHeaderDetailsTableViewCell.m
//  GCN
//
//  Created by Mina Malak on 2/27/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "TipHeaderDetailsTableViewCell.h"

@implementation TipHeaderDetailsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUpWithItems:(NSString *)item
{
    [lblName setText:item];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
