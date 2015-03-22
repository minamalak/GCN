//
//  MediaMessageDetailsViewController.h
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNViewController.h"
#import "GCNServiceClient.h"
#import "OrderedDictionary.h"

@interface MediaMessageDetailsViewController : GCNViewController <GCNServiceClientCaller>
{
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblDate;
    
    NSMutableArray *arraySections;
}
@property (nonatomic,retain) NSString *messageID;
@property (nonatomic,retain) OrderedDictionary *sections;
@property (nonatomic,retain) NSMutableArray *arrayItems;
@end
