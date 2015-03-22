//
//  ContactUsViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)phoneAction
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel:0097143145555"]];
}

-(IBAction)governmentalWebSiteAction
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://gcn.gov.ae"]];
}

-(IBAction)ministryWebSiteAction
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://uaecabinet.ae/ar/Pages/default.aspx"]];
}

-(IBAction)emailAction
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"mailto://gco@moca.gov.ae"]];
}

-(IBAction)instagramAction
{
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@""]];
    
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://user?username=@UAEGOV"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    }
}

-(IBAction)youtubeAction
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.youtube.com/user/fedearalgov"]];
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
