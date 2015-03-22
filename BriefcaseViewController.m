//
//  BriefcaseViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "BriefcaseViewController.h"
#import "CreateMediaMessageViewController.h"
#import "GCNGetBriefcaseMessages.h"
#import "GCNGetBriefcaseMessagesResponse.h"
#import "GCNMediaMessage.h"

#import "BriefCaseTableViewCell.h"
#import "BriefcaseDetailsViewController.h"

@interface BriefcaseViewController ()

@end

@implementation BriefcaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self retrieveMessages];
}

-(void) retrieveMessages
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNGetBriefcaseMessages *obj = [[GCNGetBriefcaseMessages alloc]init];
    obj.username = [SettingsController getToken];
    [service GetBriefcaseMessagesAsyncIsPost:YES input:obj caller:self];
}

-(void)GetBriefcaseMessagesCallback:(GCNGetBriefcaseMessagesResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        arrayMessages = response.GetBriefcaseMessagesResult;
        [theTable reloadData];
    }
    else {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageConnectionError]];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayMessages.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BriefCaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BriefCaseTableViewCell" forIndexPath:indexPath];
    [cell setUpItem:arrayMessages[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BriefcaseDetailsViewController *vc = (BriefcaseDetailsViewController *) [self initControllerWithStoryboardID:@"BriefcaseDetailsViewController"];
    [vc setMessageID:[arrayMessages[indexPath.row] ID]];
    [vc setDelegate:self];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BriefCaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BriefCaseTableViewCell"];
    [cell setUpItem:arrayMessages[indexPath.row]];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    [cell setNeedsLayout];
    
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1;
}

-(IBAction)createMediaMessageAction
{
    CreateMediaMessageViewController *vc = (CreateMediaMessageViewController *) [self initControllerWithStoryboardID:@"CreateMediaMessageViewController"];
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)reloadMessages
{
    [self retrieveMessages];
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
