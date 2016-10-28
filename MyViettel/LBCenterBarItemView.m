//
//  centerBarItemView.m
//  MyViettel
//
//  Created by Le Van Binh on 10/26/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBCenterBarItemView.h"
#import "Masonry.h"

#pragma mark - AppNameView
@implementation AppNameView

-(id)initWithFillColor:(UIColor *)color {
    
    if (!(self = [super init])) return nil;
    
    self.fillColor = color;
    
    return self;
}

-(void)drawRect:(CGRect)rect {
    
    CGRect frame = self.bounds;
    
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadow2Color = [UIColor colorWithRed: 0.207 green: 0.814 blue: 0.755 alpha: 0.729];
    
    //// Shadow Declarations
    NSShadow* shadow2 = [[NSShadow alloc] init];
    [shadow2 setShadowColor: [shadow2Color colorWithAlphaComponent: CGColorGetAlpha(shadow2Color.CGColor) * 0.87]];
    [shadow2 setShadowOffset: CGSizeMake(1.1, 1.1)];
    [shadow2 setShadowBlurRadius: 2];
    
    //// Text Drawing
    CGRect textRect = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.00746 + 0.5), CGRectGetMinY(frame) + 1, floor(CGRectGetWidth(frame) * 0.99254 + 0.5) - floor(CGRectGetWidth(frame) * 0.00746 + 0.5), floor((CGRectGetHeight(frame) - 1) * 0.96000 + 0.5));
    {
        NSString* textContent = @"MY SIM";
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow2.shadowOffset, shadow2.shadowBlurRadius, [shadow2.shadowColor CGColor]);
        CGRect textInset = CGRectInset(textRect, 1, 1);
        NSMutableParagraphStyle* textStyle = [NSMutableParagraphStyle new];
        textStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Copperplate-Bold" size: 35], NSForegroundColorAttributeName: [UIColor whiteColor], NSParagraphStyleAttributeName: textStyle};
        
        CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textInset.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, textInset);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(textInset), CGRectGetMinY(textInset) + (CGRectGetHeight(textInset) - textTextHeight) / 2, CGRectGetWidth(textInset), textTextHeight) withAttributes: textFontAttributes];
        CGContextRestoreGState(context);
        CGContextRestoreGState(context);
        
    }
}
@end

#pragma mark - AppLogoView

@implementation AppLogoView

-(void)drawRect:(CGRect)rect {
    
    CGRect frame2 = self.bounds;
    //// Subframes
    CGRect group2 = CGRectMake(CGRectGetMinX(frame2) + floor((CGRectGetWidth(frame2) - 23) * 0.50000 + 0.5), CGRectGetMinY(frame2) + floor((CGRectGetHeight(frame2) - 23) * 0.50000 + 0.5), 23, 23);
    
    
    //// Group 2
    {
        //// Group
        {
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 4.4, CGRectGetMinY(group2) + 7.44)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group2) + 2.28, CGRectGetMinY(group2) + 9.56)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group2) + 9.35, CGRectGetMinY(group2) + 16.63)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group2) + 11.47, CGRectGetMinY(group2) + 14.51)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group2) + 4.4, CGRectGetMinY(group2) + 7.44)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 18.99, CGRectGetMinY(group2) + 8.89)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group2) + 10.5, CGRectGetMinY(group2) + 17.38)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group2) + 12.62, CGRectGetMinY(group2) + 19.5)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group2) + 21.11, CGRectGetMinY(group2) + 11.01)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group2) + 18.99, CGRectGetMinY(group2) + 8.89)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group2) + 23, CGRectGetMinY(group2) + 11.5)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 11.5, CGRectGetMinY(group2) + 23) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 23, CGRectGetMinY(group2) + 17.85) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 17.85, CGRectGetMinY(group2) + 23)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2), CGRectGetMinY(group2) + 11.5) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 5.15, CGRectGetMinY(group2) + 23) controlPoint2: CGPointMake(CGRectGetMinX(group2), CGRectGetMinY(group2) + 17.85)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 2.47, CGRectGetMinY(group2) + 4.38) controlPoint1: CGPointMake(CGRectGetMinX(group2), CGRectGetMinY(group2) + 8.81) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 0.92, CGRectGetMinY(group2) + 6.34)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 4.51, CGRectGetMinY(group2) + 2.37) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 3.06, CGRectGetMinY(group2) + 3.63) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 3.75, CGRectGetMinY(group2) + 2.95)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 11.5, CGRectGetMinY(group2)) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 6.44, CGRectGetMinY(group2) + 0.88) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 8.87, CGRectGetMinY(group2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group2) + 23, CGRectGetMinY(group2) + 11.5) controlPoint1: CGPointMake(CGRectGetMinX(group2) + 17.85, CGRectGetMinY(group2)) controlPoint2: CGPointMake(CGRectGetMinX(group2) + 23, CGRectGetMinY(group2) + 5.15)];
            [bezier2Path closePath];
            [UIColor.whiteColor setFill];
            [bezier2Path fill];
            [UIColor.lightGrayColor setStroke];
            bezier2Path.lineWidth = 1;
            [bezier2Path stroke];
        }
    }
}

