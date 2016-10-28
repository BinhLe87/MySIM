//
//  LBMyViettelConstants.h
//  MyViettel
//
//  Created by Le Van Binh on 10/19/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LB_DEFAULT_AVATAR @"3gviettel.jpeg"
#define LB_DEFAULT_BACKGROUND @"background_2.jpeg"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//TODO:NSUserDefaults
#define UserDefaults [NSUserDefaults standardUserDefaults]
#define UserDefaultsKey(key) [NSString stringWithFormat:@"LBComp.MyViettel.%@",key]
#define KEYS_CUS_INFO(phone) [NSString stringWithFormat:@"CUS_INFO_%@",phone]


extern NSString* extern_cus_phone;