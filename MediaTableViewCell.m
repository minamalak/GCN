//
//  ClientServiceTableViewCell.m
//  MOEW
//
//  Created by Mina Malak on 6/9/14.
//  Copyright (c) 2014 LinkDev. All rights reserved.
//

#import "MediaTableViewCell.h"

@implementation MediaTableViewCell
@synthesize delegationListener;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

-(void)setUpWithItem:(GCNSpokesperson *)item atIndex:(NSIndexPath *)indexPath
{
    [lblName setText:item.Name];
    [lblTitle setText:item.JobTitle];
    
    NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
    
    if (item.Email) {
    lblEmail.attributedText = [[NSAttributedString alloc] initWithString:item.Email attributes:underlineAttribute];
    }
    else {
        [lblEmail setText:@"لا يوجد"];
    }
    
    if (item.WorkNumber) {
        lblWorkNubmer.attributedText = [[NSAttributedString alloc] initWithString:item.WorkNumber attributes:underlineAttribute];
    }
    else {
        [lblWorkNubmer setText:@"لا يوجد"];
    }
    
    if (item.MobileNumber) {
        lblMobileNumber.attributedText = [[NSAttributedString alloc] initWithString:item.MobileNumber attributes:underlineAttribute];
    }
    else {
        [lblMobileNumber setText:@"لا يوجد"];
    }
    
    myIndexPath = indexPath;
}

- (IBAction)buttonWorkAction
{
    [self.delegationListener didPressWorkButton:myIndexPath];
}

- (IBAction)buttonMobileAction
{
    [self.delegationListener didPressMobileButton:myIndexPath];
}

- (IBAction)buttonEmailAction
{
    [self.delegationListener didPressEmailButton:myIndexPath];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
