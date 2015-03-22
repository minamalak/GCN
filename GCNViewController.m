//
//  GCNViewController.m
//  GCN
//
//  Created by Mina Malak on 12/21/14.
//  Copyright (c) 2014 LinkDev. All rights reserved.
//

#import "GCNViewController.h"
#import "AppDelegate.h"
#import "UIView+ZZFontSetter.h"

@interface GCNViewController ()

@end

@implementation GCNViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [navBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    navBar.shadowImage = [UIImage new];
    navBar.translucent = YES;
	
	if (m_isRoot) {
		[menuButton setImage:[UIImage imageNamed:@"menu_ico"] forState:UIControlStateNormal];
//		if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//			[menuButton removeFromSuperview];
//            [menuButton setHidden:YES];
//			if (_navigationPaneBarButtonItem) {
//                if (UIDeviceOrientationIsPortrait(self.interfaceOrientation))
//                {
//                    [navBar.topItem setLeftBarButtonItem:self.navigationPaneBarButtonItem];
//                }
//			}
//		}
	}else
	{
//        if ([NSStringFromClass(self.class) rangeOfString:@"Filter"].location != NSNotFound && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//            [menuButton setHidden:YES];
//        }
//        else {
            [menuButton setHidden:NO];
            [menuButton setImage:[UIImage imageNamed:@"back_btn"] forState:UIControlStateNormal];
//        }
	}
		
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 2;
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 0.5;
    [label setFont:[UIFont fontWithName:BoldFont size:16.0]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor blackColor]];
    [label setText:self.title];
    [navBar.topItem setTitleView:label];
    
//    if ([self isKindOfClass:[NewsItemViewController class]] || [self isKindOfClass:[EventItemViewController class]] || [self isKindOfClass:[NotificationItemViewController class]]) {
//        [self.view setBackgroundColor:[UIColor clearColor]];
//    }
//    else {
//        NSAssert((backgroundView != nil), @"Background View is not assigned");
//        NSAssert((menuButton != nil), @"Menu Button is not assigned");
//        
//        [self.view setBackgroundColor:[UIColor colorWithRed:0.0 green:135.0/255.0 blue:81.0/255.0 alpha:1.0]];
//    }
	
	
	
//	if ([SettingsController isArabic]) {
		[self.view setAllFonts:[UIFont fontWithName:RegularFont size:16.0] bold:[UIFont fontWithName:BoldFont size:16.0]];
//	}
    
//	[self.navigationItem setTitle:self.title];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
    
    [navBar.topItem setTitle:self.title];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)menuButtonPressed:(id)sender
{
	if (m_isRoot) {
//		[((AppDelegate *) [UIApplication sharedApplication].delegate) openMenu];
	}else
	{
        if (self.navigationController) {
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
	}
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(IBAction)homeMenuButtonPressed:(id)sender
{
	if (m_isRoot) {
//		[((AppDelegate *) [UIApplication sharedApplication].delegate) openMenu];
	}else
	{
		[self.navigationController popToRootViewControllerAnimated:YES];;
	}
}

-(void)setAsRoot:(BOOL)isRoot
{
	m_isRoot = isRoot;
}

-(id)initControllerWithStoryboardID:(NSString *)storyboardID
{
	UIStoryboard *sb = [self.class getStoryboard];
	id vc = [sb instantiateViewControllerWithIdentifier:storyboardID];
	[vc setAsRoot:NO];
	return vc;
}

+(UIStoryboard *)getStoryboard
{
//	NSString *storyboardName;
//	
//    if (![SettingsController isArabic]) {
//        storyboardName = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)? @"Main_iPad_English" : @"Main_English";
//    }else
//    {
//        storyboardName = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)? @"Main_iPad" : @"Main";
//    }

	return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
}

-(void)startLoading:(BOOL)isBlocking
{
	if (hud != nil) {
		[self finishLoading];
	}
	
	hud =  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	hud.mode = MBProgressHUDModeIndeterminate;
	hud.userInteractionEnabled = isBlocking;
//	if ([SettingsController isArabic]) {
		hud.labelText = @"جاري التحميل";
//	}else
//	{
//		hud.labelText = @"Loading";
//	}
}

-(void)finishLoading
{
	[hud hide:YES];
	hud = nil;
}

-(NSString *)languageKey
{
	if ([SettingsController isArabic]) {
		return @"arabic";
	}return @"English";
}

-(void) showAlertViewWithText:(NSString *)text
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:text delegate:nil cancelButtonTitle:@"نعم" otherButtonTitles:nil, nil];
    [alert show];
}

//- (void)setNavigationPaneBarButtonItem:(UIBarButtonItem *)splitViewButton
//{
//    [splitViewButton setImage:[UIImage imageNamed:@"menu_ico"]];
//    [splitViewButton setTintColor:[UIColor whiteColor]];
//    
//    _navigationPaneBarButtonItem = splitViewButton;
//    [navBar.topItem setLeftBarButtonItem:self.navigationPaneBarButtonItem];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
