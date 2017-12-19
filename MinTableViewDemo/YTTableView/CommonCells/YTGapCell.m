//
//  YTGapCell.m
//  TableViewDemo
//
//  Created by brant on 2017/12/7.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "YTGapCell.h"
#import "YTGapCellViewModel.h"

@interface YTGapCell ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) YTGapCellViewModel *viewModel;

@end

@implementation YTGapCell

+ (void)registerFor:(UITableView *)table {
    [table registerClass:[YTGapCell class] forCellReuseIdentifier:[YTGapCellViewModel identifier]];
}

- (void)configCellWithViewModel:(id)viewModel {
    YTGapCellViewModel *vm = viewModel;
    
    self.viewModel = viewModel;
    
    if (vm.backgroundColor) {
        
        self.contentView.backgroundColor = vm.backgroundColor;
        self.lineView.backgroundColor = vm.lineColor;
    }
    
    self.lineView.frame = CGRectMake(self.viewModel.leftInset,
                                     0,
                                     self.contentView.frame.size.width - self.viewModel.leftInset - self.viewModel.rightInset,
                                     self.viewModel.height);
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.lineView.frame = CGRectMake(self.viewModel.leftInset,
                                     0,
                                     self.contentView.frame.size.width - self.viewModel.leftInset - self.viewModel.rightInset,
                                     self.viewModel.height);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 去除点击效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.lineView];
        
    }
    
    return self;
}

#pragma mark - lazy load

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
    }
    
    return _lineView;
}

@end
