//
//  MediaListHeaderTableViewCell.h
//  GCN
//
//  Created by Mina Malak on 3/1/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaListHeaderTableViewCell : UITableViewCell
{
    IBOutlet UILabel *lblName;
}
-(void)setUpItem :(NSString *) name;
@end
