//
//  LBHomeHeaderView.m
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBHomeHeaderView.h"
#import "Masonry.h"

@implementation LBHomeHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setCusAvatarImageView:(UIImageView *)cusAvatarImageView {
    
    _cusAvatarImageView = cusAvatarImageView;
    
    _cusAvatarImageView.layer.cornerRadius = cusAvatarImageView.frame.size.width / 2.0;
    _cusAvatarImageView.layer.masksToBounds = YES;
}

-(void)updateConstraints {
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        /*make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(self.mas_width);
        make.height.equalTo([NSNumber numberWithFloat:[LBHomeHeaderView heightForHeaderView]]);*/
        make.edges.equalTo(self);
    }];
    
    /*//TODO: update constraints for seperator line
    //vertical line on the left
    [_verticalLineLeft mas_remakeConstraints:^(MASConstraintMaker *make) {
        
         make.left.equalTo(self.contentView.mas_left).offset(self.contentView.frame.size.width/3.0);
    }];

    
    [_verticalLineRight mas_remakeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.contentView.mas_right).offset(-self.contentView.frame.size.width/3.0);
    }];
    
    //TODO: update constraints for accounts's label
    [_BasicAccountNameLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(_verticalLineLeft).centerOffset(CGPointMake(-self.contentView.frame.size.width/6.0, -10));
    }];*/
    
    [super updateConstraints];
}


+(instancetype)header {
    
    LBHomeHeaderView *headerView = [[LBHomeHeaderView alloc] init];
    
    if (headerView) {
        
        headerView.contentView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:headerView options:nil] firstObject];
        
        [headerView addSubview:headerView.contentView];
        
        return headerView;
    }
    
    return nil;
}

+(CGFloat)heightForHeaderView {
    
    return 230;
}

@end
