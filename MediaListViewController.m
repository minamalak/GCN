//
//  MediaListViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "MediaListViewController.h"
#import "STCollapseTableView.h"
#import "GCNGetSpokespersons.h"
#import "GCNGetSpokespersonsResponse.h"
#import "GCNSpokesperson.h"
#import "MediaListHeaderTableViewCell.h"
#import "GCNSpokesperson.h"


@interface MediaListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet STCollapseTableView *tableView;

@end

@implementation MediaListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getMediaList];
}

-(void) getMediaList
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNGetSpokespersons *obj = [[GCNGetSpokespersons alloc]init];
    [service GetSpokespersonsAsyncIsPost:YES input:obj caller:self];
}

-(void)GetSpokespersonsCallback:(GCNGetSpokespersonsResponse *)response error:(NSError *)error
{
    [self finishLoading];
    
    if (response) {
        _arrayItems = response.GetSpokespersonsResult;
        if (_arrayItems.count > 0) {
            [self updateTableContent];
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

-(void) updateTableContent
{
    arraySections = [[NSMutableArray alloc]init];
    _sections = [NSMutableDictionary new];
    
    for (int i = 0; i < _arrayItems.count; i ++) {
        [arraySections addObject:[_arrayItems[i] Category]];
        [_sections setObject:[[NSMutableArray alloc] init] forKey:[_arrayItems[i]Category]];
    }
    
    
    for (int i = 0; i < _arrayItems.count; i ++) {
        NSString *type = [_arrayItems[i]Category];
        for (NSString *dic in arraySections) {
            if ([dic isEqualToString:type]) {
                [[_sections objectForKey:type]addObject:_arrayItems[i]];
            }
        }
    }
    [_tableView reloadData];
    //    [_tableView openSection:0 animated:YES];
    [_tableView setExclusiveSections:NO];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_sections allKeys] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MediaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaTableViewCell" forIndexPath:indexPath];
    
    [cell setUpWithItem:[[_sections valueForKey:[[_sections allKeys]  objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] atIndex:indexPath];
    cell.delegationListener = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    MediaListHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaListHeaderTableViewCell"];
    [cell setUpItem:[[_sections allKeys]  objectAtIndex:section]];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    [cell setNeedsLayout];
    
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    return size.height+1;
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MediaListHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaListHeaderTableViewCell"];
    [cell setUpItem:arraySections[section]];
    return cell.contentView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 162;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void) didPressWorkButton:(NSIndexPath *)indexPath
{
    NSString *workNumber = [[[_sections valueForKey:[[_sections allKeys]  objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] WorkNumber];
    if (workNumber) {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", workNumber]]];
    }
}

-(void) didPressMobileButton:(NSIndexPath *)indexPath
{
    NSString *mobileNumber = [[[_sections valueForKey:[[_sections allKeys]  objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] MobileNumber];
    if (mobileNumber) {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", mobileNumber]]];
    }
}

-(void) didPressEmailButton:(NSIndexPath *)indexPath
{
    NSString *email = [[[_sections valueForKey:[[_sections allKeys]  objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] Email];
    if (email) {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto://%@", email]]];
    }
}

-(void)menuButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    [_tableView setDelegate:nil];
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
