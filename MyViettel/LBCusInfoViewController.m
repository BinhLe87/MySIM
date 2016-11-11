//
//  CusInfoViewController.m
//  MyViettel
//
//  Created by Le Van Binh on 11/1/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBCusInfoViewController.h"
#import "UIImageView+WebCache.h"
#import "LBMenuPopoverViewController.h"
#import "Masonry.h"

@interface LBCusInfoViewController () <UIAdaptivePresentationControllerDelegate, UIPopoverPresentationControllerDelegate, LBMenuPopoverViewControllerDelegate, UITextFieldDelegate>

@property (nonatomic, readonly) LBCustomer *customer;

@property(nonatomic,retain)UIPopoverPresentationController *jobPopover;


@end


@implementation LBCusInfoViewController {
    
    UIImageView *backIconImgView;
    UIColor *navBackGroundColor;
    NSMutableArray *jobMenuItems;
    LBMenuPopoverViewController *jobMenuPopoverVC;
    
    UITextField *activeTextField;
    CGRect originRootViewFrame;
    
    UIView *viewInXIB;
    UIScrollView *scrollView;
}


#pragma mark - Accessor methods
-(void)setAvatarImgView:(UIImageView *)avatarImgView {
    
    _avatarImgView = avatarImgView;
    _avatarImgView.layer.cornerRadius = CGRectGetWidth(avatarImgView.frame) / 2.0;
    _avatarImgView.layer.masksToBounds = YES;
}

#pragma mark - View handler

-(void)loadView {
    
    scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    viewInXIB = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LBCusInfoViewController class]) owner:self options:nil] firstObject];
    
    [scrollView addSubview:viewInXIB];
    
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setShowsVerticalScrollIndicator:NO];
    
    
    self.view = scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //TODO: init values
    navBackGroundColor = UIColorFromRGB(0x1E7C54);
    jobMenuItems = [[NSMutableArray alloc] init];
    
    
    //TODO: format navigation bar
    UIImage *backIconImg = [UIImage imageNamed:@"left-arrow.png"];
    backIconImgView = [[UIImageView alloc] initWithImage:backIconImg];
    CGRect backIconImgViewFrame = backIconImgView.frame;
    backIconImgViewFrame.size = CGSizeMake(20, 20);
    backIconImgView.frame = backIconImgViewFrame;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backIconImgView];
    self.navigationItem.leftBarButtonItem = backButton;
    
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [titleLbl setText:@"Thông tin khách hàng"];
    [titleLbl setTextColor:[UIColor whiteColor]];
    [titleLbl setFont:[UIFont boldSystemFontOfSize:17]];
    
    self.navigationItem.titleView = titleLbl;
    
    [self.headerView setBackgroundColor:navBackGroundColor];
    
    [self setEdgesForExtendedLayout:UIRectEdgeBottom];
    
    //TODO: add gestures
    UITapGestureRecognizer *tapGestureOnBackIcon = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnBackIcon:)];
    [backIconImgView addGestureRecognizer:tapGestureOnBackIcon];
    
    UITapGestureRecognizer *tapGestureOnScrollView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapOnScrollView:)];
    [scrollView addGestureRecognizer:tapGestureOnScrollView];
    
    
    //TODO: emailTextField
    self.emailTextField.delegate = self;
    self.emailTextField.autocorrectionType  = UITextAutocorrectionTypeNo;
    
    //TODO: update button
    self.updateButton.layer.cornerRadius = 10;
    self.updateButton.layer.masksToBounds = YES;
    
    
    //TODO: fetch data
    [self.cusInfoPresenterDelegate getCusInfo];
    [self.cusInfoPresenterDelegate getJobMenuItems];
}


-(void)updateViewConstraints {
    
    [viewInXIB mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(scrollView);
        make.right.equalTo(scrollView);
        make.top.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    [super updateViewConstraints];
}



-(void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundColor:navBackGroundColor];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self.emailTextField resignFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [super viewWillDisappear:animated];
}

-(void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame), viewInXIB.frame.size.height);
    scrollView.bounces = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event handlers

-(void)tapOnBackIcon:(UITapGestureRecognizer *)tapGesture {
    
    [self.cusInfoPresenterDelegate dismissCusInfoViewController];
}


-(void)handleTapOnScrollView:(UITapGestureRecognizer *)tapGesture {
    
    CGPoint tapPointInXIBView = [tapGesture locationInView:viewInXIB];
    
    //TODO: showJobMenuPopover
    CGRect showJobMenuIconInXIBViewRect = [_showJobMenuIcon convertRect:_showJobMenuIcon.bounds toView:viewInXIB];
    CGRect selectedJobLblInXIBViewRect = [_selectedJobLbl convertRect:_selectedJobLbl.bounds toView:viewInXIB];
    
    if (CGRectContainsPoint(CGRectInset(selectedJobLblInXIBViewRect, 0, -10), tapPointInXIBView) ||
       CGRectContainsPoint(CGRectInset(showJobMenuIconInXIBViewRect, -15, -15), tapPointInXIBView)) {
        
        [self showJobMenuPopover];
    }
    
    //TODO: emailTextField
    CGRect emailTextFieldInXIBViewRect = [_emailTextField convertRect:_emailTextField.bounds toView:viewInXIB];
    if (CGRectContainsPoint(CGRectInset(emailTextFieldInXIBViewRect, 0, -15), tapPointInXIBView)) {
        
        [_emailTextField becomeFirstResponder];
    }
    
    //TODO:show ShopListViewController
    CGRect shopCellInXIBViewRect = [_shopAddressCell convertRect:_shopAddressCell.bounds toView:viewInXIB];
    
    if(CGRectContainsPoint(shopCellInXIBViewRect, tapPointInXIBView)) {
        
        [self.cusInfoPresenterDelegate showShopListViewController];
    }
}

