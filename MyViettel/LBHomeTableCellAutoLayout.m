//
//  LBHomeTableCellAutoLayout.m
//  MyViettel
//
//  Created by Le Van Binh on 10/22/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeTableCellAutoLayout.h"
#import "LBHomeViewController.h"
#import "Masonry.h"

@implementation LBHomeTableCellAutoLayout {
    
    MASConstraint *contentViewToSelfLeftConstraint;
    MASConstraint *contentViewToSelfRightConstraint;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
    [self setBackgroundColor:UIColorFromRGB(tableViewBackgroundColor)];
    [self.contentView setBackgroundColor:UIColorFromRGB(sectionBackgroundColor)];
    

    
    _separatorCellLine = [[UIView alloc] init];
    [self.contentView addSubview:_separatorCellLine];
    [_separatorCellLine setBackgroundColor:[UIColor lightGrayColor]];
    [_separatorCellLine setTranslatesAutoresizingMaskIntoConstraints:NO];
}


-(void)setRowAvatar:(UIImageView *)rowAvatar {
    
    _rowAvatar = rowAvatar;
    _rowAvatar.layer.masksToBounds = YES;
    _rowAvatar.layer.cornerRadius = _rowAvatar.frame.size.width / 2.0;
}

-(void)updateConstraints {
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@(marginLeftSection));
        make.right.equalTo(@(-marginRightSection));
    }];
    
    [self.separatorCellLine mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.height.equalTo(@0.3);
    }];
    
    [super updateConstraints];
}


+(CGFloat)estimatedCellHeight {
    
    return 150;
}

- (void)layoutSubviews
{

    [super layoutSubviews];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    self.rowContent.preferredMaxLayoutWidth = CGRectGetWidth(self.rowContent.frame);
    self.rowTitle.preferredMaxLayoutWidth = CGRectGetWidth(self.rowTitle.frame);
}


@end
