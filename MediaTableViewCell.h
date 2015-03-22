//
//  ClientServiceTableViewCell.h
//  MOEW
//
//  Created by Mina Malak on 6/9/14.
//  Copyright (c) 2014 LinkDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNSpokesperson.h"

@class MediaTableViewCell;

@protocol MyTableCellProtocoll <NSObject>

-(void) didPressWorkButton:(NSIndexPath *)indexPath;
-(void) didPressMobileButton:(NSIndexPath *)indexPath;
-(void) didPressEmailButton:(NSIndexPath *)indexPath;

@end

@interface MediaTableViewCell : UITableViewCell
{
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblTitle;
    IBOutlet UILabel *lblWorkNubmer;
    IBOutlet UILabel *lblMobileNumber;
    IBOutlet UILabel *lblEmail;
    
    NSIndexPath *myIndexPath;
}
@property (nonatomic,assign) id<MyTableCellProtocoll> delegationListener;
-(void)setUpWithItem:(GCNSpokesperson *)item atIndex:(NSIndexPath *)indexPath;

- (IBAction)buttonWorkAction;
- (IBAction)buttonMobileAction;
- (IBAction)buttonEmailAction;
@end
