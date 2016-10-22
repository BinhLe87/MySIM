//
//  LBHomeFooterSection.m
//  MyViettel
//
//  Created by Le Van Binh on 10/21/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeFooterSection.h"
#import "LBHomeViewController.h"

@implementation LBHomeFooterSection


-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (!(self = [super initWithReuseIdentifier:reuseIdentifier])) return nil;
    
    [self.contentView setBackgroundColor:UIColorFromRGB(sectionBackgroundColor)];
    
    return self;
}

+(NSString *)identifier {
    
    return NSStringFromClass([self class]);
}

+(CGFloat)heightForFooterSection {
    
    return 10.0;
}


-(void)layoutSubviews {
    
    self.contentView.frame = CGRectMake(marginLeftSection, 0, CGRectGetWidth(self.frame) - marginLeftSection - marginRightSection, CGRectGetHeight(self.frame));
    
    //make corner for headerView
    UIBezierPath *cornerMaskPath = [UIBezierPath bezierPathWithRoundedRect:self.contentView.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(8, 8)];
    CAShapeLayer *cornerShapeLayer = [CAShapeLayer layer];
    cornerShapeLayer.path = cornerMaskPath.CGPath;
    cornerShapeLayer.frame = self.contentView.bounds;
    self.contentView.layer.mask = cornerShapeLayer;
}

@end
