//
//  TipDetailsTableViewCell.m
//  GCN
//
//  Created by Mina Malak on 2/25/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "TipDetailsTableViewCell.h"

@implementation TipDetailsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUpWithItem:(NSDictionary *)item
{
    [lblName setText:item[@"Title"]];
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
