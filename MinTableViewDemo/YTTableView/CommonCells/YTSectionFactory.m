//
//  SectionFactory.m
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "YTSectionFactory.h"
#import "YTGapCellViewModel.h"


@implementation YTSectionFactory

+ (YTTableViewSection *)gapSectionWithHeight:(CGFloat)hei backgroundColor:(UIColor *)color {
    YTGapCellViewModel *vm = [YTGapCellViewModel new];
    vm.height = hei;
    if (color) {
        vm.lineColor = color;
        vm.backgroundColor = color;
    }

    YTTableViewSection *section = [[YTTableViewSection alloc] initWithSectionKey:@"gap" viewModels:@[vm]];
    return section;
}

@end
