//
//  LBAccount.m
//  MyViettel
//
//  Created by Le Van Binh on 10/20/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "LBAccount.h"
#import "LBCustomer.h"

@implementation LBAccount

// Insert code here to add functionality to your managed object subclass
-(NSString *)intro {
    
    if ([self.account_type isEqualToString:@"DATA"]) {
        if ([self.name isEqualToString:@"TK DATA TỐC ĐỘ THẤP"]) {
            
            return [NSString stringWithFormat:@"Quy khach co %@ %@ truy cap Internet den het ngay %@. Sau khi het data toc do cao, bang thong truy cap 3G se bi ha xuong toc do thuong trong khoang tu 32 - 156 kbps. Quy khach co the dang ky mua them dung luong toc do cao bang sach soan tin MAX10 gui den 109.", self.amount, self.unit, self.expired_date];
        } else if ([self.name isEqualToString:@"TK DATA"]){
            
            return [NSString stringWithFormat:@"Quy khach co %@ %@ truy cap Internet den het ngay %@", self.amount, self.unit, self.expired_date];
        }
    }
    
    return @"";
}


@end
