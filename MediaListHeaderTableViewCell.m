//
//  MediaListHeaderTableViewCell.m
//  GCN
//
//  Created by Mina Malak on 3/1/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "MediaListHeaderTableViewCell.h"

@implementation MediaListHeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUpItem :(NSString *) name
{
    [lblName setText:name];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
