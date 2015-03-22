//
//  MediaMessagesViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "MediaMessagesViewController.h"
#import "MediaMessageTableViewCell.h"
#import "MediaMessageDetailsViewController.h"
#import "GCNGetMediaMessages.h"
#import "GCNGetMediaMessagesResponse.h"
#import "GCNMediaMessage.h"

@interface MediaMessagesViewController ()

@end

@implementation MediaMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self retrieveMediaMessages];
}

-(void) retrieveMediaMessages
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNGetMediaMessages *obj = [[GCNGetMediaMessages alloc]init];
    [service GetMediaMessagesAsyncIsPost:YES input:obj caller:self];
}

-(void)GetMediaMessagesCallback:(GCNGetMediaMessagesResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        arrayMessages = response.GetMediaMessagesResult;
        if (arrayMessages.count > 0) {
            [theTable reloadData];
        }
        else {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageNoItems]];
            [self.navigationController popViewControllerAnimated:YES];
        }
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
    MediaMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaMessageTableViewCell" forIndexPath:indexPath];
    [cell setUpItem:arrayMessages[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MediaMessageDetailsViewController *vc = (MediaMessageDetailsViewController *) [self initControllerWithStoryboardID:@"MediaMessageDetailsViewController"];
    [vc setMessageID:[arrayMessages[indexPath.row] ID]];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MediaMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaMessageTableViewCell"];
    [cell setUpItem:arrayMessages[indexPath.row]];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    [cell setNeedsLayout];
    
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1;
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
