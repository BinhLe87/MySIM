//
//  SideMenuTableViewCell.h
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBSideMenuTableViewCell : UITableViewCell

@property(nonatomic) UIImage *menuIcon;
@property(nonatomic) NSString *menuItemTitle;
@property(nonatomic) UIImageView *menuIconView;
@property(nonatomic) UILabel *menuItemTitleLabel;
@property(nonatomic) BOOL hasSeperatorLine;

-initWithIconAndTitle:(UIImage*)icon menuItemTitle:(NSString*)menuItemTitle hasSeperatorLine:(BOOL)hasSeperatorLine;
+(CGFloat)heightForTableViewCell;
-(void)setupUI;

@end
