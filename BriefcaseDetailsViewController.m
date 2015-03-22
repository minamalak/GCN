//
//  BriefcaseDetailsViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "BriefcaseDetailsViewController.h"
#import "STCollapseTableView.h"
#import "MediaMessageDetailsItemTableViewCell.h"
#import "MediaMessageDetailsHeaderTableViewCell.h"
#import "AddNoteViewController.h"
#import "NoteTableViewCell.h"
#import "BriefcaseViewController.h"

#import "GCNGetMediaMessageDetails.h"
#import "GCNGetMediaMessageDetailsResponse.h"
#import "GCNMediaMessage.h"
#import "GCNSection.h"

#import "GCNAddMessageToBriefcase.h"
#import "GCNAddMessageToBriefcaseResponse.h"
#import "GCNBriefcaseStatus.h"

#import "GCNGetNotes.h"
#import "GCNGetNotesResponse.h"
#import "GCNNote.h"

#import "GCNDeleteNote.h"
#import "GCNDeleteNoteResponse.h"

#import "GCNEditNote.h"
#import "GCNEditNoteResponse.h"

#import "GCNDeletePrivateMediaMessage.h"
#import "GCNDeletePrivateMediaMessageResponse.h"

@interface BriefcaseDetailsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet STCollapseTableView *tableView;

@end

@implementation BriefcaseDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isEditing = NO;
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
    [self getNotes];
}

-(void) updateTableContent
{
    arraySections = [[NSMutableArray alloc]init];
    _sections = [NSMutableDictionary new];
    
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
    [_tableView setShouldHandleHeadersTap:NO];
    [_tableView setShouldRotate:NO];
    for (int i = 0; i <[[_sections allKeys] count]; i ++) {
        [_tableView openSection:i animated:YES];
    }
    
    CGFloat height = (counter / 4) + ([[_sections allKeys]count] * 50) + 50;
    [heightConstraint setConstant:height];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _tableView)
        return [[_sections allKeys] count];
    
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _tableView) {
        MediaMessageDetailsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaMessageDetailsItemTableViewCell" forIndexPath:indexPath];
        
        [cell setUpItem:[[_sections valueForKey:[[_sections allKeys] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    else {
        NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteTableViewCell" forIndexPath:indexPath];
        [cell setUpItemWithDictionary:arrayNotes[indexPath.row] IndexPath:indexPath :current :isEditing];
        [cell setDelegate:self];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _tableView)
        return [[_sections valueForKey:[[_sections allKeys]  objectAtIndex:section]] count];
    
    return arrayNotes.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == _tableView) {
        MediaMessageDetailsHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaMessageDetailsHeaderTableViewCell"];
        [cell setUpItem:[[_sections allKeys]  objectAtIndex:section]];
        
        cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
        
        [cell setNeedsLayout];
        
        CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        
        
        return size.height+1;
    }
    
    return 0.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == _tableView) {
        MediaMessageDetailsHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaMessageDetailsHeaderTableViewCell"];
        
        [cell setUpItem:[[_sections allKeys]  objectAtIndex:section]];
        
        return cell.contentView;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _tableView) {
        MediaMessageDetailsItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaMessageDetailsItemTableViewCell"];
        [cell setUpItem:[[_sections valueForKey:[[_sections allKeys] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
        
        cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
        
        [cell setNeedsLayout];
        
        CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        
        counter += size.height + 1;
        return size.height+1;
    }
    else {
        NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteTableViewCell"];
        [cell setUpItemWithDictionary:arrayNotes[indexPath.row] IndexPath:indexPath :current :isEditing];
        
        cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
        [cell setNeedsLayout];
        
        CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        
        NSString *text = [arrayNotes[indexPath.row] Text];
        
        CGSize sizeOfTextView = [self frameForText:text sizeWithFont:nil constrainedToSize:CGSizeMake(300.f, CGFLOAT_MAX)];
        
        if (sizeOfTextView.height + size.height < 138) {
            notetableHeight += 138.0;
            return 138;
        }
        else {
            notetableHeight += size.height + 1;
        }
        
        return sizeOfTextView.height + size.height;
    }
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)menuButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    [_tableView setDelegate:nil];
}

-(IBAction)addNoteAction
{
    AddNoteViewController *vc = (AddNoteViewController *) [self initControllerWithStoryboardID:@"AddNoteViewController"];
    [vc setMessageID:_messageID];
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark Notes Section

-(void) getNotes
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNGetNotes *obj = [[GCNGetNotes alloc]init];
    obj.username = [SettingsController getToken];
    obj.messageID = _messageID;
    [service GetNotesAsyncIsPost:YES input:obj caller:self];
}

-(void)GetNotesCallback:(GCNGetNotesResponse *)response error:(NSError *)error
{
    [self finishLoading];
    notetableHeight = 0;
    arrayNotes = response.GetNotesResult;
    arrayOldData = response.GetNotesResult;
    [theTable reloadData];
    
    CGFloat height = notetableHeight + 50;
    [heightConstraintComments setConstant:height];
}

-(void)reloadTableView :(NSString *) item :(NSIndexPath *) index  :(NSIndexPath *) currentIndex
{
    current = currentIndex;
    GCNNote *note = arrayNotes[index.row];
    [note setText:item];
    [arrayNotes replaceObjectAtIndex:index.row withObject:note];
    [theTable reloadRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationNone];
}

-(void) deleteNoteAction :(NSIndexPath *) index
{
    noteID = [arrayNotes[index.row] ID];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"هل تريد حذف هذه الملاحظة" delegate:self cancelButtonTitle:@"لا" otherButtonTitles:@"نعم", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // Cancel
    }
    else {
        // Yes
        [self deleteNote];
    }
}

-(IBAction)deleteMessageAction
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNDeletePrivateMediaMessage *obj = [[GCNDeletePrivateMediaMessage alloc]init];
    obj.messageID = _messageID;
    [service DeletePrivateMediaMessageAsyncIsPost:YES input:obj caller:self];
}

-(void)DeletePrivateMediaMessageCallback:(GCNDeletePrivateMediaMessageResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        if ([response.DeletePrivateMediaMessageResult boolValue]) {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageSuccessfulDeleted]];
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

-(IBAction)editAction
{
    isEditing = YES;
    [theTable reloadData];
    
    oldLeftItem = (UIBarButtonItem *)navBar.topItem.leftBarButtonItem;
    oldRightItem = (UIBarButtonItem *)navBar.topItem.rightBarButtonItem;
    
    UIBarButtonItem *newRightItem = [[UIBarButtonItem alloc]init];
    [newRightItem setTitle:@"حفظ"];
    [newRightItem setStyle:UIBarButtonItemStylePlain];
    [newRightItem setTintColor:[UIColor whiteColor]];
    [newRightItem setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"HelveticaNeueLTArabic-Roman" size:15.0],NSFontAttributeName,
      nil]forState:UIControlStateNormal];
    [newRightItem setAction:@selector(btnSaveClicked)];
    [navBar.topItem setRightBarButtonItem:newRightItem];
    
    
    UIBarButtonItem *newItem = [[UIBarButtonItem alloc]init];
    [newItem setTitle:@"إلغاء"];
    [newItem setStyle:UIBarButtonItemStylePlain];
    [newItem setTintColor:[UIColor whiteColor]];
    [newItem setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"HelveticaNeueLTArabic-Roman" size:15.0],NSFontAttributeName,
      nil]forState:UIControlStateNormal];
    [newItem setAction:@selector(btnCancelClicked)];
    [navBar.topItem setLeftBarButtonItem:newItem];
    
    [viewDeleteMessage setHidden:NO];
}

