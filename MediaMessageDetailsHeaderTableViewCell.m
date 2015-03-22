//
//  MediaMessageDetailsHeaderTableViewCell.m
//  GCN
//
//  Created by Mina Malak on 3/9/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "MediaMessageDetailsHeaderTableViewCell.h"

@implementation MediaMessageDetailsHeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void) setUpItem :(NSString *) item
{
    [lblName setText:item];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