- (IBAction)touchUpdateButton:(id)sender {
    
    [self.cusInfoPresenterDelegate updateCustomer:^(LBCustomer *updatedCustomer) {

        [updatedCustomer setEmail:_emailTextField.text];
        [updatedCustomer setJob:_selectedJobLbl.text];
    }];
    
}


#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    activeTextField = textField;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - UIPopoverPresentationControllerDelegate
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    
    return UIModalPresentationNone;
}

-(BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    
    [jobMenuPopoverVC dismissViewControllerAnimated:NO completion:nil];
    return YES;
}

#pragma mark - Internal methods
-(void)updateUI {
    
    [self.avatarImgView sd_setImageWithURL:[NSURL URLWithString:self.customer.avatar_link] placeholderImage:[UIImage imageNamed:LB_DEFAULT_AVATAR]];
    
    [self.cusNameLbl setText:_customer.name];
    
    // Make a date formatter which corresponds exactly with the format of the date in core data
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLog(@"%@", [self.customer.birthday description]);
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    // Set the text on the date label
    NSString *birthdayString = [dateFormatter stringFromDate:self.customer.birthday];
    [self.birthdayLbl setText:birthdayString];
    
    [_selectedJobLbl setText:_customer.job];
    [_emailTextField setText:_customer.email];
}

-(void)showJobMenuPopover {
    
    CGRect jobMenuPopOverRect = CGRectMake(0, 0, CGRectGetWidth(scrollView.frame) / 2.0, 200);
    
    jobMenuPopoverVC = [[LBMenuPopoverViewController alloc] initWithFrame:jobMenuPopOverRect];
    jobMenuPopoverVC.menuPopoverDelegate = self;
    jobMenuPopoverVC.preferredContentSize = jobMenuPopOverRect.size;
    jobMenuPopoverVC.items = jobMenuItems;
    jobMenuPopoverVC.modalPresentationStyle = UIModalPresentationPopover;
    
    _jobPopover = jobMenuPopoverVC.popoverPresentationController;
    _jobPopover.delegate = self;
    _jobPopover.sourceView = self.view;
    
    
    CGRect selectedJobLblRectInRootView = [self.selectedJobLbl convertRect:self.selectedJobLbl.bounds toView:self.view];
    _jobPopover.sourceRect = selectedJobLblRectInRootView;
    
    [self presentViewController:jobMenuPopoverVC animated:NO completion:nil];
}

#pragma mark - LBCusInfoViewControllerDelegate
-(void)gotCusInfo:(LBCustomer *)customer {
    
    _customer = customer;
    [self updateUI];
}

-(void)gotJobMenuItems:(NSMutableArray *)jobs {
    
    jobMenuItems = jobs;
}


#pragma mark - LBMenuPopoverViewControllerDelegate
-(void)didSelectItem:(id)selectedItem {
    
    [self.selectedJobLbl setText:[selectedItem description]];
    
    [jobMenuPopoverVC dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - Keyboard appearance handling
- (void)keyboardWillShow:(NSNotification *)notification {
    //get the end position keyboard frame
    NSDictionary *keyInfo = [notification userInfo];
    CGRect keyboardFrame = [[keyInfo objectForKey:@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    //convert it to the same view coords as the tableView it might be occluding
    keyboardFrame = [self.view convertRect:keyboardFrame fromView:nil];
    //calculate if the rects intersect
    CGRect intersect = CGRectIntersection(keyboardFrame, self.view.bounds);
    if (!CGRectIsNull(intersect)) {

        //change the table insets to match - animated to the same duration of the keyboard appearance
        CGRect lastItemRect = [self.view convertRect:self.updateButton.bounds fromView:self.updateButton];
        
        scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetMaxY(lastItemRect) + 8);
        
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, intersect.size.height, 0);
        
        CGRect activeTextFieldRectInRootView = [self.view convertRect:activeTextField.bounds fromView:activeTextField];
        activeTextFieldRectInRootView.size.height += 5;
        
        [scrollView scrollRectToVisible:activeTextFieldRectInRootView animated:NO];
    }
}

- (void) keyboardWillHide:  (NSNotification *) notification{

    //clear the table insets - animated to the same duration of the keyboard disappearance
    scrollView.contentInset = UIEdgeInsetsZero;
}



@end
