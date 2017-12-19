//
//  YTTableView.h
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DidSelectRow) (id viewModel, NSString *sectionKey);

typedef UIView * (^ViewForSectionHeader) (NSString *sectionKey);
typedef CGFloat (^HeightForSectionHeader) (NSString *sectionKey);

typedef UIView * (^ViewForSectionFooter) (NSString *sectionKey);
typedef CGFloat (^HeightForSectionFooter) (NSString *sectionKey);


/*
 用init方法初始化，不用设置DataSource 和Delegate
 */
@interface YTTableView : UITableView

/*
 设置sections的时候会自动刷新table view
 */
@property (nonatomic, copy) NSArray *sections;

@property (nonatomic, copy) DidSelectRow didSelectRow;  // 点击了cell


/**
 section header view  主要为了保留系统table view的 header 悬停
 */
@property (nonatomic, copy) ViewForSectionHeader viewForSectionHeader;
@property (nonatomic, copy) HeightForSectionHeader heightForSectionHeader;


/**
 section footer view
 */
@property (nonatomic, copy) ViewForSectionFooter viewForSectionFooter;
@property (nonatomic, copy) HeightForSectionFooter heightForSectionFooter;

@end
