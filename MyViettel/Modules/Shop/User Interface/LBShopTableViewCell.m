//
//  LBShopTableViewCell.m
//  MyViettel
//
//  Created by Le Van Binh on 11/11/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBShopTableViewCell.h"
#import "Masonry.h"

static CGFloat paddingBetweenShopNameLblAndDistanceLbl = 15;

@implementation LBShopTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.distanceIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.shopDistanceLbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}


-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    CGRect distanceIconFrameRect = self.distanceIcon.frame;
    distanceIconFrameRect.size = CGSizeMake(20, 20);
    distanceIconFrameRect.origin = CGPointMake(self.shopDistanceLbl.frame.origin.x - 20, distanceIconFrameRect.origin.y);
    self.distanceIcon.frame = distanceIconFrameRect;
    
    CGFloat shopDistanceLblWidth = CGRectGetWidth(self.shopDistanceLbl.frame);
    
    /*if (isLandscape) {
        
        shopDistanceLblWidth *= 2;
    }*/
    
    
    CGFloat distanceIconWidth = CGRectGetWidth(self.distanceIcon.frame);
    
    self.shopDistanceLbl.preferredMaxLayoutWidth = shopDistanceLblWidth;
    
    self.shopNameLbl.preferredMaxLayoutWidth = CGRectGetWidth(self.contentView.frame) - shopDistanceLblWidth - distanceIconWidth - paddingBetweenShopNameLblAndDistanceLbl;
    
    self.shopAddressLbl.preferredMaxLayoutWidth = CGRectGetWidth(self.contentView.frame) - shopDistanceLblWidth - distanceIconWidth- paddingBetweenShopNameLblAndDistanceLbl;
    
}

+(CGFloat)estimatedHeight {
    
    return 200;
}


@end
