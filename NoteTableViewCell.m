//
//  NoteTableViewCell.m
//  GCN
//
//  Created by Mina Malak on 3/15/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "NoteTableViewCell.h"
#import "BriefcaseDetailsViewController.h"

@implementation NoteTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUpItemWithDictionary :(GCNNote *) item IndexPath:(NSIndexPath *) index :(NSIndexPath *) currentIndex :(BOOL) isEditingMode
{
    indexPath = index;
    current = currentIndex;
    
    
    if (current == indexPath) {
        [_txtDetails becomeFirstResponder];
    }
    [_txtDetails setText:item.Text];
    [_lblDate setText:item.Date];
    
    if (isEditingMode) {
        [_btnDelete setHidden:NO];
        [_txtDetails setEditable:YES];
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    CGRect frame = textView.frame;
    frame.size = textView.contentSize;
    textView.frame = frame;
    [self reload];
}

-(void) reload
{
    current = indexPath;
    [_delegate reloadTableView:_txtDetails.text :indexPath :current];
}

-(IBAction)deleteNoteAction
{
    [_delegate deleteNoteAction :indexPath ];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
