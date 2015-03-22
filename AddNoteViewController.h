//
//  AddNoteViewController.h
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNViewController.h"
#import "SZTextView.h"
#import "GCNServiceClient.h"

@interface AddNoteViewController : GCNViewController <GCNServiceClientCaller>
{
    IBOutlet SZTextView *txtNote;
}
@property (nonatomic, retain) id delegate;
@property (nonatomic,retain) NSString *messageID;
@end
