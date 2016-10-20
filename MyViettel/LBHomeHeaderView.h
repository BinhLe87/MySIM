//
//  LBHomeHeaderView.h
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBHomeHeaderView : UIView

@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UIImageView *cusAvatarImageView;


@property (weak, nonatomic) IBOutlet UILabel *cusNameLbl;

@property (weak, nonatomic) IBOutlet UILabel *CusInfoLbl;

@property (weak, nonatomic) IBOutlet UILabel *BasicAccountLbl;

@property (weak, nonatomic) IBOutlet UILabel *PromAccountLbl;


@property (weak, nonatomic) IBOutlet UILabel *DataAccountLbl;

+(instancetype)header;
+(CGFloat)heightForHeaderView;


@end
