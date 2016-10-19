//
//  LBSlideMenuHeaderView.h
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBSlideMenuViewController.h"

@interface LBSlideMenuHeaderView : UIView

@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UILabel *cusNameLbl;


@property (weak, nonatomic) IBOutlet UILabel *cusPhoneLbl;


@property (weak, nonatomic) IBOutlet UIImageView *cusAvatarImage;


@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (weak, nonatomic) IBOutlet UIImageView *albumIcon;

@property(nonatomic) LBSlideMenuViewController *slideMenuVC;



-(void)setupUI;
+(CGFloat)heightForHeaderView;
+(instancetype)header;
-(void)tapOnAlbumBackground:(UITapGestureRecognizer *)recognizer;

@end
