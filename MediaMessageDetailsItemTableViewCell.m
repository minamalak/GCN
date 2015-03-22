//
//  MediaMessageDetailsItemTableViewCell.m
//  GCN
//
//  Created by Mina Malak on 3/9/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "MediaMessageDetailsItemTableViewCell.h"

@implementation MediaMessageDetailsItemTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void) setUpItem :(GCNSubSection *)item
{
    [lblName setText:item.Text];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
