//
//  CreateMessageWithTableViewController.h
//  GCN
//
//  Created by Mina Malak on 3/12/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNViewController.h"
#import "GCNServiceClient.h"

@interface CreateMediaMessageViewController : GCNViewController <UITableViewDataSource, UITableViewDelegate, GCNServiceClientCaller>
{
    IBOutlet UITextField *txtMainTitle;
    IBOutlet UITableView *theTable;
    NSMutableArray *arrayItems;
    
    NSIndexPath *current;
    
    IBOutlet NSLayoutConstraint *bottomConstraint;
    CGFloat keyboardHeight;
}
@property (nonatomic, retain) id delegate;

-(void)addAction :(NSMutableDictionary *) oldDic :(NSIndexPath *) index;
-(void) removeAction :(NSIndexPath *) index;
-(void) reloadTableView :(NSMutableDictionary *) dic :(NSIndexPath *) index :(NSIndexPath *) currentIndex;
-(void) updateBottomConstraint;
@end
