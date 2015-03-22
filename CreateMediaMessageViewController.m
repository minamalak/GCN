//
//  CreateMessageWithTableViewController.m
//  GCN
//
//  Created by Mina Malak on 3/12/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "CreateMediaMessageViewController.h"
#import "CreateMessageTableViewCell.h"
#import "BriefcaseViewController.h"

#import "GCNCreatePrivateMediaMessage.h"
#import "GCNCreatePrivateMediaMessageResponse.h"
#import "GCNPrivateMediaMessage.h"
#import "GCNMediaMessage.h"
#import "GCNSection.h"
#import "GCNSubSection.h"

@interface CreateMediaMessageViewController ()

@end

@implementation CreateMediaMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    arrayItems = [[NSMutableArray alloc]init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"" forKey:@"subject"];
    [dic setValue:@"" forKey:@"details"];
    
    [arrayItems addObject:dic];

    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [UIView animateWithDuration:0.2 animations:^{
        [self.view endEditing:YES];
        bottomConstraint.constant = 0;
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CreateMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreateMessageTableViewCell" forIndexPath:indexPath];
    if (indexPath.row == arrayItems.count - 1 || arrayItems.count == 1) {
        [cell setUpItemWithDictionary:arrayItems[indexPath.row] IndexPath:indexPath :YES :current];
    }
    else {
        [cell setUpItemWithDictionary:arrayItems[indexPath.row] IndexPath:indexPath :NO :current];
    }
    
    [cell setDelegate:self];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CreateMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreateMessageTableViewCell"];
    if (indexPath.row == arrayItems.count - 1 || arrayItems.count == 1) {
        [cell setUpItemWithDictionary:arrayItems[indexPath.row] IndexPath:indexPath :YES :current];
    }
    else {
        [cell setUpItemWithDictionary:arrayItems[indexPath.row] IndexPath:indexPath :NO :current];
    }
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    [cell setNeedsLayout];

    CGSize sizeOfCell = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    NSString *text = arrayItems[indexPath.row][@"details"];
    
    CGSize sizeOfTextView = [self frameForText:text sizeWithFont:nil constrainedToSize:CGSizeMake(300.f, CGFLOAT_MAX)];
    
    return sizeOfTextView.height + sizeOfCell.height;
}

- (CGSize)frameForText:(NSString *)text sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          font, NSFontAttributeName,
                                          nil];
    CGRect frame = [text boundingRectWithSize:size
                                      options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                   attributes:attributesDictionary
                                      context:nil];
    
    // This contains both height and width, but we really care about height.
    return frame.size;
}

-(void)reloadTableView :(NSMutableDictionary *) dic :(NSIndexPath *) index  :(NSIndexPath *) currentIndex
{
    current = currentIndex;
    [arrayItems replaceObjectAtIndex:index.row withObject:dic];
    [theTable reloadRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationNone];
}

-(void)addAction :(NSMutableDictionary *) oldDic :(NSIndexPath *) index
{
    [arrayItems replaceObjectAtIndex:index.row withObject:oldDic];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:@"" forKey:@"subject"];
    [dic setValue:@"" forKey:@"details"];
    [arrayItems addObject:dic];
    
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:[arrayItems count] - 1 inSection:0];
    [theTable insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    [self.view endEditing:YES];
}

-(void)removeAction :(NSIndexPath *) index
{
    [arrayItems removeObjectAtIndex:index.row];
    [theTable reloadData];
//    [theTable beginUpdates];
//    [theTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationFade];
//    [theTable endUpdates];
}

-(BOOL) checkInputs
{
    if ([txtMainTitle.text isEqualToString:@""]) {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageEmptyFields]];
        return NO;
    }
    for (int i = 0; i < arrayItems.count; i ++) {
        if ([arrayItems[i][@"details"] isEqualToString:@""] || [arrayItems[i][@"subject"] isEqualToString:@""]) {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageEmptyFields]];
            return NO;
        }
    }
    return YES;
}

-(IBAction)saveAction
{
    if ([self checkInputs]) {
        [self startLoading:NO];
        GCNServiceClient *service = [[GCNServiceClient alloc]init];
        GCNCreatePrivateMediaMessage *obj = [[GCNCreatePrivateMediaMessage alloc]init];
        GCNPrivateMediaMessage *message = [[GCNPrivateMediaMessage alloc]init];
        message.Owner = [SettingsController getToken];
        message.Title = txtMainTitle.text;
        message.Date = [self getDateString];
        
        NSMutableArray *arraySections = [[NSMutableArray alloc]init];
        for (int i = 0; i < arrayItems.count; i ++) {
            GCNSection *section = [[GCNSection alloc]init];
            section.Text = arrayItems[i][@"subject"];
            
            NSMutableArray *arraySubSections = [[NSMutableArray alloc]init];
            GCNSubSection *subSection = [[GCNSubSection alloc]init];
            subSection.Text = arrayItems[i][@"details"];
            [arraySubSections addObject:subSection];
            section.SubSections = arraySubSections;
            
            [arraySections addObject:section];
        }
        message.Sections = arraySections;
        obj.privateMessage = message;
        [service CreatePrivateMediaMessageAsyncIsPost:YES input:obj caller:self];
    }
}

-(void)CreatePrivateMediaMessageCallback:(GCNCreatePrivateMediaMessageResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        if ([response.CreatePrivateMediaMessageResult boolValue]) {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageSuccessfulAdded]];
            [self menuButtonPressed:nil];
            [_delegate reloadMessages];
        }
        else {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageError]];
        }
    }
    else {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageConnectionError]];
    }
}

-(NSString *) getDateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MMM-dd"];
    
    NSString *todayStr = [dateFormatter stringFromDate:[NSDate date]];
    
    return todayStr;
}

//-(void) updateBottomConstraint
//{
//    [UIView animateWithDuration:0.2 animations:^{
//        [self.view endEditing:YES];
//        bottomConstraint.constant = keyboardHeight;
//    }];
//}

-(void)keyboardDidShow:(NSNotification*)notification
{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    keyboardHeight = keyboardFrameBeginRect.size.height;
    [UIView animateWithDuration:0.2 animations:^{
//        [self.view endEditing:YES];
        bottomConstraint.constant = keyboardHeight;
    }];
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
