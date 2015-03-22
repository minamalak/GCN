//
//  WebViewController.m
//  GCN
//
//  Created by Mina Malak on 3/17/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [self setTitle:_item.Title];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self startLoading:NO];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_item.PdfURL]];
    
    theWebView.scalesPageToFit = YES;
    theWebView.contentMode = UIViewContentModeScaleAspectFit;
    self.receivedData = [[NSMutableData alloc] init];
   NSURLConnection* theConnection =  [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    NSLog(@"got auth challange");
    
    if ([challenge previousFailureCount] == 0) {
        [[challenge sender]  useCredential:[NSURLCredential credentialWithUser:[SettingsController getToken] password:[SettingsController getPassword] persistence:NSURLCredentialPersistenceNone] forAuthenticationChallenge:challenge];
    } else {
        [[challenge sender] cancelAuthenticationChallenge:challenge];
    }
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

-(BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection
{
    return YES;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [theWebView loadData:self.receivedData MIMEType:@"application/pdf" textEncodingName:@"utf-8" baseURL:nil];
    [self finishLoading];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // append the new data to the receivedData
    // receivedData is declared as a method instance elsewhere
    NSLog(@"did receive data");
    [self.receivedData appendData:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