-(void)btnSaveClicked
{
    [viewDeleteMessage setHidden:YES];
    
    isEditing = NO;
    [theTable reloadData];
    [navBar.topItem setLeftBarButtonItem:oldLeftItem];
    [navBar.topItem setRightBarButtonItem:oldRightItem];
    
    for (int i = 0; i < arrayOldData.count; i ++) {
        if (![[arrayOldData[i] Text] isEqualToString:[arrayNotes[i] Text]]) {
            [self updateNote:arrayNotes[i]];
        }
    }
}

-(void) btnCancelClicked
{
    [viewDeleteMessage setHidden:YES];
    
    isEditing = NO;
    [theTable reloadData];
    [navBar.topItem setLeftBarButtonItem:oldLeftItem];
    [navBar.topItem setRightBarButtonItem:oldRightItem];
}

-(void) updateNote :(GCNNote *) note
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNEditNote *obj = [[GCNEditNote alloc]init];
    obj.noteID = note.ID;
    obj.username = [SettingsController getToken];
    obj.noteText = note.Text;
    [service EditNoteAsyncIsPost:YES input:obj caller:self];
}

-(void)EditNoteCallback:(GCNEditNoteResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageNoteSuccessfulUpdated]];
        [self getNotes];
    }
    else {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageConnectionError]];
    }
}


-(void) deleteNote
{
    [self startLoading:NO];
    GCNServiceClient *service = [[GCNServiceClient alloc]init];
    GCNDeleteNote *obj = [[GCNDeleteNote alloc]init];
    obj.noteID = noteID;
    [service DeleteNoteAsyncIsPost:YES input:obj caller:self];
}

-(void)DeleteNoteCallback:(GCNDeleteNoteResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageNoteSuccessfulDeleted]];
        counter = 0;
        notetableHeight = 0;
        [self getNotes];
    }
    else {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageConnectionError]];
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
