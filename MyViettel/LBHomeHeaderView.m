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

-(void)updateConstraints {
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(self.mas_width);
        make.height.equalTo([NSNumber numberWithFloat:[LBHomeHeaderView heightForHeaderView]]);
    }];
    
    
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
    
    return 100.0;
}

@end
