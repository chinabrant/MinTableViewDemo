//
//  ViewModel.m
//  MinTableViewDemo
//
//  Created by brant on 2017/12/19.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "ViewModel.h"
#import "YTSectionFactory.h"

@implementation ViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
    
        NSArray *titles = @[@"用户名", @"手机号", @"邮箱"];
        NSMutableArray *arr = [NSMutableArray new];
        for (int i = 0; i < 3; i++) {
            YTNormalCellViewModel *vm = [[YTNormalCellViewModel alloc] init];
            vm.leftTitle = titles[i];
            vm.isShowArrow = YES;
            vm.arrowImage = @"arrow";
            [arr addObject:vm];
        }
        
        YTTableViewSection *sectionOne = [[YTTableViewSection alloc] initWithSectionKey:@"one" viewModels:[arr copy]];
        // section顶部的分隔线
        sectionOne.sectionTopSeparator = YES;
        // section 底部的分隔线
        sectionOne.sectionBottomSeparator = YES;
        // section中间自动加入分隔线
        sectionOne.autoSeparator = YES;
        // 是间分隔线的缩进
        sectionOne.separatorLeftInset = 12;
        sectionOne.separatorBackgroundColor = [UIColor whiteColor]; // 注意这个属性。分隔线也是能一个row的形式存在的，有缩进的时候可能会有要设置背景色的情况出现。默认就是白色的
        
        // section的分隔，也可以用YTTableView暴露出来的block处理
        YTTableViewSection *separatorSection = [YTSectionFactory gapSectionWithHeight:7 backgroundColor:[UIColor colorWithRed:0xef/255.0 green:0xef/255.0 blue:0xef/255.0 alpha:1]];
        
        CustomCellViewModel *custom = [[CustomCellViewModel alloc] init];
        custom.message = @"数据在初始化cellViewModel的时候丢进去。也可以在view controller的viewModel中持有这个cell的viewmodel，网络返回后再改变数据，cell里面监听改变或者直接有变化后reloadData. 也可以在网络数据返回后再初始化数据。";
        YTTableViewSection *sectionTwo = [[YTTableViewSection alloc] initWithSectionKey:@"two" viewModels:@[custom]];
        
        
        self.sections = @[sectionOne, separatorSection, sectionTwo];
    }
    return self;
}

@end
