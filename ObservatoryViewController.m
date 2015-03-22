//
//  ObservatoryViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "ObservatoryViewController.h"
#import "ObservatoryTableViewCell.h"
#import "WebViewController.h"

#import "GCNGetReports.h"
#import "GCNGetReportsResponse.h"

@interface ObservatoryViewController ()

@end

@implementation ObservatoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [viewWarning setHidden:NO];
//    [theTable setHidden:YES];
    
    [self getReposrts];
    
//    WebViewController *vc = (WebViewController *) [self initControllerWithStoryboardID:@"WebViewController"];

//    [self presentViewController:vc animated:YES completion:nil];
}

-(void) getReposrts
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNGetReports *obj = [[GCNGetReports alloc]init];
    obj.username = [SettingsController getToken];
    [service GetReportsAsyncIsPost:YES input:obj caller:self];
}

-(void)GetReportsCallback:(GCNGetReportsResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        arrayItems = response.GetReportsResult;
        if (arrayItems.count > 0) {
            [viewWarning setAlpha:0];
            [theTable setAlpha:1];
            [theTable reloadData];
        }
        else {
            [viewWarning setAlpha:1];
            [theTable setAlpha:0];
        }
    }
    else {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageConnectionError]];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ObservatoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ObservatoryTableViewCell" forIndexPath:indexPath];
    [cell setUpItem:arrayItems[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *vc = (WebViewController *) [self initControllerWithStoryboardID:@"WebViewController"];
    [vc setItem:arrayItems[indexPath.row]];
    [self presentViewController:vc animated:YES completion:nil];
//    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ObservatoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ObservatoryTableViewCell"];
    [cell setUpItem:arrayItems[indexPath.row]];
    
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
