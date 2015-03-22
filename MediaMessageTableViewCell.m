//
//  MediaMessageTableViewCell.m
//  GCN
//
//  Created by Mina Malak on 3/8/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "MediaMessageTableViewCell.h"

@implementation MediaMessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void) setUpItem :(GCNMediaMessage *) item
{
    [lblName setText:item.Title];
    [lblDate setText:item.Date];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
