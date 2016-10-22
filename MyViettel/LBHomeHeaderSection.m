//
//  LBHomeHeaderSection.m
//  MyViettel
//
//  Created by Le Van Binh on 10/21/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeHeaderSection.h"
#import "Masonry.h"

int const heightForHeaderView = 30;

@implementation LBHomeHeaderSection {
    
    UILabel *headerTitle;
    UILabel *numServicesLbl;
    
    UIView *headerView;
    
    BOOL didUpdateConstraints;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (!(self = [super initWithReuseIdentifier:reuseIdentifier])) return nil;
    
    [self.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    headerView = [[UIView alloc] init];
    [self.contentView addSubview:headerView];
    [headerView setBackgroundColor:UIColorFromRGB(sectionBackgroundColor)];
    
    headerTitle = [[UILabel alloc] init];
    [headerView addSubview:headerTitle];
    [headerTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    numServicesLbl = [[UILabel alloc] init];
    [headerView addSubview:numServicesLbl];
    [numServicesLbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    [numServicesLbl setTextColor:[UIColor whiteColor]];
    [numServicesLbl setBackgroundColor:[UIColor orangeColor]];
    numServicesLbl.text = [@(self.numRowsInSection) stringValue];
    [numServicesLbl setTextAlignment:NSTextAlignmentCenter];
    numServicesLbl.layer.masksToBounds = YES;
    
    [self updateConstraintsIfNeeded];
    
    return self;
}

-(void)setTableSectionType:(HomeTableSectionType)tableSectionType {
    
    _tableSectionType = tableSectionType;
    if (tableSectionType == HomeTableSectionTypeAccount) {
        
        headerTitle.text = @"TÀI KHOẢN DATA";
        [numServicesLbl setHidden:YES];
        
    } else if (tableSectionType == HomeTableSectionTypeService) {
        
        headerTitle.text = @"DỊCH VỤ CHO BẠN";
        [numServicesLbl setHidden:NO];
    }
    
    [self updateConstraintsIfNeeded];
}

+(NSString*)identifier {
    
    return NSStringFromClass([self class]);
}

+(CGFloat)heightForHeaderSection {
    
    return spaceBetweenSections + heightForHeaderView;
}

-(void)updateConstraints {
    
        
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(self);
        }];
        
        [headerTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(headerView);
            make.left.equalTo(headerView.mas_left).offset(10);
        }];
        
        if (self.tableSectionType == HomeTableSectionTypeService) {
            
            [numServicesLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.centerY.equalTo(headerView);
                make.left.equalTo(headerTitle.mas_right).offset(10);
                make.width.equalTo(@20);
                make.height.equalTo(@20);
            }];
        }
    
    
    [super updateConstraints];
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    if (self.tableSectionType == HomeTableSectionTypeService) {
        
        numServicesLbl.layer.cornerRadius = numServicesLbl.frame.size.width / 2.0;
    }
    
    headerView.frame = CGRectMake(marginLeftSection, CGRectGetHeight(self.contentView.frame) - heightForHeaderView, CGRectGetWidth(self.contentView.frame) - marginLeftSection - marginRightSection, heightForHeaderView);
    
    //make corner for headerView
    UIBezierPath *cornerMaskPath = [UIBezierPath bezierPathWithRoundedRect:headerView.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(8, 8)];
    CAShapeLayer *cornerShapeLayer = [CAShapeLayer layer];
    cornerShapeLayer.path = cornerMaskPath.CGPath;
    cornerShapeLayer.frame = headerView.bounds;
    headerView.layer.mask = cornerShapeLayer;
}







@end
