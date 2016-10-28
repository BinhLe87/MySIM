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
#import <MagicalRecord.h>

@interface LBSlideMenuPresenter()

@property(nonatomic)LBCustomer *customer;

@end

@implementation LBSlideMenuPresenter


#pragma mark - Initializers
-(LBCustomer *)customer {
    
    if (_customer) return _customer;
    
    NSEntityDescription *customerDescription = [NSEntityDescription entityForName:NSStringFromClass([LBCustomer class]) inManagedObjectContext:[NSManagedObjectContext MR_context]];
    
    _customer = [[LBCustomer alloc] initWithEntity:customerDescription insertIntoManagedObjectContext:nil];
    
    return _customer;
}

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
    
    //fetch cus info from NSUserDefaults
    NSDictionary *cusInfoDic = [UserDefaults dictionaryForKey:UserDefaultsKey(KEYS_CUS_INFO(extern_cus_phone))];
    
    NSLog(@"%@", [cusInfoDic objectForKey:@"cus_name"]);
    
    
    [self.customer setName:[cusInfoDic objectForKey:@"cus_name"]];
    [self.customer setPhone:[cusInfoDic objectForKey:@"cus_phone"]];
    [self.customer setAvatar_link:[cusInfoDic objectForKey:@"avatar_link"]];
    [self.customer setBackgroundImg:[cusInfoDic objectForKey:@"backgroundImg"]];
    
    [_slideMenuVCDelegate showData:self.customer menuItemArray:self.menuTableViewCells];
}

-(void)showBackgroundSelectorVC {
    
    [self.slideMenuRouterDelegate showSlideMenuBackgroundSelectorVC];
}

-(void)didSelectBackgroundImage:(UIImage *)selectedBackgroundImg {
    
    //store selected background to disk for later use
    [[SDImageCache sharedImageCache] storeImage:selectedBackgroundImg forKey:[selectedBackgroundImg accessibilityIdentifier]];
    
    //store in NSUserDefaults
    NSMutableDictionary *cusInfoDic = [[UserDefaults dictionaryForKey:KEYS_CUS_INFO(extern_cus_phone)] mutableCopy];
    
    [cusInfoDic setObject:[selectedBackgroundImg accessibilityIdentifier] forKey:@"backgroundImg"];
    
    [self.slideMenuVCDelegate updateBackgroundImage:selectedBackgroundImg];
    [self.slideMenuRouterDelegate dismissSlideMenuBackgroundSelectorVC];
}

@end
