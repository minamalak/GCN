//
//  CreateMessageTableViewCell.m
//  GCN
//
//  Created by Mina Malak on 3/12/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "CreateMessageTableViewCell.h"
#import "CreateMediaMessageViewController.h"

@implementation CreateMessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUpItemWithDictionary :(NSMutableDictionary *) dic IndexPath:(NSIndexPath *) index :(BOOL)isSelected :(NSIndexPath *) currentIndex
{
    indexPath = index;
    current = currentIndex;
    [_txtDetails setPlaceholder:@"التفاصيل"];
    
    [_txtSubject setText:dic[@"subject"]];
    [_txtDetails setText:dic[@"details"]];
    if (current == indexPath) {
        [_txtDetails becomeFirstResponder];
    }
    
    if (isSelected) {
        [btnAddNew setHidden:NO];
        [btnRemoveLast setHidden:YES];
    }
    else {
        [btnAddNew setHidden:YES];
        [btnRemoveLast setHidden:NO];
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    CGRect frame = textView.frame;
    frame.size = textView.contentSize;
    textView.frame = frame;
//    [_delegate updateBottomConstraint];
    [self reload];
    
}

-(void) reload
{
    current = indexPath;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:_txtSubject.text forKey:@"subject"];
    [dic setValue:_txtDetails.text forKey:@"details"];
    
    [_delegate reloadTableView:dic :indexPath :current];
}

-(IBAction)addNewAction
{
    if ([_txtSubject.text isEqualToString:@""] || [_txtDetails.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"من فضلك اكمل البيانات" delegate:nil cancelButtonTitle:@"نعم" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        [btnAddNew setHidden:YES];
        [btnRemoveLast setHidden:NO];
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        [dic setValue:_txtSubject.text forKey:@"subject"];
        [dic setValue:_txtDetails.text forKey:@"details"];
        
        [_delegate addAction:dic :indexPath];
    }
}

-(IBAction)removeLastAction
{
    [_delegate removeAction :indexPath];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
