//
//  LBHomeFooterSection.m
//  MyViettel
//
//  Created by Le Van Binh on 10/21/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeFooterSection.h"
#import "LBHomeViewController.h"
#import "Masonry.h"

@implementation LBHomeFooterSection {
    
    UIView *footerView;
}


-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (!(self = [super initWithReuseIdentifier:reuseIdentifier])) return nil;
    
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    footerView = [[UIView alloc] init];
    [self.contentView addSubview:footerView];
    
    [footerView setBackgroundColor:UIColorFromRGB(sectionBackgroundColor)];
    
    return self;
}

+(NSString *)identifier {
    
    return NSStringFromClass([self class]);
}

+(CGFloat)heightForFooterSection {
    
    return 10.0;
}

-(void)updateConstraints {
    
    [footerView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.contentView).offset(marginLeftSection);
        make.right.equalTo(self.contentView).offset(-marginRightSection);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@10);
    }];
    
    [super updateConstraints];
}


-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    //make corner for headerView
    UIBezierPath *cornerMaskPath = [UIBezierPath bezierPathWithRoundedRect:footerView.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(8, 8)];
    CAShapeLayer *cornerShapeLayer = [CAShapeLayer layer];
    cornerShapeLayer.path = cornerMaskPath.CGPath;
    cornerShapeLayer.frame = footerView.bounds;
    footerView.layer.mask = cornerShapeLayer;
    
    
    
}

@end
