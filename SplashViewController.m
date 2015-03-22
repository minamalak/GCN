//
//  SplashViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "SplashViewController.h"
#import "LoginViewController.h"
#import "HomeViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(goToNextPage) userInfo:nil repeats:NO];
}

-(void) goToNextPage
{
    if ([SettingsController isLoggedIn]) {
        HomeViewController *vc = (HomeViewController *) [self initControllerWithStoryboardID:@"HomeViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        LoginViewController *vc = (LoginViewController *) [self initControllerWithStoryboardID:@"LoginViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
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
