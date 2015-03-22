//
//  TipsViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "TipsViewController.h"
#import "TipTableViewCell.h"
#import "TipDetailsViewController.h"

@interface TipsViewController ()

@end

@implementation TipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"tips" ofType:@"plist"];
    arrayTips = [[NSMutableArray alloc] initWithContentsOfFile:file];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayTips.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TipTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipTableViewCell" forIndexPath:indexPath];
    [cell setUpWithItem:arrayTips[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TipDetailsViewController *vc = (TipDetailsViewController *) [self initControllerWithStoryboardID:@"TipDetailsViewController"];
    [vc setArrayItems:arrayTips[indexPath.row][@"Sections"]];
    [vc setTitleStr:arrayTips[indexPath.row][@"Title"]];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
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
