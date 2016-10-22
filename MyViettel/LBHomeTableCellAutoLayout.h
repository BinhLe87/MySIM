//
//  LBHomeTableCellAutoLayout.h
//  MyViettel
//
//  Created by Le Van Binh on 10/22/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBHomeTableCellAutoLayout : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *rowAvatar;

@property (weak, nonatomic) IBOutlet UILabel *rowTitle;

@property (weak, nonatomic) IBOutlet UILabel *rowContent;

@property (nonatomic) UIView *separatorCellLine;



+(CGFloat)estimatedCellHeight;
-(CGFloat)calculateHeightRow;

@end
