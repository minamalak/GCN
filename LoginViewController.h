//
//  LoginViewController.h
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNViewController.h"
#import "GCNServiceClient.h"

@interface LoginViewController : GCNViewController <GCNServiceClientCaller, UITextFieldDelegate>
{
    IBOutlet UITextField *txtUserName;
    IBOutlet UITextField *txtPassword;
    
    IBOutlet UIScrollView *theScroll;
    IBOutlet NSLayoutConstraint *bottomConstraint;
}
@end
