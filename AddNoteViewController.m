//
//  AddNoteViewController.m
//  GCN
//
//  Created by Mina Malak on 2/24/15.
//  Copyright (c) 2015 Linkdev. All rights reserved.
//

#import "AddNoteViewController.h"
#import "GCNAddNote.h"
#import "GCNAddNoteResponse.h"
#import "BriefcaseDetailsViewController.h"

@interface AddNoteViewController ()

@end

@implementation AddNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [txtNote setPlaceholder:@"الملاحظة"];

    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [UIView animateWithDuration:0.2 animations:^{
        [self.view endEditing:YES];
    }];
}

-(IBAction)saveAction
{
    if ([txtNote.text isEqualToString:@""]) {
        [self showAlertViewWithText:[SettingsController getErrorText:MessageNoteEmpty]];
    }
    else {
        [self startLoading:NO];
        GCNServiceClient *service = [[GCNServiceClient alloc]init];
        GCNAddNote *obj = [[GCNAddNote alloc]init];
        obj.username = [SettingsController getToken];
        obj.noteText = txtNote.text;
        obj.messageID = _messageID;
        [service AddNoteAsyncIsPost:YES input:obj caller:self];
    }
}

-(void)AddNoteCallback:(GCNAddNoteResponse *)response error:(NSError *)error
{
    [self finishLoading];
    if (response) {
        if ([response.AddNoteResult boolValue]) {
            [self showAlertViewWithText:[SettingsController getErrorText:MessageNoteSuccessfulAdded]];
            [self menuButtonPressed:nil];
            [_delegate getNotes];
        }
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
