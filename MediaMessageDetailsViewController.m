//
//  MediaMessageDetailsViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "MediaMessageDetailsViewController.h"
#import "STCollapseTableView.h"
#import "MediaMessageDetailsItemTableViewCell.h"
#import "MediaMessageDetailsHeaderTableViewCell.h"

#import "GCNGetMediaMessageDetails.h"
#import "GCNGetMediaMessageDetailsResponse.h"
#import "GCNMediaMessage.h"
#import "GCNSection.h"

#import "GCNAddMessageToBriefcase.h"
#import "GCNAddMessageToBriefcaseResponse.h"
#import "GCNBriefcaseStatus.h"

@interface MediaMessageDetailsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet STCollapseTableView *tableView;

@end

@implementation MediaMessageDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getMediaMessageDetails];
}

-(void) getMediaMessageDetails
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNGetMediaMessageDetails *obj = [[GCNGetMediaMessageDetails alloc]init];
    obj.messageID = _messageID;
    [service GetMediaMessageDetailsAsyncIsPost:YES input:obj caller:self];
}

-(void)GetMediaMessageDetailsCallback:(GCNGetMediaMessageDetailsResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        _arrayItems = response.GetMediaMessageDetailsResult.Sections;
        [lblName setText:response.GetMediaMessageDetailsResult.Title];
        [lblDate setText:response.GetMediaMessageDetailsResult.Date];
        [self updateTableContent];
    }
    else {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageConnectionError]];
    }
}

-(void) updateTableContent
{
    arraySections = [[NSMutableArray alloc]init];
    _sections = [OrderedDictionary new];
    
    for (int i = 0; i < _arrayItems.count; i ++) {
        [arraySections addObject:[_arrayItems[i] Text]];
        [_sections setObject:[[NSMutableArray alloc] init] forKey:[_arrayItems[i]Text]];
    }
    
    
    for (int i = 0; i < _arrayItems.count; i ++) {
        NSString *type = [_arrayItems[i]Text];
        for (NSString *dic in arraySections) {
            if ([dic isEqualToString:type]) {
                NSMutableArray *array = [_arrayItems[i] SubSections];
                for (int j = 0; j < array.count; j ++) {
                    [[_sections objectForKey:type]addObject:array[j]];
                }
            }
        }
    }
    
    [_tableView reloadData];
    [_tableView setExclusiveSections:NO];
//    [_tableView setShouldHandleHeadersTap:NO];
    [_tableView setShouldRotate:NO];
    for (int i = 0; i <[[_sections allKeys] count]; i ++) {
        [_tableView openSection:i animated:YES];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_sections allKeys] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MediaMessageDetailsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaMessageDetailsItemTableViewCell" forIndexPath:indexPath];
    
    [cell setUpItem:[[_sections valueForKey:[[_sections allKeys] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_sections valueForKey:[[_sections allKeys]  objectAtIndex:section]] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    MediaMessageDetailsHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaMessageDetailsHeaderTableViewCell"];
    [cell setUpItem:[[_sections allKeys]  objectAtIndex:section]];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    [cell setNeedsLayout];
    
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MediaMessageDetailsHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaMessageDetailsHeaderTableViewCell"];
    
    [cell setUpItem:[[_sections allKeys]  objectAtIndex:section]];
    
    return cell.contentView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MediaMessageDetailsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaMessageDetailsItemTableViewCell"];
    [cell setUpItem:[[_sections valueForKey:[[_sections allKeys] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    [cell setNeedsLayout];
    
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(IBAction)addToBriefCaseAction
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNAddMessageToBriefcase *obj = [[GCNAddMessageToBriefcase alloc]init];
    obj.messageID = _messageID;
    obj.username = [SettingsController getToken];
    [service AddMessageToBriefcaseAsyncIsPost:YES input:obj caller:self];
}

-(void)AddMessageToBriefcaseCallback:(GCNAddMessageToBriefcaseResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        if (response.AddMessageToBriefcaseResult == BriefcaseStatusSuccessfully) {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageBriefCaseAddedSuccessfully]];
        }
        else if (response.AddMessageToBriefcaseResult == BriefcaseStatusServerError) {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageBriefCaseServererror]];
        }
        else if (response.AddMessageToBriefcaseResult == BriefcaseStatusAlreadyExist) {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageBriefcaseAlreadyExist]];
        }
    }
    else {
         [self showAlertViewWithText:[SettingsController getErrorText:MessageConnectionError]];
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
