//
//  LoginViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "LoginViewController.h"
#import "SettingsController.h"
#import "HomeViewController.h"
#import "GCNLogin.h"
#import "GCNLoginResponse.h"
#import "GCNLoginStatus.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [UIView animateWithDuration:0.2 animations:^{
        [theScroll setNeedsLayout];
        [theScroll layoutIfNeeded];
        [self.view endEditing:YES];
        bottomConstraint.constant = 0;
    }];
}

-(void)textFieldDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.2 animations:^{
        bottomConstraint.constant = 246;
        [theScroll setNeedsLayout];
        [theScroll layoutIfNeeded];
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [UIView animateWithDuration:0.2 animations:^{
        [theScroll setNeedsLayout];
        [theScroll layoutIfNeeded];
        [textField resignFirstResponder];
        bottomConstraint.constant = 0;
    }];
    return NO;
}

-(IBAction)loginAction
{
    if ([self checkInputs]) {
        [self authenticateUser];
    }
}

-(void)authenticateUser
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNLogin *obj = [[GCNLogin alloc]init];
    obj.username = txtUserName.text;
    obj.password = txtPassword.text;
    [service LoginAsyncIsPost:YES input:obj caller:self];
}

-(void)LoginCallback:(GCNLoginResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        if (response.LoginResult == LoginStatusSuccessfully) {
            [SettingsController setToken:txtUserName.text];
            [SettingsController setPassword:txtPassword.text];
            HomeViewController *vc = (HomeViewController *) [self initControllerWithStoryboardID:@"HomeViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (response.LoginResult == LoginStatusWrongPassword) {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageWrongPassword]];
        }
        else if (response.LoginResult == LoginStatusDoesNotExist) {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageUserDoesNotExist]];
        }
    }
    else {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageConnectionError]];
    }
}

-(BOOL) checkInputs
{
    if ([txtUserName.text isEqualToString:@""]) {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageEmptyUserName]];
        return NO;
    }
    else if ([txtPassword.text isEqualToString:@""]) {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageEmptyPassword]];
        return NO;
    }
    return YES;
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
