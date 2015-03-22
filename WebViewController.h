//
//  WebViewController.h
//  GCN
//
//  Created by Mina Malak on 3/17/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCNViewController.h"
#import "GCNReport.h"

@interface WebViewController : GCNViewController <UIWebViewDelegate, NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    IBOutlet UIWebView *theWebView;
    
//    BOOL _authenticated;
//    NSURLConnection *_urlConnection;
//    NSURLRequest *request;
}
@property (nonatomic, retain) GCNReport *item;
@property (nonatomic,strong) NSMutableData* receivedData;
@end
