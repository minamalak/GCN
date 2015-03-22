//
//  NoteTableViewCell.h
//  GCN
//
//  Created by Mina Malak on 3/15/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNNote.h"

@interface NoteTableViewCell : UITableViewCell <UITextViewDelegate>
{
    NSIndexPath *indexPath;
    NSIndexPath *current;
}
@property (weak, nonatomic) IBOutlet UITextView *txtDetails;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UIButton *btnDelete;
-(void)setUpItemWithDictionary :(GCNNote *) item IndexPath:(NSIndexPath *) index :(NSIndexPath *) currentIndex :(BOOL) isEditingMode;
@property (nonatomic, retain) id delegate;

@end
