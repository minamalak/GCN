//
//  CreateMessageTableViewCell.h
//  GCN
//
//  Created by Mina Malak on 3/12/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZTextView.h"

@interface CreateMessageTableViewCell : UITableViewCell <UITextViewDelegate>
{
    IBOutlet UIButton *btnAddNew;
    IBOutlet UIButton *btnRemoveLast;
    
    NSIndexPath *indexPath;
    NSIndexPath *current;
}
@property (weak, nonatomic) IBOutlet SZTextView *txtDetails;
@property (weak, nonatomic) IBOutlet UITextField *txtSubject;

-(void)setUpItemWithDictionary :(NSMutableDictionary *) dic IndexPath:(NSIndexPath *) index :(BOOL)isSelected :(NSIndexPath *) currentIndex;
@property (nonatomic, retain) id delegate;
@end
