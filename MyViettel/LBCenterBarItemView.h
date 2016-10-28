//
//  centerBarItemView.h
//  MyViettel
//
//  Created by Le Van Binh on 10/26/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppNameView : UIView

@property(nonatomic)UIColor *fillColor;

-initWithFillColor:(UIColor*)color;

@end

//-----------------
@interface AppLogoView : UIView

@property(nonatomic)UIColor *strokeColor;

@end


//-----------------
@interface SearchIconView : UIView

@end


//-----------------
@interface LBCenterBarItemView : UIView

@property(nonatomic)UIView *appNameView;
@property(nonatomic)UIView *appLogoView;
@property(nonatomic)UIView *searchIconView;

@end
