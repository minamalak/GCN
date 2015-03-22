//
//  GCNViewController.h
//  GCN
//
//  Created by Mina Malak on 12/21/14.
//  Copyright (c) 2014 LinkDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "SettingsController.h"

@interface GCNViewController : UIViewController
{

	IBOutlet UIButton *menuButton;
    IBOutlet UIImageView *backgroundView;
	IBOutlet UINavigationBar *navBar;
	
	BOOL m_isRoot;
	MBProgressHUD *hud;
	
    UIBarButtonItem *_navigationPaneBarButtonItem;
}
@property (nonatomic, retain) UIBarButtonItem *navigationPaneBarButtonItem;

-(void)setAsRoot:(BOOL)isRoot;
-(IBAction)menuButtonPressed:(id)sender;
-(IBAction)homeMenuButtonPressed:(id)sender;
-(id)initControllerWithStoryboardID:(NSString *)storyboardID;

+(UIStoryboard *)getStoryboard;

-(void)startLoading:(BOOL)isBlocking;
-(void)finishLoading;

-(NSString *)languageKey;

-(void) showAlertViewWithText:(NSString *)text;

@end
