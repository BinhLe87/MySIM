//
//  LBShopTableViewCell.h
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBShopTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *shopNameLbl;

@property (weak, nonatomic) IBOutlet UILabel *shopAddressLbl;

@property (weak, nonatomic) IBOutlet UILabel *shopDistanceLbl;

@property (weak, nonatomic) IBOutlet UIImageView *distanceIcon;


+(CGFloat)estimatedHeight;

@end
