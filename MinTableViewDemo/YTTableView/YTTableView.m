//
//  YTTableView.m
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "YTTableView.h"
#import "YTCellProtocol.h"
#import "YTTableCellViewModelProtocol.h"
#import "YTTableViewSection.h"
#import "YTSectionFactory.h"
#import "YTGapCellViewModel.h"

@interface YTTableView () <UITableViewDataSource, UITableViewDelegate>


@end

@implementation YTTableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (void)setSections:(NSArray *)sections {
    
    // 处理自动添加分隔线
    for (YTTableViewSection *section in sections) {
        
        if (section.viewModels.count <= 0) {
            continue;
        }
        
        NSMutableArray *vms = [NSMutableArray new];
        
        if (section.sectionTopSeparator) {
            // 插入一条顶部分隔线
            YTGapCellViewModel *gap = [YTGapCellViewModel new];
            gap.height = section.topSeparatorHeight;
            gap.backgroundColor = section.topSeparatorColor;
            [vms addObject:gap];
        }
        
        
        if (section.autoSeparator) {
            
            // 如果只有一个row，不用添加分隔线
            if (section.viewModels.count > 1) {
                
                for (int i = 0; i < section.viewModels.count; i++) {
                    
                    // 先把数据加进去
                    [vms addObject:section.viewModels[i]];
                    
                    if (i < section.viewModels.count - 1) {
                        
                        // 不是最后一条数据就插入一条分隔线
                        YTGapCellViewModel *gap = [YTGapCellViewModel new];
                        gap.height = section.separatorHeight;
                        gap.leftInset = section.separatorLeftInset;
                        gap.rightInset = section.separatorRightInset;
                        gap.backgroundColor = section.separatorBackgroundColor;
                        gap.lineColor = section.separatorColor;
                        [vms addObject:gap];
                    }
                }
            }
            else if (section.viewModels.count == 1) {
                [vms addObjectsFromArray:section.viewModels];
            }
        }
        else {
            [vms addObjectsFromArray:section.viewModels];
        }
        
        if (section.sectionBottomSeparator) {
            // 插入一条底部分隔线
            YTGapCellViewModel *gap = [YTGapCellViewModel new];
            gap.height = section.bottomSeparatorHeight;
            gap.backgroundColor = section.bottomSeparatorColor;
            [vms addObject:gap];
        }
        
        section.viewModels = [vms copy];
    }
    
    _sections = sections;
    
    [self reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YTTableViewSection *sectionModel = self.sections[section];
    return sectionModel.numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YTTableViewSection *sectionModel = self.sections[indexPath.section];
    id <YTTableCellViewModelProtocol> vm = sectionModel.viewModels[indexPath.row];
    
    // 这里会反复注册，看能否有更好的写法。或者在设置sections的时候统一注册？
    [[vm class] registerFor:tableView];
    
    UITableViewCell<YTCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:[[vm class] identifier]];
    [cell configCellWithViewModel:vm];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YTTableViewSection *sectionModel = self.sections[indexPath.section];
    id <YTTableCellViewModelProtocol> vm = sectionModel.viewModels[indexPath.row];
    return [vm cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.didSelectRow) {
        YTTableViewSection *sectionModel = self.sections[indexPath.section];
        self.didSelectRow(sectionModel.viewModels[indexPath.row], sectionModel.sectionKey);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    YTTableViewSection *sectionModel = self.sections[section];
    if (self.viewForSectionHeader) {
        return self.viewForSectionHeader(sectionModel.sectionKey);
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    YTTableViewSection *sectionModel = self.sections[section];
    if (self.heightForSectionHeader) {
        return self.heightForSectionHeader(sectionModel.sectionKey);
    }
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    YTTableViewSection *sectionModel = self.sections[section];
    if (self.viewForSectionFooter) {
        return self.viewForSectionFooter(sectionModel.sectionKey);
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    YTTableViewSection *sectionModel = self.sections[section];
    if (self.heightForSectionFooter) {
        return self.heightForSectionFooter(sectionModel.sectionKey);
    }
    
    return 0;
}

@end
