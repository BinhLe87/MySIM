//
//  LBMenuPopoverViewController.h
//  MyViettel
//
//  Created by Le Van Binh on 11/2/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBMenuPopoverTableCell : UITableViewCell

@property(nonatomic) UILabel *itemLbl;

+(CGFloat)estimateRowHeight;

@end

@protocol LBMenuPopoverViewControllerDelegate <NSObject>

-(void)didSelectItem:(id)selectedItem;

@end

@interface LBMenuPopoverViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic) NSMutableArray *items;
@property(nonatomic, weak) id<LBMenuPopoverViewControllerDelegate> menuPopoverDelegate;


@end
