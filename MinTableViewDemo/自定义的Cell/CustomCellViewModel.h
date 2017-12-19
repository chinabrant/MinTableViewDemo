//
//  CustomCellViewModel.h
//  MinTableViewDemo
//
//  Created by brant on 2017/12/19.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTTableCellViewModelProtocol.h"

@interface CustomCellViewModel : NSObject <YTTableCellViewModelProtocol>

@property (nonatomic, copy) NSString *message;

@end
