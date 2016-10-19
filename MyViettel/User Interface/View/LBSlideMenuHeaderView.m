//
//  LBSlideMenuHeaderView.m
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBSlideMenuHeaderView.h"
#import "Masonry.h"

@implementation LBSlideMenuHeaderView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(instancetype)init {
    
    if (!(self = [super init])) return nil;
    
    [self setupUI];
    
    return self;
}

-(void)setupUI {
    
    [self.backgroundImage setImage:[UIImage imageNamed:@"background_1.jpeg"]];
    
    UIImage *avatarImg = [UIImage imageNamed:@"3gviettel.jpeg"];

    [self.cusAvatarImage setImage:avatarImg];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnAlbumBackground:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [self.albumIcon setUserInteractionEnabled:YES];
    [self.albumIcon addGestureRecognizer:tapGesture];
}

-(void)updateConstraints {
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(self.mas_width);
        make.height.equalTo([NSNumber numberWithFloat:[LBSlideMenuHeaderView heightForHeaderView]]);
    }];
    
    
    [super updateConstraints];
}

-(void)layoutSubviews {
    
    self.cusAvatarImage.layer.cornerRadius = self.cusAvatarImage.frame.size.width / 2;
    self.cusAvatarImage.layer.masksToBounds = YES;
}


+(CGFloat)heightForHeaderView {
    
    return 100;
}

+(instancetype)header {
    
    LBSlideMenuHeaderView *headerView = [[LBSlideMenuHeaderView alloc] init];
    
    if (headerView) {
        
        headerView.contentView =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:headerView options:nil] firstObject];
        
        [headerView addSubview:headerView.contentView];
        [headerView setupUI];
        
        return headerView;
    }
    
    return nil;
}

-(void)tapOnAlbumBackground:(UITapGestureRecognizer *)recognizer {
    
    [self.slideMenuVC.presenterDelegate showBackgroundSelectorVC];
}


@end
