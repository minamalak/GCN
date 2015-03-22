//
//  TipDetailsViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "TipDetailsViewController.h"
#import "STCollapseTableView.h"
#import "TipDetailsTableViewCell.h"
#import "TipHeaderDetailsTableViewCell.h"

@interface TipDetailsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet STCollapseTableView *tableView;

@end

@implementation TipDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [lblTitle setText:_titleStr];
    [self updateTableContent];
}

-(void) updateTableContent
{
    arraySections = [[NSMutableArray alloc]init];
    _sections = [[OrderedDictionary alloc]init];
    
    for (int i = 0; i < _arrayItems.count; i ++) {
        [arraySections addObject:_arrayItems[i][@"Title"]];
        [_sections setObject:[[NSMutableArray alloc] init] forKey:_arrayItems[i][@"Title"]];
    }
    
    
    for (int i = 0; i < _arrayItems.count; i ++) {
        NSString *type = _arrayItems[i][@"Title"];
        for (NSString *dic in arraySections) {
            if ([dic isEqualToString:type]) {
                NSMutableArray *array = _arrayItems[i][@"Details"];
                for (int j = 0; j < array.count; j ++) {
                    [[_sections objectForKey:type]addObject:array[j]];
                }
            }
        }
    }
    [_tableView reloadData];
//    [_tableView openSection:0 animated:YES];
//    [_tableView setShouldRotate:NO];
    [_tableView setExclusiveSections:NO];
}

// Ahmed mohamdy
// porting and anlysing engineer

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_sections allKeys] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TipDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipDetailsTableViewCell" forIndexPath:indexPath];
    
    [cell setUpWithItems:[[_sections valueForKey:[[_sections allKeys]  objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_sections valueForKey:[[_sections allKeys]  objectAtIndex:section]] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    TipHeaderDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipDetailsTableViewCell"];
    [cell setUpWithItems:[[_sections allKeys]  objectAtIndex:section]];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    [cell setNeedsLayout];
    
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{   
    TipHeaderDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipHeaderDetailsTableViewCell"];
    
    [cell setUpWithItems:[[_sections allKeys]  objectAtIndex:section]];
    
    [cell.imageArrow setImage:[UIImage imageNamed:@"Arrow_Up"]];
    
    if ([[_tableView.sectionsStates objectAtIndex:section] boolValue])
    {
        [cell.imageArrow setTransform:CGAffineTransformRotate(cell.imageArrow.transform, M_PI)];
    }
    
    return cell.contentView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TipDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipDetailsTableViewCell"];
    [cell setUpWithItems:[[_sections valueForKey:[[_sections allKeys]  objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    [cell setNeedsLayout];
    
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height+1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
