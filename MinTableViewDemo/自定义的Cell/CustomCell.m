//
//  CustomCell.m
//  MinTableViewDemo
//
//  Created by brant on 2017/12/19.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "CustomCell.h"
#import "CustomCellViewModel.h"

@interface CustomCell ()

@property (weak, nonatomic) IBOutlet UILabel *customLabel;

@end

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellWithViewModel:(id)viewModel {
    CustomCellViewModel *vm = viewModel;
    
    self.customLabel.text = vm.message;
}

@end
