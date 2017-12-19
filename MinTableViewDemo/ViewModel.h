//
//  ViewModel.h
//  MinTableViewDemo
//
//  Created by brant on 2017/12/19.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTNormalCellViewModel.h"
#import "YTTableViewSection.h"
#import "CustomCellViewModel.h"

@interface ViewModel : NSObject

@property (nonatomic, copy) NSArray *sections;

@end
