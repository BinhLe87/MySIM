//
//  SlideMenuPresenter.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBSlideMenuPresenter.h"
#import "LBSideMenuTableViewCell.h"
#import "SDImageCache.h"


@implementation LBSlideMenuPresenter

-(NSArray *)menuTableViewCells {
    
    if (_menuTableViewCells) return _menuTableViewCells;
    
    LBSideMenuTableViewCell *menuItem1 = [[LBSideMenuTableViewCell alloc] initWithIconAndTitle:[UIImage imageNamed:@"user-3.png"] menuItemTitle:@"Thông tin khách hàng" hasSeperatorLine:NO];
    
        LBSideMenuTableViewCell *menuItem3 = [[LBSideMenuTableViewCell alloc] initWithIconAndTitle:[UIImage imageNamed:@"locked-2.png"] menuItemTitle:@"Đổi mật khẩu" hasSeperatorLine:YES];
    
    LBSideMenuTableViewCell *menuItem2 = [[LBSideMenuTableViewCell alloc] initWithIconAndTitle:[UIImage imageNamed:@"worldwide.png"] menuItemTitle:@"Chia sẻ cho bạn bè" hasSeperatorLine:YES];
    
    
    
    _menuTableViewCells = [[NSArray alloc] initWithObjects:menuItem1, menuItem3, menuItem2, nil];
    
    return _menuTableViewCells;
}


#pragma mark - LBSlideMenuPresenterDelegate
-(void)getData {
    
    UIImage *backgroundImg = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:LB_CUSTOMER_AVATAR_KEY];
    
    [_slideMenuVCDelegate showData:self.menuTableViewCells backgroundImgInHeaderView:backgroundImg];
}

-(void)showBackgroundSelectorVC {
    
    [self.slideMenuRouterDelegate showSlideMenuBackgroundSelectorVC];
}

-(void)didSelectBackgroundImage:(UIImage *)selectedBackgroundImg {
    
    //store selected background to disk for later use
    [[SDImageCache sharedImageCache] storeImage:selectedBackgroundImg forKey:LB_CUSTOMER_AVATAR_KEY];
    
    [self.slideMenuVCDelegate updateBackgroundImage:selectedBackgroundImg];
    [self.slideMenuRouterDelegate dismissSlideMenuBackgroundSelectorVC];
}

@end
