//
//  TipDetailsViewController.h
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNViewController.h"
#import "OrderedDictionary.h"

@interface TipDetailsViewController : GCNViewController
{
    NSMutableArray *arraySections;
    
    IBOutlet UILabel *lblTitle;
}
@property (nonatomic,retain) NSString *titleStr;
@property (nonatomic,retain) OrderedDictionary *sections;
@property (nonatomic,retain) NSMutableArray *arrayItems;

@end
