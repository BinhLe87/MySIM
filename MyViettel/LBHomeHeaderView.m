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
    
    if(!self.didUpdateConstraints) {
        
        self.didUpdateConstraints = YES;
        
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(self);
        }];
    }
    
    
    [super updateConstraints];
}


+(instancetype)header {
    
    LBHomeHeaderView *headerView = [[LBHomeHeaderView alloc] init];
    
    if (headerView) {
        
        headerView.contentView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:headerView options:nil] firstObject];
        
        [headerView addSubview:headerView.contentView];
        
        headerView.didUpdateConstraints = NO;
        
        return headerView;
    }
    
    return nil;
}

+(CGFloat)heightForHeaderView {
    
    return 230;
}

@end
