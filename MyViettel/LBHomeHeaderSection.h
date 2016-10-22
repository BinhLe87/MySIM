//
//  LBHomeHeaderSection.h
//  MyViettel
//
//  Created by Le Van Binh on 10/21/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBHomeViewController.h"

extern int const heightForHeaderView;
@interface LBHomeHeaderSection : UITableViewHeaderFooterView

+(NSString*)identifier;
+(CGFloat)heightForHeaderSection;
@property(nonatomic) HomeTableSectionType tableSectionType;
@property(nonatomic) NSUInteger numRowsInSection;

@end
