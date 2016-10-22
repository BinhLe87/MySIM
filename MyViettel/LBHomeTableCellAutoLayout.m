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

@implementation LBHomeTableCellAutoLayout

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
    [self setBackgroundColor:UIColorFromRGB(tableViewBackgroundColor)];
    [self.contentView setBackgroundColor:UIColorFromRGB(sectionBackgroundColor)];
    
    
    _separatorCellLine = [[UIView alloc] init];
    [self.contentView addSubview:_separatorCellLine];
    [_separatorCellLine setBackgroundColor:[UIColor lightGrayColor]];
    [_separatorCellLine setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self updateConstraintsIfNeeded];
}


-(void)setRowAvatar:(UIImageView *)rowAvatar {
    
    _rowAvatar = rowAvatar;
    _rowAvatar.layer.masksToBounds = YES;
    _rowAvatar.layer.cornerRadius = _rowAvatar.frame.size.width / 2.0;
}

-(void)updateConstraints {
    
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@(marginLeftSection));
        make.right.equalTo(@(-marginRightSection));
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    [self.separatorCellLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.height.equalTo(@0.3);
    }];
    
    [super updateConstraints];
}


+(CGFloat)estimatedCellHeight {
    
    return 140;
}

- (void)layoutSubviews
{

    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    self.rowTitle.preferredMaxLayoutWidth = CGRectGetWidth(self.rowTitle.frame);
    self.rowContent.preferredMaxLayoutWidth = CGRectGetWidth(self.rowContent.frame);
}




@end
