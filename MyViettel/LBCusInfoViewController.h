//
//  CusInfoViewController.h
//  MyViettel
//
//  Created by Le Van Binh on 11/1/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBCusInfoInterface.h"

@interface LBCusInfoViewController : UIViewController <LBCusInfoViewControllerDelegate>


@property (strong, nonatomic) IBOutlet UIView *rootView;


@property (weak, nonatomic) IBOutlet UIView *headerView;

@property (weak, nonatomic) IBOutlet UILabel *cusNameLbl;

@property (weak, nonatomic) IBOutlet UILabel *birthdayLbl;

@property (weak, nonatomic) IBOutlet UILabel *selectedJobLbl;

@property (weak, nonatomic) IBOutlet UIImageView *showJobMenuIcon;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UIButton *updateButton;



@property (weak, nonatomic) IBOutlet UIImageView *avatarImgView;



@property(nonatomic, weak) id <LBCusInfoPresenterDelegate> cusInfoPresenterDelegate;


- (IBAction)touchUpdateButton:(id)sender;


@end
