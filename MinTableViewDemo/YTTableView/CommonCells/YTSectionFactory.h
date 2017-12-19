//
//  YTSectionFactory.h
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTTableCellViewModelProtocol.h"
#import "YTTableViewSection.h"

@interface YTSectionFactory : NSObject


/**
 生成一个分隔section

 @param hei 分隔的高度
 @param color 分隔的底色
 @return section
 */
+ (YTTableViewSection *)gapSectionWithHeight:(CGFloat)hei backgroundColor:(UIColor *)color;

@end
