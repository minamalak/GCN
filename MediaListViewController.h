//
//  MediaListViewController.h
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNViewController.h"
#import "GCNServiceClient.h"
#import "MediaTableViewCell.h"

@interface MediaListViewController : GCNViewController <GCNServiceClientCaller, MyTableCellProtocoll>
{
//    NSMutableArray *arrayItems;
    NSMutableArray *arraySections;
}
@property (nonatomic,retain) NSString *titleStr;
@property (nonatomic,retain) NSMutableDictionary *sections;
@property (nonatomic,retain) NSMutableArray *arrayItems;
@end
