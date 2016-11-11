//
//  SideMenuTableViewCell.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBSideMenuTableViewCell.h"
#import "Masonry.h"


@implementation LBSideMenuTableViewCell {
    

    UIView *seperatorLineView;
}
@synthesize menuIcon = _menuIcon;

#pragma mark - Initializers

-(UIImage *)menuIcon {
    
    if (_menuIcon) return _menuIcon;
    
    _menuIcon = [UIImage imageNamed:@"house.png"]; //default icon
    
    return _menuIcon;
}

-(void)setMenuIcon:(UIImage *)menuIcon {
    
    _menuIcon = menuIcon;
    
    [self.menuIconView setImage:menuIcon];
}

-(void)setMenuItemTitle:(NSString *)menuItemTitle {
    
    _menuItemTitle = menuItemTitle;
    [self.menuItemTitleLabel setText:menuItemTitle];
}


-(UIImageView *)menuIconView {
    
    if(_menuIconView) return _menuIconView;
    
    _menuIconView = [[UIImageView alloc] initWithImage:self.menuIcon];
    
    [self.contentView addSubview:_menuIconView];
    
    return _menuIconView;
}

-(UILabel *)menuItemTitleLabel {
    
    if (_menuItemTitleLabel) return _menuItemTitleLabel;
    
    _menuItemTitleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_menuItemTitleLabel];
    
    return _menuItemTitleLabel;
}

-(void)setHasSeperatorLine:(BOOL)hasSeperatorLine {
    
    if (hasSeperatorLine) {
        
        _hasSeperatorLine = hasSeperatorLine;
        seperatorLineView = [[UIView alloc] init];
        seperatorLineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:seperatorLineView];
    }
}



-initWithIconAndTitle:(UIImage*)icon menuItemTitle:(NSString*)menuItemTitle hasSeperatorLine:(BOOL)hasSeperatorLine{
    
    if (!(self = [super init])) return nil;
    
    self.menuIcon = icon;
    self.menuItemTitle = menuItemTitle;
    self.hasSeperatorLine = hasSeperatorLine;
    
    
    return self;
}

-(void)setupUI {
    
    [self updateConstraints];
}

-(void)updateConstraints {
    
    [self.menuIconView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.equalTo(self.contentView.mas_height).offset(-6);
        make.width.equalTo(self.contentView.mas_height).offset(-6);
        make.left.equalTo(self.contentView.mas_left).offset(8);
    }];
    
    [self.menuItemTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.equalTo(self.contentView.mas_height).offset(-6);
        make.left.equalTo(self.menuIconView.mas_right).offset(8);
    }];
    
    
    if (seperatorLineView) {
        
        [seperatorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-0.2);
            make.height.equalTo(@0.2);
            make.width.equalTo(self.contentView.mas_width);
        }];
    }
    
    
    [super updateConstraints];
}

+(CGFloat)heightForTableViewCell {
    
    return 40.0;
}


@end
