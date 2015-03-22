//
//  BriefcaseDetailsViewController.h
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNViewController.h"
#import "GCNServiceClient.h"
#import "GCNNote.h"

@interface BriefcaseDetailsViewController : GCNViewController <GCNServiceClientCaller, UIAlertViewDelegate>
{
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblDate;
    IBOutlet NSLayoutConstraint *heightConstraint;
    IBOutlet NSLayoutConstraint *heightConstraintComments;
    
    NSMutableArray *arraySections;
    
    CGFloat counter;
    CGFloat notetableHeight;
    
    IBOutlet UITableView *theTable;
    NSMutableArray *arrayNotes;
    NSMutableArray *arrayOldData;
    NSIndexPath *current;
    IBOutlet UIView *viewDeleteMessage;
    BOOL isEditing;
    UIButton *rightButton;
    UIBarButtonItem *oldLeftItem;
    UIBarButtonItem *oldRightItem;
    NSString *noteID;
}
@property (nonatomic,retain) id delegate;
@property (nonatomic,retain) NSString *messageID;
@property (nonatomic,retain) NSMutableDictionary *sections;
@property (nonatomic,retain) NSMutableArray *arrayItems;

-(void) getNotes;
-(void) reloadTableView :(NSString *) item :(NSIndexPath *) index :(NSIndexPath *) currentIndex;
-(void) deleteNoteAction :(NSIndexPath *) index;

@end