@end


#pragma mark - SearchIconView
@implementation SearchIconView

-(void)drawRect:(CGRect)rect {
    
    CGRect frame3 = self.bounds;
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* searchIconStrokeColor = [UIColor whiteColor];
    
    
    //// Subframes
    CGRect group3 = CGRectMake(CGRectGetMinX(frame3) + floor((CGRectGetWidth(frame3) - 20.17) * 0.62067 + 0.5), CGRectGetMinY(frame3) + floor((CGRectGetHeight(frame3) - 20.55) * 0.57985 + 0.05) + 0.45, 20.17, 20.55);
    
    
    //// Group 3
    {
        //// Group
        {
            //// Oval 2 Drawing
            UIBezierPath* oval2Path = [UIBezierPath bezierPath];
            [oval2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 16.44, CGRectGetMinY(group3) + 8.53)];
            [oval2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 8.22, CGRectGetMinY(group3) + 17.07) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 16.44, CGRectGetMinY(group3) + 13.24) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 12.76, CGRectGetMinY(group3) + 17.07)];
            [oval2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3), CGRectGetMinY(group3) + 8.53) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 3.68, CGRectGetMinY(group3) + 17.07) controlPoint2: CGPointMake(CGRectGetMinX(group3), CGRectGetMinY(group3) + 13.24)];
            [oval2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 8.22, CGRectGetMinY(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3), CGRectGetMinY(group3) + 3.82) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 3.68, CGRectGetMinY(group3))];
            [oval2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 16.44, CGRectGetMinY(group3) + 8.53) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 12.76, CGRectGetMinY(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 16.44, CGRectGetMinY(group3) + 3.82)];
            [oval2Path closePath];
            [searchIconStrokeColor setStroke];
            oval2Path.lineWidth = 2;
            [oval2Path stroke];
            
            
            //// Rectangle 3 Drawing
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, CGRectGetMinX(group3) + 11.08, CGRectGetMinY(group3) + 16.19);
            CGContextRotateCTM(context, 41.04 * M_PI / 180);
            
            UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(0.22, -3.6, 8.69, 1.63)];
            [searchIconStrokeColor setFill];
            [rectangle3Path fill];
            
            CGContextRestoreGState(context);
        }
    }
}

@end

#pragma mark - centerBarItemView
@interface LBCenterBarItemView()

@property(nonatomic) int topPadding;
@property(nonatomic) int bottomPadding;
@property(nonatomic) int leftRightPadding;

@end

@implementation LBCenterBarItemView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(int)topPadding {
    
    return 2;
}

-(int)bottomPadding {

    return 2;
}

-(int)leftRightPadding {
    
    if (isPortrait) return 10;

    return 20;
}

-(UIView *)appNameView {
    
    if (_appNameView) return _appNameView;
    _appNameView = [[AppNameView alloc] initWithFillColor:[UIColor whiteColor]];
    [_appNameView setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:_appNameView];
    
    return _appNameView;
}

-(UIView *)appLogoView {
    
    if (_appLogoView) return _appLogoView;
    
    _appLogoView = [[AppLogoView alloc] init];
    [_appLogoView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_appLogoView];
    
    return _appLogoView;
}

-(UIView *)searchIconView {
    
    if (_searchIconView) return _searchIconView;
    
    _searchIconView = [[SearchIconView alloc] init];
    [_searchIconView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_searchIconView];
    
    return _searchIconView;
}



-(void)updateConstraints {
    
    [self.appNameView mas_updateConstraints:^(MASConstraintMaker *make) {
      
        make.top.equalTo(self).offset(self.topPadding);
        make.bottom.equalTo(self).offset(-self.bottomPadding);
    }];
    
    [self.searchIconView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self).offset(self.topPadding);
        make.bottom.equalTo(self).offset(-self.bottomPadding);
        make.right.equalTo(self);
        make.width.equalTo(@(CGRectGetHeight(self.frame) - self.topPadding - self.bottomPadding));
    }];
    
    [self.appLogoView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self).offset(self.topPadding);
        make.bottom.equalTo(self).offset(-self.bottomPadding);
        make.right.equalTo(self.searchIconView.mas_left).offset(-self.leftRightPadding);
        make.width.equalTo(@(CGRectGetHeight(self.frame) - self.topPadding - self.bottomPadding));
    }];
    
    [self.appNameView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self).offset(self.topPadding);
        make.bottom.equalTo(self).offset(-self.bottomPadding);
        make.right.equalTo(self.appLogoView.mas_left).offset(-self.leftRightPadding);
        make.left.equalTo(self).offset(self.leftRightPadding);
    }];
    
    [super updateConstraints];
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
}



@end
