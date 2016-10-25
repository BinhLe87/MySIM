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
    
    /*[self.rowContent setNeedsUpdateConstraints];
    [self.rowTitle setNeedsUpdateConstraints];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];*/
    
    
    /*[self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        
       contentViewToSelfLeftConstraint = make.left.equalTo(@(marginLeftSection));
       contentViewToSelfRightConstraint = make.right.equalTo(@(-marginRightSection));
    }];
    
    NSLog(@"self UILayoutFittingCompressedSize: %@", NSStringFromCGSize([self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize]));
    
    [self.contentView setNeedsUpdateConstraints];
    [self.contentView updateConstraintsIfNeeded];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];*/
    
    
    /*[self mas_updateConstraints:^(MASConstraintMaker *make) {
     
        make.height.equalTo(@([self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height));
     }];*/
    
    /*[self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        contentViewToSelfTopConstraint = make.top.equalTo(self).with.priority(900);
        contentViewToSelfBottomConstraint = make.bottom.equalTo(self).with.priority(900);
    }];*/
    
    
    /*[self.contentView setNeedsUpdateConstraints];
    [self.contentView updateConstraintsIfNeeded];*/
    

    
    /*[self updateConstraintsIfNeeded];
    [self layoutIfNeeded];*/
    
    /*NSLog(@"self.contentView size fitting %@", NSStringFromCGSize([self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize]));
    NSLog(@"self.contentViewFrame %@", NSStringFromCGRect(self.contentView.frame));
    NSLog(@"self.frame %@", NSStringFromCGRect(self.frame));*/
    
    
    /*NSLog(@"height for contentView %@", NSStringFromCGSize([self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize]));
    
    
    CGRect contentViewFrame = self.contentView.frame;
    contentViewFrame.size.height = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    self.contentView.frame = contentViewFrame;
    
    CGRect selfFrame = self.frame;
    selfFrame.size.height = CGRectGetHeight(self.contentView.frame);
    self.frame = selfFrame;
    
    [self layoutIfNeeded];*/
    
    
    //self.bounds = self.contentView.bounds;
    
    /*CGRect cellFrame = self.frame;
    cellFrame.size = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.contentView.frame));
    
    self.frame = cellFrame;*/    
    
    /*CGRect rowTitleFrame = self.rowTitle.frame;
     rowTitleFrame.size = self.rowTitle.intrinsicContentSize;
     self.rowTitle.frame = rowTitleFrame;
     
     CGRect rowContentFrame = self.rowContent.frame;
     rowContentFrame.size = self.rowContent.intrinsicContentSize;
     self.rowContent.frame = rowContentFrame;
     
     self.contentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), rowTitleFrame.size.height + rowContentFrame.size.height + 10);*/
    
    
    
    
    
    /*[self.rowContent updateConstraintsIfNeeded];
     [self.rowTitle updateConstraintsIfNeeded];
     
     [self.contentView layoutIfNeeded];*/
    
    /*[self.rowContent mas_updateConstraints:^(MASConstraintMaker *make) {
     
     CGFloat height = [self.rowContent intrinsicContentSize].height;
     
     make.height.greaterThanOrEqualTo(@(height)).with.priority(1000);
     }];
     
     [self updateConstraintsIfNeeded];
     
     [self layoutIfNeeded];*/
    
}


@end
