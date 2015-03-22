//
//  HomeViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "HomeViewController.h"
#import "MediaMessagesViewController.h"
#import "BriefcaseViewController.h"
#import "ContactUsViewController.h"
#import "ObservatoryViewController.h"
#import "TipsViewController.h"
#import "MediaListViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)mediaMessageAction
{
    MediaMessagesViewController *vc = (MediaMessagesViewController *) [self initControllerWithStoryboardID:@"MediaMessagesViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)mediaListAction
{
    MediaListViewController *vc = (MediaListViewController *) [self initControllerWithStoryboardID:@"MediaListViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)logoutAction
{
    LoginViewController *vc = (LoginViewController *) [self initControllerWithStoryboardID:@"LoginViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)contactUsAction
{
    ContactUsViewController *vc = (ContactUsViewController *) [self initControllerWithStoryboardID:@"ContactUsViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)observatoryAction
{
    ObservatoryViewController *vc = (ObservatoryViewController *) [self initControllerWithStoryboardID:@"ObservatoryViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)briefcaseAction
{
    BriefcaseViewController *vc = (BriefcaseViewController *) [self initControllerWithStoryboardID:@"BriefcaseViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)tipsAction
{
    TipsViewController *vc = (TipsViewController *) [self initControllerWithStoryboardID:@"TipsViewController"];
    [self.navigationController pushViewController:vc animated:YES];
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
