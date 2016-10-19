//
//  LBSlideMenuChooseBackgroundTableViewCell.m
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBSlideMenuChooseBackgroundTableViewCell.h"
#import "Masonry.h"

@interface LBSlideMenuChooseBackgroundTableViewCell()

@property(nonatomic) UIImageView *backgroundImageView;

@end

@implementation LBSlideMenuChooseBackgroundTableViewCell


-(UIImageView *)backgroundImageView {
    
    if (_backgroundImageView) return _backgroundImageView;
    
    _backgroundImageView = [[UIImageView alloc] init];
    [_backgroundImageView setContentMode:UIViewContentModeScaleToFill];
    [self.contentView addSubview:_backgroundImageView];
    
    return _backgroundImageView;
}



-(void)setBackgroundImage:(UIImage *)backgroundImage {
    
    _backgroundImage = backgroundImage;
    
    [self.backgroundImageView setImage:backgroundImage];
    [self updateConstraints];
}

-(void)updateConstraints {
    
    [self.backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(self.backgroundImageView.superview.mas_width);
        make.height.equalTo(self.backgroundImageView.superview.mas_height).offset(-8);
        make.top.equalTo(self.backgroundImageView.superview.mas_top).offset(4);
        make.left.equalTo(self.backgroundImageView.superview.mas_left);
    }];
    
    [super updateConstraints];
}

+(CGFloat)heightForTableCell {
    
    return 80.0;
}






@end
