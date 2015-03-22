//
//  MediaMessagesViewController.h
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNViewController.h"
#import "GCNServiceClient.h"

@interface MediaMessagesViewController : GCNViewController <UITableViewDataSource, UITableViewDelegate, GCNServiceClientCaller>
{
    IBOutlet UITableView *theTable;
    NSMutableArray *arrayMessages;
}
@end
