//
//  LBMenuPopoverViewController.m
//  MyViettel
//
//  Created by Le Van Binh on 11/2/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBMenuPopoverViewController.h"
#import "Masonry.h"

#pragma mark - UITableViewCell
@implementation LBMenuPopoverTableCell {
    
    UIView *seperatorLine;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
    _itemLbl = [[UILabel alloc] init];
    [self.contentView addSubview:_itemLbl];
    _itemLbl.numberOfLines = 0;
    
    seperatorLine = [[UIView alloc] init];
    [self.contentView addSubview:seperatorLine];
    [seperatorLine setBackgroundColor:[UIColor lightGrayColor]];
    [seperatorLine setAlpha:0.6];
    
    [self.contentView setNeedsUpdateConstraints];
    [self.contentView updateConstraintsIfNeeded];
    
    return self;
}

-(void)updateConstraints {
    
    [self.itemLbl mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(5);
        make.left.equalTo(self.contentView).offset(5);
        make.bottom.equalTo(self.contentView).offset(-5);
        make.right.equalTo(self.contentView).offset(-5);
    }];
    
    [seperatorLine mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_bottom).offset(-0.3);
        make.height.equalTo(@0.3);
        
    }];
    
    [super updateConstraints];
}

-(void)layoutSubviews {
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    self.itemLbl.preferredMaxLayoutWidth = CGRectGetWidth(self.itemLbl.frame);
}

+(CGFloat)estimateRowHeight {
    
    return 30;
}


@end;


#pragma mark - UIViewController

@interface LBMenuPopoverViewController ()

@property(nonatomic) UITableView *tableView;

@end

@implementation LBMenuPopoverViewController {
    
    CGRect viewFrame;
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    if(!(self = [super init])) return nil;
    
    viewFrame = frame;
    
    return self;
}

-(void)updateViewConstraints {
    
    [self.view mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@(viewFrame.size.width));
    }];
    
    [super updateViewConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
    
    //style
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    
    [self.tableView registerClass:[LBMenuPopoverTableCell class] forCellReuseIdentifier:NSStringFromClass([LBMenuPopoverTableCell class])];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = [LBMenuPopoverTableCell estimateRowHeight];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LBMenuPopoverTableCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LBMenuPopoverTableCell class]) forIndexPath:indexPath];
    
    id item = [_items objectAtIndex:indexPath.row];
    
    cell.itemLbl.text = [item description];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self.menuPopoverDelegate didSelectItem:[_items objectAtIndex:indexPath.row]];
}



@end
